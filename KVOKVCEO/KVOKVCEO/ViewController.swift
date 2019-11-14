//
//  ViewController.swift
//  KVOKVCEO
//
//  Created by mcs on 11/11/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    var theObject = MyObject()
    // this is for KVC
//    print(theObject.value(forKey: "theNumber"))
//    print(theObject.value(forKey: "theString"))
//    theObject.setValue("this is using KVC", forKey: "theString")
//    print(theObject.value(forKey: "theString"))
    
    
    // for non private
//    theObject.addObserver(self, forKeyPath: "theNumber", options: [.new, .old], context: &theObject)
//    theObject.theNumber = 2
    
    theObject.addObserver(self, forKeyPath: "theString", options: [.new, .old], context: &theObject)
    theObject.setValue("this will be seen by KVO", forKey: "theString")
  }
  override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
    print(keyPath)
    print(object)
    print(change)
  }
}

class MyObject: NSObject {
  @objc dynamic var theNumber = 1
  @objc dynamic private var theString = "Hello"
}

