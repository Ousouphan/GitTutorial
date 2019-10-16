//
//  NetworkManager.swift
//  JSONParsingProject
//
//  Created by mcs on 10/15/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

import Foundation

class NetworkManager{
    
    static let shared = NetworkManager()
    private init () { }
    
    func callAPI(using urlString: String, completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil, NetworkError.NotAUrl)
            return
            
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            completion(data, error)
        }.resume()
    }
}

enum NetworkError: Error {
    case NotAUrl
}

//private only used within class, file private within the file, internal usable in the whole protocol (default), public can be used but not overwrite, open can overwrite

