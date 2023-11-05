//
//  SplashViewModel.swift
//  SkeletonMoviesSwiftUI
//
//  Created by Jesus Calleja Rodriguez on 2/11/23.
//

import Foundation

class SplashViewModel: ObservableObject {

    //    MARK: Properties

    @Published var userData: UserData
    private let logManager: LogManager

    // MARK: - Init

    init(userData: UserData, logManager: LogManager) {
        self.userData = userData
        self.logManager = logManager
        self.enableLog()
    }
    
    // MARK: - Public methods
    
    func checkUserData() {
        self.userData.isFirstLaunch = false
    }
    
    private func enableLog() {
        self.logManager.logLevel = .debug
        self.logManager.logStyle = .funny
    }
}

