//
//  Service.swift
//  AppStoreClone
//
//  Created by Shubham Saurav on 8/27/19.
//  Copyright © 2019 Shubham Saurav. All rights reserved.
//

import Foundation


class Service {
    static let shared = Service()
    
    func fetchApps(searchTerm: String, completion: @escaping ([Result]?, Error?) -> ()) {
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            //success
            guard let data = data else {return}
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                let results = searchResult.results
                completion(results, nil)
            } catch let decodeError {
                completion(nil, decodeError)
                return
            }
        }.resume()
    }
    
    
    
}
