//
//  ViewController.swift
//  FaceIDProjectEO
//
//  Created by mcs on 11/4/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

  @IBOutlet weak var authenticationLabel: UILabel!
  override func viewDidLoad() {
    super.viewDidLoad()
  let context = LAContext()
    var error: NSError?
    guard context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
      print(error?.localizedDescription ?? "No Error(somehow)")
      return
    }
    context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "we want to steal your identity") { [weak self] (success, authError) in
      print(success)
      print(authError?.localizedDescription ?? "No Error")
      guard success else { return }
      DispatchQueue.main.async {
        let newAuthText: String
        switch context.biometryType {
        case .faceID:
          newAuthText = "You suck at identifying scams. Thanks for the face"
        case .touchID:
          newAuthText = "You suck at identifying scams."
        case .none:
          newAuthText = "I am sorry you are poor, try getting a job"
        @unknown default:
          newAuthText = "I don't know how to steal that. Yet"
        }
        
      self?.authenticationLabel.text = newAuthText
      }
    }
  }


}

