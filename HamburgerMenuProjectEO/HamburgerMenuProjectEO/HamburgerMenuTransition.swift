//
//  HamburgerMenuTransition.swift
//  HamburgerMenuProjectEO
//
//  Created by mcs on 10/29/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

import Foundation
import UIKit

final class HamburgerMenuTransition: NSObject, UIViewControllerAnimatedTransitioning {
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return 0.7 
  }
  
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    guard let toView = transitionContext.view(forKey: .to) else {return}
    transitionContext.containerView.addSubview(toView)
    toView.frame.origin.x = -toView.frame.width
    UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
      toView.frame.origin.x = 0
    }) { (success) in
      transitionContext.completeTransition(success)
    }
  }
  
  
}
