//
//  MovieDetailView.swift
//  SkeletonMoviesSwiftUI
//
//  Created by Jesus Calleja Rodriguez on 2/11/23.
//

import SwiftUI

struct MovieDetailView: View {
    
    // MARK: Properties
    
    @StateObject var viewModel: MovieDetailViewModel
    
    var body: some View {
        VStack(alignment: .center) {
            AsyncImage(url: URL(string: self.viewModel.movie.imageUrl)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .frame(width: 240, height: 300)
                        .aspectRatio(contentMode: .fit)
                } else if phase.error != nil {
                    Image(Constants.Images.moviesPlaceholder)
                        .resizable()
                        .frame(width: 240, height: 300)
                        .aspectRatio(contentMode: .fit)
                } else {
                    ProgressView()
                        .frame(width: 240, height: 300)
                }
            }
            if !self.viewModel.movie.releaseDate.isEmpty {
                Text(Localize().get("release_date") + self.viewModel.movie.releaseDate)
                    .font(.subheadline)
                    .padding(.top, 16)
            }
            Text(self.viewModel.movie.title)
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.top, 24)
            Text(self.viewModel.movie.overview)
                .font(.subheadline)
                .fontWeight(.heavy)
                .padding(.top, 16)
        }
        .padding(.leading, 16)
        .padding(.trailing, 16)
    }
}


#Preview {
    MovieDetailView(viewModel: MovieDetailViewModel(movie: Movie()))
}
