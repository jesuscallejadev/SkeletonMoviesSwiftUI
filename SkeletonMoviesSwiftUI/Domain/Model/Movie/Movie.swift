//
//  Movie.swift
//  SkeletonMoviesSwiftUI
//
//  Created by Jesus Calleja Rodriguez on 2/11/23.
//

import Foundation

struct Movie: Codable {
    let id: Int
    let title: String
    let overview: String
    var releaseDate: String
    let imageUrl: String
    
    // MARK: - Init
    
    init() {
        self.id = 0
        self.title = ""
        self.overview = ""
        self.releaseDate = ""
        self.imageUrl = ""
    }
    
    // MARK: - DTO to Domain
    
    init(movie: MovieResultData) {
        self.id = movie.id ?? 0
        self.title = movie.title ?? ""
        self.overview = movie.overview ?? ""
        self.releaseDate = movie.releaseDate ?? ""
        self.imageUrl = Constants.API.Host.imagesBaseUrl + (movie.posterPath ?? "") 
    }
    
}

extension Movie: Equatable {}

func ==(lhs: Movie, rhs: Movie) -> Bool {
    let areEqual = lhs.title == rhs.title && lhs.overview == rhs.overview
    && lhs.releaseDate == rhs.releaseDate && lhs.imageUrl == rhs.imageUrl 
    
    return areEqual
}

extension Movie: Hashable {}
