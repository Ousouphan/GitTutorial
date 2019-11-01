//
//  ViewController.swift
//  HamburgerMenuProjectEO
//
//  Created by mcs on 10/29/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  @IBAction func didTapMenu(_ sender: Any) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let hamburgerMenuViewController = storyboard.instantiateViewController(identifier: "HamburgerMenuViewController")
    hamburgerMenuViewController.transitioningDelegate = self
    present(hamburgerMenuViewController, animated: true, completion: nil)
    
  }
  
}

extension ViewController: UIViewControllerTransitioningDelegate {
  func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return HamburgerMenuTransition()
  }
}
