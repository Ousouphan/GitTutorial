//
//  ViewController.swift
//  CoreDataCodable
//
//  Created by mcs on 10/24/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//
// set lines to 0 when creating label

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var pokemonNameLabel: UILabel!
  override func viewDidLoad() {
    super.viewDidLoad()
    pokemonNameLabel.text = "Getting Pokemon..."
    let randomPokemonNumber = Int.random(in: 1...807)
    guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(randomPokemonNumber)") else {return}
    URLSession.shared.dataTask(with: url) {(data, _, _) in //get data from api
    guard let data = data, let pokemon = try? JSONDecoder().decode(Pokemon.self, from: data) else { return }
     try? CoreDataManager.shared.context.save()
      DispatchQueue.main.async {
        let allPokemon = CoreDataManager.shared.getAllPokemon()
        let allPokemonTogether = allPokemon.reduce("", { $0 + ($1.name ?? "No Name") + " "})
        self.pokemonNameLabel.text = allPokemonTogether
      }
      
    print(pokemon.name)
  }.resume()
  }

}

