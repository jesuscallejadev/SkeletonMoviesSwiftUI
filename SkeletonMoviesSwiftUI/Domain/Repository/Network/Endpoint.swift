//
//  Endpoint.swift
//  SkeletonMoviesSwiftUI
//
//  Created by Jesus Calleja Rodriguez on 4/11/23.
//

import Foundation

enum Endpoint {
    case getMovies(page: Int)
    case searchMovies(title: String)
}

extension Endpoint {
    enum MethodType: Equatable {
        case GET
        case POST(data: Data?)
    }
}

extension Endpoint {
    
    var host: String { Constants.API.Host.moviesHost }
    
    var path: String {
        switch self {
        case .getMovies:
            return Constants.API.Endpoints.getMoviesEndpoint
        case .searchMovies:
            return Constants.API.Endpoints.searchMoviesEndpoint
        }
    }
    
    var methodType: MethodType {
        switch self {
        case .getMovies:
            return .GET
        case .searchMovies:
            return .GET
        }
    }
    
    var headers: [String: String]? {
        return ["Authorization": "Bearer \(Constants.API.Auth.userTokenValue)"]
    }
    
    var queryItems: [String: String]? {
        switch self {
        case .getMovies(let page):
            return [Constants.API.QueryParams.page:"\(page)"]
        case .searchMovies(title: let title):
            return [Constants.API.QueryParams.query:"\(title)"]
        }
    }
}

extension Endpoint {
    
    var url: URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = host
        urlComponents.path = path
        
        var requestQueryItems = [URLQueryItem]()
        
        queryItems?.forEach { item in
            requestQueryItems.append(URLQueryItem(name: item.key, value: item.value))
        }
                
        urlComponents.queryItems = requestQueryItems
        
        return urlComponents.url
    }
}

