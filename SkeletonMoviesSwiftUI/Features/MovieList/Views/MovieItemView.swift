//
//  MovieItemView.swift
//  SkeletonMoviesSwiftUI
//
//  Created by Jesus Calleja Rodriguez on 4/11/23.
//

import SwiftUI

struct MovieItemView: View {
    
    // MARK: Properties
    
    let movie: Movie
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: self.movie.imageUrl)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .frame(width: 80, height: 100)
                        .aspectRatio(contentMode: .fit)
                } else if phase.error != nil {
                    Image(Constants.Images.moviesPlaceholder)
                        .resizable()
                        .frame(width: 80, height: 100)
                        .aspectRatio(contentMode: .fit)
                } else {
                    ProgressView()
                        .frame(width: 80, height: 100)
                }
            }
            VStack(alignment: .leading) {
                Text(self.movie.title)
                    .font(.headline)
                if !self.movie.releaseDate.isEmpty {
                    Text(Localize().get("release_date") + self.movie.releaseDate)
                        .font(.subheadline)
                        .padding(.top, 24)
                }
            }
            .padding(.leading, 16)
        }
    }
}

#Preview {
   MovieItemView(movie: Movie())
}



