//
//  Pokemon+CoreDataClass.swift
//  PersistantPokemon
//
//  Created by mcs on 10/21/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Pokemon)
public class Pokemon: NSManagedObject, Codable {
  
  enum CodingKeys: String, CodingKey {
    case name
  }
  
  public required init(from decoder: Decoder) throws {
    guard let entityDescription = NSEntityDescription.entity(forEntityName: "Pokemon", in: CoreDataManager.shared.context) else {throw CoreDataErrors.invalidEntity }
    super.init(entity: entityDescription, insertInto: CoreDataManager.shared.context)
    let container = try decoder.container(keyedBy: CodingKeys.self)
    name = try container.decode(String.self, forKey: .name)
  }
  public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(name, forKey: .name)
  }
}
enum CoreDataErrors: Error {
  case invalidEntity
}
