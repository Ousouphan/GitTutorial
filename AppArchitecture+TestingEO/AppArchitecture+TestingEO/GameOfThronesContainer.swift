//
//  GameOfThronesContainer.swift
//  AppArchitecture+TestingEO
//
//  Created by mcs on 10/30/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

import Foundation
struct GameOfThronesContainer: Codable {
  let episodeContainer: EpisodeContainer
  
  enum CodingKeys: String, CodingKey {
    case episodeContainer = "_embedded"
  }
}

struct EpisodeContainer: Codable {
  let episodes: [Episode]
}

struct Episode: Codable {
  let name: String
  let season: Int
}
