//
//  ViewController.swift
//  CollectionViewProjectEo
//
//  Created by mcs on 10/29/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var exampleCollectionView: UICollectionView!
  override func viewDidLoad() {
    super.viewDidLoad()
    exampleCollectionView.dataSource = self
    exampleCollectionView.delegate = self
    exampleCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
  }


}

extension ViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 100000
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
    cell.backgroundColor = .randomColor()
    print(UIColor(hexValue: 0x57812))
    return cell
  }
}

extension ViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let selectedCell = collectionView.cellForItem(at: indexPath)
    selectedCell?.backgroundColor = .randomColor()
  }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout
    collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
    return 0
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    //(itemNumber / 5) % 2 == 1 is another way to get the same result
    let itemNumber = indexPath.item
    let shouldBeBigger = itemNumber % 10 >= 5
    let height = collectionView.frame.height / (shouldBeBigger ? 3 : 6)
    let width = collectionView.frame.width / 5
    return CGSize(width: width, height: height)
  }
  
}

  extension UIColor {
   static func randomColor() -> UIColor {
    return UIColor(displayP3Red: CGFloat.random(in: 0...1), green: CGFloat.random(in:0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
    }
  convenience init(hexValue: Int) {
    let bitMask = 0x0000ff
    let blue = CGFloat(hexValue & bitMask) / (0xff)
    var updatedHexValue = hexValue >> 8
    let green = CGFloat(updatedHexValue & bitMask) / (0xff)
    updatedHexValue = updatedHexValue >> 8
    let red = CGFloat(updatedHexValue & bitMask) / (0xff)
    self.init(displayP3Red: red, green: green, blue: blue, alpha: 1)
    }
    
  }
  
