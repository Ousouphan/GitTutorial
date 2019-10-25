//
//  ViewController.swift
//  APICrawlerEricOusouphan
//
//  Created by mcs on 10/19/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  
  var pokemonArray: [Pokemon] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.dataSource.self
    
    guard let url = URL(string: "https://https://pokeapi.co/api/v2") else {return}
    
    let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
      guard let dataResponse = data,
        error == nil else {
          print(error?.localizedDescription ?? "Error")
          return
      }
      
      do {
        let new = try JSONDecoder().decode(pokemonArray, from: dataResponse)
        self.pokemonArray.append(new)
        print(self.pokemonArray)
        DispatchQueue.main.async {
          self.tableView.reloadData()
        }
      } catch let parsingError {
        print("Err", parsingError)
      }
      
    }
    task.resume()
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return pokemonArray.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
  let pokemoninfo = pokemonArray[indexPath.row].descriptions
  cell.textLabel?.text = pokemoninfo[indexPath.row]
  cell.detailedTextLabel?.text = 
  }

  struct Pokemon: Codable {
    let information: PokemonInfo
  }
  
  struct PokemonInfo: Codable {
    let ability: String
    let berry: String
    let berryFirmness: String
    let berryFlavor: String
    let characteristic: String
    let contestEffect: String
    let contestType: String
    let eggGroup: String
    let encounterCondition: String
    let encounterConditionValue: String
    let encounterMethod: String
    let evolutionChain: String
    let evolutionTrigger: String
    let gender: String
    let generation: String
    let growthRate: String
    let item: String
    let itemAttribute: String
    let itemCategory: String
    let itemFlingEvent: String
    let itemPocket: String
    let language: String
    let location: String
    let locationArea: String
    let machine: String
    let move: String
    let moveAilment: String
    let moveBattleStyle: String
    let moveCategory: String
    let moveDamageClass: String
    let moveLearnMethod: String
    let moveTarget: String
    let nature: String
    let palParkArea: String
    let pokeathlonStats: String
    let pokedex: String
    let pokemon: String
    let pokemonColor: String
    let pokemonForm: String
    let pokemonHabitat: String
    let pokemonShape: String
    let pokemonSpecies: String
    let region: String
    let stat: String
    let superContestEffect: String
    let type: String
    let version: String
    let versionGroup: String
    
    enum CodingKeys: String, CodingKey {
      case berryFirmness = "berry-firmness"
      case berryFlavor = "berry-flavor"
      case contestEffect = "contest-effect"
      case contestType = "contest-type"
      case eggGroup = "egg-group"
      case encounterCondition = "encounter-condition"
      case encounterConditionValue = "encounter-condition-value"
      case encounterMethod = "encounter-method"
      case evolutionChain = "evolution-chain"
      case evolutionTrigger = "evolution-trigger"
      case growthRate = "growth-rate"
      case itemAttribute = "item-attribute"
      case itemCategory = "item-category"
      case itemFlingEffect = "item-fling-effect"
      case itemPocket = "item-pocket"
      case locationArea = "location-area"
      case moveAilment = "move-ailment"
      case moveBattleStyle = "move-battle-style"
      case moveCatagory = "move-category"
      case moveDamageClass = "move-damage-class"
      case moveLearnMethod = "move-learn-method"
      case moveTarget = "move-target"
      case palParkArea = "pal-park-area"
      case pokeathlonStats = "pokeathlon-stat"
      case pokemonColor = "pokemon-color"
      case pokemonForm = "pokemon-form"
      case pokemonHabitat = "pokemon-habitat"
      case pokemonShape = "pokemon-shape"
      case pokemonSpecies = "pokemon-species"
      case superContestEffect = "super-contest-effect"
      case versionGroup = "version-group"
    }
    
  }
  
}

