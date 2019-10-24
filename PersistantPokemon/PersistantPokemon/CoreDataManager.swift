//
//  CoreDataManager.swift
//  PersistantPokemon
//
//  Created by mcs on 10/21/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
  
  static let shared = CoreDataManager()
  
  private init() { }
  
  lazy var persistantContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "PokemonDataModel")
    container.loadPersistentStores { (description, error) in
      print(description)
      print(error)
    }
    return container
  } ()
  var context: NSManagedObjectContext {
    return persistantContainer.viewContext
  }
  
//  func createPokemon(with name: String) -> Pokemon? {
//    guard let entityDescription = NSEntityDescription.entity(forEntityName: "Pokemon", in: context) else {return nil}
//    let pokemon = Pokemon(entity: entityDescription, insertInto: context)
//    pokemon.name = name
//    return pokemon
//  }
  func getAllPokemon() -> [Pokemon] {
//    let fetchRequest = NSFetchRequest<Pokemon>.init(entityName: "Pokemon")
    let fetchRequest: NSFetchRequest<Pokemon> = Pokemon.fetchRequest()
    let pokemon = try? context.fetch(fetchRequest)
    return pokemon ?? []
  }
  
  func delete(pokemon: Pokemon) {
    context.delete(pokemon)
  }
  
  func save() {
    guard context.hasChanges else {return}
    try? context.save()
  }
}
