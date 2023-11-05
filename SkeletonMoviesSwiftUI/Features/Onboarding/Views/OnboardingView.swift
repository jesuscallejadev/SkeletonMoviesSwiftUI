//
//  OnboardingView.swift
//  SkeletonMoviesSwiftUI
//
//  Created by Jesus Calleja Rodriguez on 2/11/23.
//

import SwiftUI

struct OnboardingView: View {
    
    // MARK: Properties
    
    @StateObject var viewModel: OnboardingViewModel
    @EnvironmentObject var router: Router
    @State var selectedPage = 0
    
    var body: some View {
        
        ZStack{
            
            TabView(selection: $selectedPage)
            {
                ForEach(0..<self.viewModel.onBoardingData.count){
                    index in CardView(card : self.viewModel.onBoardingData[index]).tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            
            
            Button(action : {
                if(self.selectedPage >= self.viewModel.onBoardingData.count - 1) {
                    self.viewModel.onOnboardingFinished()
                    self.router.navigate(to: .movieList)
                } else {
                    self.selectedPage += 1
                }
                
            })
            {
                Image(systemName: Constants.Images.next)
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 32, height: 32)
            }
            
            .offset(x: 150, y: 350)
            
            
            switch self.selectedPage {
            case 0:
                ZStack{
                    LottieView(name: Constants.Animations.movies, loopMode: .loop)
                        .frame(width: 250, height: 250)
                        .clipShape(Circle())
                        .shadow(color: .black, radius: 1, x: 0, y: 0)
                        .offset(x: 0, y: -200)
                }
            case 1:
                ZStack{
                    LottieView(name: Constants.Animations.search, loopMode: .loop)
                        .frame(width: 250, height: 250)
                        .clipShape(Circle())
                        .shadow(color: .black, radius: 1, x: 0, y: 0)
                        .offset(x: 0, y: -200)
                }
            case 2:
                ZStack{
                    LottieView(name: Constants.Animations.movieDetails, loopMode: .loop)
                        .frame(width: 250, height: 250)
                        .shadow(color: .black, radius: 1, x: 0, y: 0)
                        .clipShape(Circle())
                        .offset(x: 0, y: -200)
                }
            default:
                EmptyView()
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    OnboardingView(viewModel: OnboardingViewModel(userData: UserData()))
}
