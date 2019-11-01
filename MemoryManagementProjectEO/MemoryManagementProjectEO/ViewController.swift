//
//  ViewController.swift
//  MemoryManagementProjectEO
//
//  Created by mcs on 10/28/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
/*
   Historically 2 ways to do memory management in IOS.
   1st, MRR, stands for Manual Retain Release. This one is no longer used really. To keep things in memory, or to release them from memory, you would have to call retain or release functions, like this
   
   [value retain];
   [value release];
   
   2nd is called ARC, stands for Automatic Reference Counting. This system uses the retain count for memory managemen. The retain count is the number of STRONG references to the object. Once the retain count goes to 0, the object will be released from memory.
   
   What ARC actually does is at compile time, it uses the retain count to put the retain and release calls into the compiled code for us.
   
   
   
   */
  
  

  override func viewDidLoad() {
    super.viewDidLoad()
    let person = Person(name: "Ryan", home: nil)
    let home = Home(address: "NotARealPlace", dweller: nil)
    print("Successfullly created person and home")
    person.dwelling = home
    home.dweller = person
    // Do any additional setup after loading the view.
  }
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    present(SecondViewController(), animated: true, completion: nil)
    
  }
}

class SecondViewController: UITableViewController {
  deinit {
    print("SecondViewController was deinitialized")
  }
  var count = 0
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    dismiss(animated: true) { [weak self] in
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
      for number in 0...1000000{
        self?.count += number
        print(self?.count)
        }
      }
    }
  }
}

class Person {
  let name: String
  var dwelling: Home?
  
  deinit {
    print("Person is murdered")
  }
  
  init(name: String, home: Home?) {
    self.name = name
    dwelling = home
  }
  

}

class Home {
  let address: String
  var dweller: Person?
  
  deinit {
    print("Home is bulldozed")
  }
  
  init(address: String, dweller: Person?) {
    self.address = address
    self.dweller = dweller
  }
}
