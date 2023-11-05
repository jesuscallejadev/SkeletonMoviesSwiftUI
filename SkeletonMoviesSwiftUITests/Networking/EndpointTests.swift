//
//  EndpointTests.swift
//  SkeletonMoviesSwiftUITests
//
//  Created by Jesus Calleja Rodriguez on 5/11/23.
//

import XCTest
@testable import SkeletonMoviesSwiftUI

class EndpointTests: XCTestCase {
    
    func test_get_movies_endpoint_request_is_valid() {
        
        let endpoint = Endpoint.getMovies(page: 5)
        
        XCTAssertEqual(endpoint.host, "api.themoviedb.org", "The host should be api.themoviedb.org")
        XCTAssertEqual(endpoint.path, "/3/discover/movie", "The path should be /3/discover/movie")
        XCTAssertEqual(endpoint.methodType, .GET, "The method type should be GET")
        XCTAssertEqual(endpoint.headers, ["Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3MzIwYjA0NTkxZTQ0ZGNlMzFmOGMwNGU0MjFlOThlZiIsInN1YiI6IjY1Mjc5MzQ2MGNiMzM1MTZmNWM3ZjZhZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.AEamipwiaDFofreQBFj7yKhNfGkaezhUjSBFtDDczNU"], "Header should contain Auth token")
        XCTAssertEqual(endpoint.queryItems, ["page":"5"], "The query items should be page: 5")
        
        XCTAssertEqual(endpoint.url?.absoluteString, "https://api.themoviedb.org/3/discover/movie?page=5", "Url generated doesn't match our endpoint")
    }
    
    func test_search_movies_endpoint_request_is_valid() {
        
        let endpoint = Endpoint.searchMovies(title: "Batman")
        
        XCTAssertEqual(endpoint.host, "api.themoviedb.org", "The host should be api.themoviedb.org")
        XCTAssertEqual(endpoint.path, "/3/search/movie", "The path should be /3/search/movie")
        XCTAssertEqual(endpoint.methodType, .GET, "The method type should be GET")
        XCTAssertEqual(endpoint.headers, ["Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3MzIwYjA0NTkxZTQ0ZGNlMzFmOGMwNGU0MjFlOThlZiIsInN1YiI6IjY1Mjc5MzQ2MGNiMzM1MTZmNWM3ZjZhZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.AEamipwiaDFofreQBFj7yKhNfGkaezhUjSBFtDDczNU"], "Header should contain Auth token")
        XCTAssertEqual(endpoint.queryItems, ["query":"Batman"], "The query items should be query: Batman")
        
        XCTAssertEqual(endpoint.url?.absoluteString,"https://api.themoviedb.org/3/search/movie?query=Batman", "Url generated doesn't match our endpoint")
        
    }
}
