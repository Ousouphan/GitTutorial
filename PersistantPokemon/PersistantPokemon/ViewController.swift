//
//  ViewController.swift
//  PersistantPokemon
//
//  Created by mcs on 10/21/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var pokemonTableView: UITableView!
  override func viewDidLoad() {
    super.viewDidLoad()
    let randomPokemonURL = "https://pokeapi.co/api/v2\(Int.random(in: 1...807))"
    guard let url = URL(string: randomPokemonURL) else {return}
    URLSession.shared.dataTask(with: url) { ( data, _, _) in
      guard let data = data, let pokemon = try? JSONDecoder().decode(Pokemon.self, from: data) else {return}
      print(pokemon)
    }.resume()
//    let allPokemon = CoreDataManager.shared.getAllPokemon()
//    print(allPokemon)
//    for pokemon in allPokemon {
//      print(pokemon.name)
//    }
//    let bulbasaur = CoreDataManager.shared.createPokemon(with: "bulbasaur")
//    print(bulbasaur)
//    print(CoreDataManager.shared.getAllPokemon())
//    CoreDataManager.shared.save()
  }


}

