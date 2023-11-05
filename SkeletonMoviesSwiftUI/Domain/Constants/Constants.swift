//
//  Constants.swift
//  SkeletonMoviesSwiftUI
//
//  Created by Jesus Calleja Rodriguez on 2/11/23.
//

struct Constants {
    
    struct Animations {
        static let movies = "movies"
        static let search = "search"
        static let movieDetails = "movieDetails"
    }
    
    struct Images {
        static let next = "chevron.right.circle.fill"
        static let logo = "logo"
        static let moviesPlaceholder = "moviesPlaceholder"
    }
    
    struct API {
        struct Auth {
            static let userTokenValue = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3MzIwYjA0NTkxZTQ0ZGNlMzFmOGMwNGU0MjFlOThlZiIsInN1YiI6IjY1Mjc5MzQ2MGNiMzM1MTZmNWM3ZjZhZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.AEamipwiaDFofreQBFj7yKhNfGkaezhUjSBFtDDczNU"
        }
        
        struct Host {
            static let moviesHost = "api.themoviedb.org"
            static let imagesBaseUrl = "https://image.tmdb.org/t/p/original/"
        }
        
        struct Endpoints {
            static let getMoviesEndpoint = "/3/discover/movie"
            static let searchMoviesEndpoint = "/3/search/movie"
        }
        
        struct QueryParams {
            static let page = "page"
            static let query = "query"
        }
        
        struct Pagination {
            static let startPage = 1
            static let endPage = 500
        }
    }
}

