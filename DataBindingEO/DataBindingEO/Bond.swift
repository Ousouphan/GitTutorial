//
//  Bond.swift
//  DataBindingEO
//
//  Created by mcs on 11/11/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

import Foundation

  typealias Listener = (T) -> Void

class Bond<T> {
  var listener: Listener
  init(_ listener: Listener) {
    self.listener = listener
  }
  
  func bind(dynamic: Dynamic<T>) {
    dynamic.bonds.append(BondBox(self))
  }
}

