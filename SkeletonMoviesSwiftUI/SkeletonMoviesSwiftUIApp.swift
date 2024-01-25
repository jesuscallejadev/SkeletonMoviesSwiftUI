//
//  SkeletonMoviesSwiftUIApp.swift
//  SkeletonMoviesSwiftUI
//
//  Created by Jesus Calleja Rodriguez on 2/11/23.
//

import SwiftUI

@main
struct SkeletonMoviesSwiftUIApp: App {
    
    // MARK: Public properties
    // test github
    
    @ObservedObject var router = Router()
    
    // MARK: Private properties
    
    private let userData = UserData()
    private let logManager = LogManager.shared
    private let viewFactory = ViewFactory.shared
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navPath) {
                self.viewFactory.getSplashView(userData: self.userData, logManager: self.logManager)
                    .navigationDestination(for: Router.Destination.self) { destination in
                        switch destination {
                        case .onboarding:
                            self.viewFactory.getOnboardingView(userData: self.userData)
                        case .movieList:
                            self.viewFactory.getMovieListView()
                        case .movieDetail(let movie):
                            self.viewFactory.getMovieDetailView(movie: movie)
                        }
                    }
            }
        }
        .environmentObject(router)
    }
}
