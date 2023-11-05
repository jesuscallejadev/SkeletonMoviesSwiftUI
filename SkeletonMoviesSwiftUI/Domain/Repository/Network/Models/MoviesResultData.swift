//
//  MoviesResultData.swift
//  SkeletonMoviesSwiftUI
//
//  Created by Jesus Calleja Rodriguez on 3/11/23.
//

import Foundation

struct MovieResultData: Codable {
    let id: Int?
    let title: String?
    let overview: String?
    let releaseDate: String?
    let posterPath: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case releaseDate = "release_date"
        case posterPath = "poster_path"
    }
    
    // MARK: - Init
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int?.self, forKey: .id)
        self.title = try container.decode(String?.self, forKey: .title)
        self.overview = try container.decode(String?.self, forKey: .overview)
        self.releaseDate = try container.decode(String?.self, forKey: .releaseDate)
        self.posterPath = try container.decode(String?.self, forKey: .posterPath)
    }
}


