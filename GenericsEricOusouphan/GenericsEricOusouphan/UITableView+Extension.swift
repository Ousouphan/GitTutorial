//
//  UITableView+Extension.swift
//  GenericsEricOusouphan
//
//  Created by mcs on 11/4/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

import UIKit

extension UITableView {
  func registerCell<T: UITableViewCell & NibRegister> (_ cellType: T.Type) {
    register(UINib(nibName: cellType.nibName, bundle: cellType.bundle), forCellReuseIdentifier: cellType.reuseIdentifier)
  }
  func dequeueCell<T: UITableViewCell & NibRegister>(_ cellType: T.Type, for indexPath: IndexPath) -> T {
    guard let cell = dequeueReusableCell(withIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else {
      fatalError("Failed to create a cell of type \(String(describing: cellType)). Check to make sure that the reuse identifier matches the class if using the default NibRegister implementation.")
    }
    return cell
  }
}

protocol NibRegister {
  static var nibName: String { get }
  static var bundle: Bundle? { get }
  static var reuseIdentifier: String { get }
}

extension NibRegister where Self: UITableViewCell {
  static var nibName: String {
    return String(describing: self)
  }
  static var bundle: Bundle? {
    return nil
    
  }
  static var reuseIdentifier: String {
    return String(describing: self)
    
  }
}
