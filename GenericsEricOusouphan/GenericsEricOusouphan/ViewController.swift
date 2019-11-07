//
//  ViewController.swift
//  GenericsEricOusouphan
//
//  Created by mcs on 11/4/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var genericTableView: UITableView!
  
  let stringArray = ["hi", "hello", "bye", "goodbye"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    genericTableView.dataSource = self
//    genericTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    genericTableView.registerCell(TableViewCell.self)
  }
//  func compare(first: String, second: String) -> Bool {
//    return first == second
//  }
//
//  func intCompare(first: Int, second: Int) -> Bool {
//    return first == second
//  }
//
//  func genericCompare<T: Equatable>(first: T, second: T) -> Bool {
//    return first == second
//  }
//
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return stringArray.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueCell(TableViewCell.self, for: indexPath)
//    let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
    cell.labelText.text = stringArray[indexPath.row]
    return cell
  }
}
