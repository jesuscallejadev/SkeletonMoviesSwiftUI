//
//  MovieDetailViewModel.swift
//  SkeletonMoviesSwiftUI
//
//  Created by Jesus Calleja Rodriguez on 2/11/23.
//

import Foundation

class MovieDetailViewModel: ObservableObject {
    
    //    MARK: Properties
    
    @Published private(set) var movie: Movie
    
    // MARK: - Init

    init(movie: Movie)  {
        self.movie = movie
    }
}
