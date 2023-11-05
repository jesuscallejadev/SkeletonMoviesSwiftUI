//
//  OnboardingViewModel.swift
//  SkeletonMoviesSwiftUI
//
//  Created by Jesus Calleja Rodriguez on 2/11/23.
//

import Foundation

class OnboardingViewModel: ObservableObject {

    //    MARK: Public properties

    @Published var userData: UserData
    
    var onBoardingData: [Card] = [
        Card(title: Localize().get("onboarding_first_title"), description: Localize().get("onboarding_first_description")),
        Card(title: Localize().get("onboarding_second_title"), description: Localize().get("onboarding_second_description")),
        Card(title: Localize().get("onboarding_third_title"), description: Localize().get("onboarding_third_description"))
    ]
    

    // MARK: - Init

    init(userData: UserData) {
        self.userData = userData
    }
    
    // MARK: - Public methods
    
    func onOnboardingFinished() {
        self.userData.isFirstLaunch = false
    }
}
