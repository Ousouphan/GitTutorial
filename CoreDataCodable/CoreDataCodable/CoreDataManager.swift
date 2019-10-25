//
//  CoreDataManager.swift
//  CoreDataCodable
//
//  Created by mcs on 10/24/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
  static let shared = CoreDataManager()
  
  private init() {}
  
  lazy var container: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "PokemonModel")
    container.loadPersistentStores(completionHandler: {(description, error) in
      print(description)
      print(error)
      })
    return container
  }()
  
  var context: NSManagedObjectContext {
    return container.viewContext
  }
  
  func save() {
    guard context.hasChanges else { return }
    try? context.save()
  }
  func getAllPokemon() -> [Pokemon] {
    let fetchRequest: NSFetchRequest<Pokemon> = Pokemon.fetchRequest()
    
    let gatheredPokemon = try? context.fetch(fetchRequest)
    return gatheredPokemon ?? []
  }
}
