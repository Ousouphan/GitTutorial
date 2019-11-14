//
//  AsteroidsController.swift
//  AsteroidProject
//
//  Created by mcs on 11/14/19.
//  Copyright © 2019 PaulRenfrew. All rights reserved.
//

import Foundation

protocol Session {
  func getData(with urlString: String, completion: @escaping (Data?, Error?) -> Void)
}

enum NetworkErrors: Error {
  case invalidURL
  case noData
}

extension URLSession: Session {
  func getData(with urlString: String, completion: @escaping (Data?, Error?) -> Void) {
    guard let url = URL(string: urlString) else {
      completion(nil, NetworkErrors.invalidURL)
      return
    }
    dataTask(with: url) {(data, _, error) in
      completion(data, error)
    }.resume()
  }
}

struct AsteroidsController {
  private let apiString = "https://api.nasa.gov/neo/rest/v1/feed?start_date=2019-09-07&end_date=2019-09-08&api_key=DEMO_KEY"
  
  func getAsteroids(session: Session = URLSession.shared, completion: @escaping ([AsteroidInfo]?) -> Void) {
    session.getData(with: apiString) { (data, _) in
      guard let data = data, let container = try?
        JSONDecoder().decode(AsteroidsContainer.self, from: data)
        else {completion (nil)
          return
      }
      completion(container.asteroidNearEarthContainer.startDate)
    }
    
  }
}
