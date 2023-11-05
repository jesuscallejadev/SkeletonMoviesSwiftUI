//
//  MovieListViewModel.swift
//  SkeletonMoviesSwiftUI
//
//  Created by Jesus Calleja Rodriguez on 2/11/23.
//

import SwiftUI
import Combine

extension MovieListViewModel {
    enum ViewState {
        case loading
        case fetching
        case finished
    }
}

class MovieListViewModel: ObservableObject {
    
    //    MARK: Properties
    
    @Published private(set) var error: NetworkManager.NetworkError?
    @Published private var viewState: ViewState?
    @Published var hasError = false
    private(set) var movies: [Movie]
    private(set) var totalPages: Int
    private(set) var currentPage: Int
    private let networkManager: NetworkManagerImpl
    
    var isLoading: Bool {
        self.viewState == .loading
    }
    
    var isFetching: Bool {
        self.viewState == .fetching
    }
    
    var isFinished: Bool {
        self.viewState == .finished
    }
    
    // MARK: - Init
    
    init(networkManager: NetworkManagerImpl) {
        self.movies = []
        self.viewState = .loading
        self.networkManager = networkManager
        self.currentPage = Constants.API.Pagination.startPage
        self.totalPages = Constants.API.Pagination.endPage
    }
    
    // MARK: - Public methods
    
    func onLoadMovies() {
        Task {
            await self.fetchMovies()
        }
    }
    
    func onMovieSeach(title: String) {
        Task {
            await self.searchMovies(title: title)
        }
    }
    
    func onLoadMoreMovies() {
        Task {
            await self.fetchMoreMovies()
        }
    }
    
    func hasReachEnd(of movie: Movie) -> Bool {
        self.movies.last?.id == movie.id
    }
    
    // MARK: - Private methods
    
    private func reset() {
        if self.viewState == .finished {
            self.movies.removeAll()
            self.currentPage = Constants.API.Pagination.startPage
            self.viewState = .loading
        }
    }
    
    @MainActor
    private func fetchMovies() async {

        self.reset()
        
        self.viewState = .fetching
        
        do {
            let response = try await self.networkManager.request(session: .shared, .getMovies(page: self.currentPage), type: MoviesData.self)
            guard let results = response.results else { return }
            self.movies = results.map { Movie(movie: $0) }
            self.viewState = .finished
        } catch {
            self.viewState = .finished
            self.hasError = true
            if let networkingError = error as? NetworkManager.NetworkError {
                self.error = networkingError
                LogWarn("Error: \(networkingError.errorDescription ?? "")")
            } else {
                self.error = .custom(error: error)
                LogWarn(error.localizedDescription)
            }
        }
    }
    
    @MainActor
    private func fetchMoreMovies() async {
        
        guard currentPage != totalPages else { return }
        
        self.viewState = .fetching
        
        self.currentPage += 1
        do {
            let response = try await self.networkManager.request(session: .shared, .getMovies(page: self.currentPage), type: MoviesData.self)
            guard let results = response.results else { return }
            self.movies += results.map { Movie(movie: $0) }
            self.viewState = .finished
        } catch {
            self.viewState = .finished
            self.hasError = true
            if let networkingError = error as? NetworkManager.NetworkError {
                self.error = networkingError
                LogWarn("Error: \(networkingError.errorDescription ?? "")")
            } else {
                self.error = .custom(error: error)
                LogWarn(error.localizedDescription)
            }
        }
    }
    
    @MainActor
    private func searchMovies(title: String) async {
        
        self.viewState = .fetching
        
        var uniqueMoviesSet = Set<Movie>(self.movies)
        
        do {
            let response = try await self.networkManager.request(session: .shared, .searchMovies(title: title), type: MoviesData.self)
            guard let results = response.results else { return }
            uniqueMoviesSet.formUnion(results.map { Movie(movie: $0) })
            self.movies = Array(uniqueMoviesSet)
            self.viewState = .finished
        } catch {
            self.viewState = .finished
            self.hasError = true
            if let networkingError = error as? NetworkManager.NetworkError {
                self.error = networkingError
                LogWarn("Error: \(networkingError.errorDescription ?? "")")
            } else {
                self.error = .custom(error: error)
                LogWarn(error.localizedDescription)
            }
        }
    }
}
