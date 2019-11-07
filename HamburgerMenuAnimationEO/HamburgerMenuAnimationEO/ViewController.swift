//
//  ViewController.swift
//  HamburgerMenuAnimationEO
//
//  Created by mcs on 10/30/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

import UIKit


//class Line: UIView {
//  var line = UIBezierPath()
//  func hamburgerline() {
//    line.move(to: .init(x: 100, y: bounds.height / 2))
//    line.addLine(to: .init(x: 300, y: bounds.height / 2))
//    line.move(to: .init(x:100, y: bounds.height/2.1))
//    line.addLine(to: .init(x: 300, y: bounds.height / 2.1))
//    line.move(to: .init(x: 100, y: bounds.height / 2.2))
//    line.addLine(to: .init(x: 300, y: bounds.height / 2.2))
//    UIColor.red.setStroke()
//    line.lineWidth = 5
//    line.stroke()
//  }
//  override func draw(_ rect: CGRect) {
//    hamburgerline()
//  }
//
//  func rotateHamburger () {
//    line.transform = CGAffineTransformMakeRotation(360)
//  }
//}

class ViewController: UIViewController {
  
  override func viewDidLoad() {
  super.viewDidLoad()
  
    hamburgerMenuAnimation()
  
  }
  
  func hamburgerMenuAnimation () {
    let lineA = UIView(frame: CGRect(x: 100, y: 400, width: 200, height: 15))
    let lineB = UIView(frame: CGRect(x: 100, y: 450, width: 200, height: 15))
    let lineC = UIView(frame: CGRect(x: 100, y: 500, width: 200, height: 15))
    
    lineA.backgroundColor = UIColor.red
    lineB.backgroundColor = UIColor.red
    lineC.backgroundColor = UIColor.red
    view.addSubview(lineA)
    view.addSubview(lineB)
    view.addSubview(lineC)
    
    let lineASpin = spinningLines(forHowLong: 2)
    lineA.layer.add(lineASpin, forKey: "lineASpins")
    
  }
  
  private func spinningLines(forHowLong: Double) -> CABasicAnimation {
    let lineASpin = CABasicAnimation(keyPath: "lineA spins")
    lineASpin.fromValue = 0
    lineASpin.toValue = Double.pi
    lineASpin.duration = forHowLong
    
    lineASpin.repeatCount = 1
    lineASpin.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    lineASpin.beginTime = CACurrentMediaTime() + 1.5
    
    return lineASpin
  }
  
}
