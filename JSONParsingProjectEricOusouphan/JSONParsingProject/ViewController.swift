//
//  ViewController.swift
//  JSONParsingProject
//
//  Created by mcs on 10/14/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var pokemonArray: [Pokemon] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    inProjectJSONParsing()
    
  }
  
  func inProjectJSONParsing() {
    guard let pokemonJSONURL = Bundle.main.url(forResource: "PokemonExample", withExtension: "json"), let jsonData = try? Data(contentsOf: pokemonJSONURL) else { return }
    let pokemon = try? JSONDecoder().decode(Pokemon.self, from: jsonData)
    print(pokemon)
  }
  
}

struct Pokemon: Codable {
  let name: String
  let abilities: [Ability]
  let baseExperience: Int
  let forms: [Form]
  let game_indices: [game_indices]
  let height: Int
  let helditems: [String] = []
  let id: Int
  let isDefault: Bool
  let locationAreaEncounters: String
  let order: Int
  let stats: [Stats]
  let types: [Types]
  let weight: Int

  
  
  
  enum CodingKeys: String, CodingKey {
    case name
    case abilities
    case baseExperience = "base_experience"
    case forms
    case game_indices
    case height
    case helditems
    case id
    case isDefault = "is_default"
    case locationAreaEncounters = "location_area_encounters"
    case order
    case stats
    case types
    case weight

    
  }
}

struct AbilityContainer: Codable {
  let name: String
  let url: String
}

struct Ability: Codable {
  let ability: AbilityContainer
  let isHidden: Bool
  
  enum CodingKeys: String, CodingKey {
    case isHidden = "is_hidden"
    case ability
  }
}

struct Form: Codable {
  let name: String
  let url: String
}

struct VersionContainer: Codable {
  let name: String
  let url: String
}

struct game_indices: Codable {
  let version: VersionContainer
  let gameIndex: Int
  
  enum CodingKeys: String, CodingKey {
    case version
    case gameIndex = "game_index"
  }
}



struct statsContainer: Codable {
  let name: String
  let url: String
}

struct Stats: Codable {
  let baseStat: Int
  let effort: Int
  let stats: statsContainer
  
  enum CodingKeys: String, CodingKey {
    case baseStat = "base_stat"
    case effort
    case stats = "stat"
  }
}

struct typeContainer: Codable {
  let name: String
  let url: String
}

struct Types: Codable {
  let type: typeContainer
  let slot: Int
  
  enum CodingKeys: String, CodingKey {
    case type
    case slot
  }
}
