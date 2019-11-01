//
//  EpisodesController.swift
//  AppArchitecture+TestingEO
//
//  Created by mcs on 10/30/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

import Foundation

/*
 Dependency Injection - allowing the developer to choose what dependency to use
 */

protocol Session {
  func getData(with urlString: String, completion: @escaping (Data?, Error?) -> Void)
}

enum NetworkErrors: Error {
  case invalidURl
  case noData
  case badData
}

extension URLSession: Session {
  func getData(with urlString: String, completion: @escaping (Data?, Error?) -> Void) {
    guard let url = URL(string: urlString) else {
      completion(nil, NetworkErrors.invalidURl)
      return
    }
    dataTask(with: url) {(data, _, error) in
      completion(data, error)
    }.resume()
  }
}

struct EpisodeController {
  
    private let apiString = "https://api.tvmaze.com/shows/82?embed=seasons&embed=episodes"
  
  func getEpisodes(session: Session = URLSession.shared, completion: @escaping ([Episode]?) -> Void) {
//    guard let url = URL(string: apiString) else {
//      completion(nil)
//      return
//    }
//       URLSession.shared.dataTask(with: url) {(data, _,_) in
//         guard let data = data, let container = try?
//           JSONDecoder().decode(GameOfThronesContainer.self, from: data) else {
//            completion(nil)
//            return
//        }
//        completion(container.episodeContainer.episodes)
//       }.resume()
    session.getData(with: apiString) { (data, _) in
      guard let data = data, let container = try? JSONDecoder().decode(GameOfThronesContainer.self, from: data) else {
        completion(nil)
        return
      }
      completion(container.episodeContainer.episodes)
    }
  }
}
