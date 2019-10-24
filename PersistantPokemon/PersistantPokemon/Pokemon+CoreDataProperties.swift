//
//  Pokemon+CoreDataProperties.swift
//  PersistantPokemon
//
//  Created by mcs on 10/21/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//
//

import Foundation
import CoreData


extension Pokemon {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pokemon> {
        return NSFetchRequest<Pokemon>(entityName: "Pokemon")
    }

    @NSManaged public var name: String?

}
