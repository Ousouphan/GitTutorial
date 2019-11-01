//
//  Array+Extension.swift
//  AppArchitecture+TestingEO
//
//  Created by mcs on 10/30/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

import Foundation


extension Array {
  func object(at index: Int) -> Element? {
    guard index >= 0 && index < self.count else { return nil }
    return self[index]
  }
}
