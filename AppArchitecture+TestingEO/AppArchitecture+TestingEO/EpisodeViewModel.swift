//
//  EpisodeViewModel.swift
//  AppArchitecture+TestingEO
//
//  Created by mcs on 10/30/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

import Foundation

struct EpisodeViewModel {
  private let episode: Episode
  
  init(episode: Episode) {
    self.episode = episode
  }
  func getEpisodeName() -> String {
    return episode.name
  }
  func getSeasonNumber() -> Int {
    return episode.season
  }
}
