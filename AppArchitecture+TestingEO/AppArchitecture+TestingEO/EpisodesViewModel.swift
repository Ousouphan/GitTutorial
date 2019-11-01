//
//  EpisodesViewModel.swift
//  AppArchitecture+TestingEO
//
//  Created by mcs on 10/30/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

import Foundation

final class EpisodesViewModel {
  private var episodes: [Episode] = []
      private let apiString = "https://api.tvmaze.com/shows/82?embed=seasons&embed=episodes"
  
  func getEpisodes(session: Session = URLSession.shared, completion: @escaping() -> Void) {
    session.getData(with: apiString) { [weak self] (data , _) in
      defer { completion() }
      guard let data = data, let container = try?
        JSONDecoder().decode(GameOfThronesContainer.self, from: data) else {
          return
      }
      self?.episodes = container.episodeContainer.episodes
    }
  }
  func numberOfEpisodes() -> Int {
    return episodes.count
  }
  func getViewModel(for index: Int) -> EpisodeViewModel {
    return EpisodeViewModel(episode: episodes[index])
  }
}
