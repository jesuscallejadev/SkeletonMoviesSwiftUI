//
//  Localize.swift
//  SkeletonMoviesSwiftUI
//
//  Created by Jesus Calleja Rodriguez on 2/11/23.
//

import Foundation

struct Localize {

    func get(_ key: String) -> String {
        return NSLocalizedString(key, comment: "")
    }
}
