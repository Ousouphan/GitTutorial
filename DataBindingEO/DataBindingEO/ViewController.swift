//
//  ViewController.swift
//  DataBindingEO
//
//  Created by mcs on 11/10/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  typealias Listener = (T) -> Void
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    var name: Dynamic<String>
    name.value = "Steve"
    let nameBond = Bond() { [unowned self] name in
      self.nameLabel.text = name
    }
    nameBond.bind(name)
  }
}


