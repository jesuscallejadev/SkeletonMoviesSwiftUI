//
//  ViewFactory.swift
//  SkeletonMoviesSwiftUI
//
//  Created by Jesus Calleja Rodriguez on 5/11/23.
//

import SwiftUI

class ViewFactory {
    
    // MARK: Singleton
    
    static let shared = ViewFactory()
    
    // MARK: Public methods
    
    func getSplashView(userData: UserData, logManager: LogManager) -> some View {
        return SplashView(viewModel: SplashViewModel(userData: userData, logManager: logManager))
    }
    
    func getOnboardingView(userData: UserData) -> some View {
        return OnboardingView(viewModel: OnboardingViewModel(userData: userData))
    }
    
    func getMovieListView() -> some View {
        return MovieListView(viewModel: MovieListViewModel(networkManager: NetworkManager.shared))
            .navigationBarTitle(Localize().get("app_title"), displayMode: .inline)
    }
    
    func getMovieDetailView(movie: Movie) -> some View {
        return MovieDetailView(viewModel: MovieDetailViewModel(movie: movie))
            .navigationBarTitle(Localize().get("movie_detail_title"), displayMode: .inline)
    }
}

