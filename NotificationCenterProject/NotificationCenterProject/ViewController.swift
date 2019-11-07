//
//  ViewController.swift
//  NotificationCenterProject
//
//  Created by mcs on 10/31/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var notificationLabel: UILabel!
  
  static let myNotification = NSNotification.Name("CoolNotification")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    NotificationCenter.default.addObserver(self, selector: #selector(updateLabel), name: ViewController.myNotification, object: nil)  }
  
  @objc func updateLabel() {
    notificationLabel.text = "Notification Received"
  }
  
  override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
    guard motion == .motionShake else {return}
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let nextViewController = storyboard.instantiateViewController(identifier: "ViewController")
    navigationController?.pushViewController(nextViewController, animated: true)
  }

}

