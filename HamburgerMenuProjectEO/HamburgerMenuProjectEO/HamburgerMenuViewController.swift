//
//  HamburgerMenuViewController.swift
//  HamburgerMenuProjectEO
//
//  Created by mcs on 10/29/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

import UIKit

final class HamburgerMenuViewController: UIViewController {
  
  @IBOutlet weak var menuTableView: UITableView!
  let menuOptions = ["Home", "Account", "Help"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    menuTableView.dataSource = self
    let swipeGesture = UISwipeGestureRecognizer()
    swipeGesture.direction = .left
    swipeGesture.addTarget(self, action: #selector(goBack))
    menuTableView.addGestureRecognizer(swipeGesture)
    
    let tapGesture = UITapGestureRecognizer()
    tapGesture.addTarget(self, action: #selector(goBack))
    view.addGestureRecognizer(tapGesture)
  }
  @objc func goBack(_ sender: UIGestureRecognizer) {
    if let tapGesture = sender as? UITapGestureRecognizer {
      let location = tapGesture.location(in: view)
      let isIntableView = location.x <= view.frame.width / 2
      if !isIntableView {
        dismiss(animated: true, completion: nil)
      }
    } else {
      dismiss(animated: true, completion: nil)
    }
  }
}
  extension HamburgerMenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return menuOptions.count
    }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
    cell.textLabel?.text = menuOptions[indexPath.row]
    return cell
  }
}


