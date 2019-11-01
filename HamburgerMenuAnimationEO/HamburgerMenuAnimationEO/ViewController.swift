//
//  ViewController.swift
//  HamburgerMenuAnimationEO
//
//  Created by mcs on 10/30/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

import UIKit


class Line: UIView {
  var line = UIBezierPath()
  func hamburgerline() {
    line.move(to: .init(x: 100, y: bounds.height / 2))
    line.addLine(to: .init(x: 300, y: bounds.height / 2))
    line.move(to: .init(x:100, y: bounds.height/2.1))
    line.addLine(to: .init(x: 300, y: bounds.height / 2.1))
    line.move(to: .init(x: 100, y: bounds.height / 2.2))
    line.addLine(to: .init(x: 300, y: bounds.height / 2.2))
    UIColor.red.setStroke()
    line.lineWidth = 5
    line.stroke()
  }
  override func draw(_ rect: CGRect) {
    hamburgerline()
  }
}
