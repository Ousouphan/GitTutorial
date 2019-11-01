//
//  TDDEpisodesViewModel.swift
//  AppArchitecture+TestingEO
//
//  Created by mcs on 10/31/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

import Foundation

final class TDDEpisodeViewModel {
  private var episodeCount = 0
  func numberOfEpisodes() -> Int {
    return episodeCount
  }
  func getEpisodes(session: Session = URLSession.shared, completion: @escaping (Error?) -> Void) {
    session.getData(with: "https://api.tvmaze.com/shows/82?embed=seasons&embed=episodes") { (data, error) in
      guard error == nil else {
        completion(error)
        return
      }
      guard let data = data else {
        completion(NetworkErrors.noData)
        return
      }
      guard let container = try? JSONDecoder().decode(GameOfThronesContainer.self, from: data)
        else {
          completion(NetworkErrors.badData)
          return
      }
      self.episodeCount = container.episodeContainer.episodes.count

    }//.resume()
  }
}
