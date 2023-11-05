//
//  UserData.swift
//  SkeletonMoviesSwiftUI
//
//  Created by Jesus Calleja Rodriguez on 2/11/23.
//

import SwiftUI

class UserData: ObservableObject {
    
    // MARK: Singleton
    
    public static let shared = LogManager()
    
    // MARK: Properties
    
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = true
}

