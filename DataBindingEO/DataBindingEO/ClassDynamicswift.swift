//
//  ClassDynamicswift.swift
//  DataBindingEO
//
//  Created by mcs on 11/11/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

import Foundation

  class Dynamic<T> {
    var value: T {
      didSet {
        for bondBox in bonds {
          bondBox.bond?.listener?(value)
        }
      }
    }
    
    var bonds: [BondBox<T>] = []
    
    init(_ v: T) {
      value = v
    }
    class BondBox<T> {
      weak var bond: Bond<T>?
      init(_ b: Bond<T>) {bond = b}
      
      
    }
  }
