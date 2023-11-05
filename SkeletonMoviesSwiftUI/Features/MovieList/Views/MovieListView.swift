//
//  MovieListView.swift
//  SkeletonMoviesSwiftUI
//
//  Created by Jesus Calleja Rodriguez on 2/11/23.
//

import SwiftUI

struct MovieListView: View {
    
    // MARK: Properties
    
    @EnvironmentObject var router: Router
    @StateObject var viewModel: MovieListViewModel
    @State private var searchQuery = ""
    
    var filteredMovies: [Movie] {
        if self.searchQuery.isEmpty {
            return self.viewModel.movies
        }
        
        let filteredMovies =  self.viewModel.movies.compactMap { movie in
            let titleContainsQuery = movie.title.range(of: self.searchQuery, options: .caseInsensitive) != nil
            return titleContainsQuery ? movie : nil
        }
        
        return filteredMovies
    }
    
    var body: some View {
        ZStack {
            if self.viewModel.isLoading {
                ProgressView()
            } else {
                List(self.filteredMovies, id: \.id) { movie in
                    MovieItemView(movie: movie)
                        .onTapGesture {
                            self.router.navigate(to: .movieDetail(movie: movie))
                        }
                        .task {
                            if self.viewModel.hasReachEnd(of: movie) && self.viewModel.isFinished {
                                self.viewModel.onLoadMoreMovies()
                            }
                        }
                }
                .overlay(alignment: .bottom) {
                    if self.viewModel.isFetching {
                        ProgressView()
                    }
                }
                
                //MARK: Filter
                
                .searchable(text: $searchQuery, prompt: Localize().get("search_movies"))
                
                //MARK: Fetch movies by title when user finishes the search
                
                .onSubmit(of: .search) {
                    if self.viewModel.isFinished {
                        self.viewModel.onMovieSeach(title: self.searchQuery)
                    }
                }
                
                //MARK: Pull to refresh
                
                .refreshable {
                    if self.searchQuery.isEmpty && self.viewModel.isFinished  {
                        self.viewModel.onLoadMovies()
                    }
                }
            }
        }
        .onAppear {
            if self.viewModel.isLoading {
                self.viewModel.onLoadMovies()
            }
        }
        
        //MARK: Handle empty state
        
        .overlay(alignment: .bottom) {
            if self.filteredMovies.isEmpty && self.viewModel.isFinished   {
                ContentUnavailableView.search
            }
        }
        .alert(isPresented: $viewModel.hasError,
               error: self.viewModel.error) {
            Button(Localize().get("accept")) {}
        }
               .navigationBarBackButtonHidden()
        
    }
}

#Preview {
    MovieListView(viewModel: MovieListViewModel(networkManager: NetworkManager.shared))
}
