//
//  MoviesData.swift
//  SkeletonMoviesSwiftUI
//
//  Created by Jesus Calleja Rodriguez on 3/11/23.
//

struct MoviesData: Codable {
    let totalPages: Int?
    let results: [MovieResultData]?
    
    enum CodingKeys: String, CodingKey {
        case totalPages = "total_pages"
        case results
    }
}

