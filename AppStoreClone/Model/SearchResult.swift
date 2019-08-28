//
//  SearchResult.swift
//  AppStoreClone
//
//  Created by Shubham Saurav on 8/23/19.
//  Copyright © 2019 Shubham Saurav. All rights reserved.
//

import Foundation



struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Decodable {
    let trackName: String
    let primaryGenreName: String
    var averageUserRating: Float?
    let artworkUrl100: String
    let screenshotUrls: [String]
}
