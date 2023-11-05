//
//  SplashView.swift
//  SkeletonMoviesSwiftUI
//
//  Created by Jesus Calleja Rodriguez on 2/11/23.
//

import Foundation


import SwiftUI

struct SplashView: View {
    
    // MARK: Properties
    
    @EnvironmentObject var router: Router
    @StateObject var viewModel: SplashViewModel
    
    var body: some View {
        VStack(alignment: .center) {
            Image(Constants.Images.logo)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.leading, 24)
                .padding(.trailing, 24)
        }
        .frame(minHeight: 0, maxHeight: .infinity)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation {
                    if self.viewModel.userData.isFirstLaunch {
                        self.router.navigate(to: .onboarding)
                    } else {
                        self.router.navigate(to: .movieList)
                    }
                }
            }
        }
    }
}

#Preview {
    SplashView(viewModel: SplashViewModel(userData: UserData(), logManager: LogManager.shared))
}
