//
//  ViewController.swift
//  APICrawlerEricOusouphan2
//
//  Created by mcs on 10/21/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//
//

import UIKit

class ViewController: UIViewController {
  var jsonDictionary: [String: Any] = [:]
  var pokemonArray: [[String: Any]] = []
  var newAPI = "https://pokeapi.co/api/v2"
  
  @IBOutlet weak var pokemonTableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    pokemonTableView.dataSource = self
    pokemonTableView.delegate = self
    pokemonTableView.register(UITableViewCell.self, forCellReuseIdentifier: "PokemonCell")
    
    guard let pokemonUrl = URL(string: newAPI) else {return}
    URLSession.shared.dataTask(with: pokemonUrl) {(data, _, _) in
      guard let data = data,
        let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { return }
      self.jsonDictionary = jsonObject
      DispatchQueue.main.async {
        self.pokemonTableView.reloadData()
      }
    }.resume()
  }
}
extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return jsonDictionary.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  if pokemonArray .isEmpty {

  let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "PokemonCell")
  let orderedKeys = jsonDictionary.keys.sorted()
  let keys = orderedKeys[indexPath.row]
  
    if let currentValue = jsonDictionary[orderedKeys[indexPath.row]] as? String {
    cell.detailTextLabel?.text = currentValue
    
    }
    
    if let value = self.jsonDictionary[orderedKeys[indexPath.row]] {
      if value is Int {
        cell.textLabel?.text = "\(value)"
    }
      else if value is String {
        cell.textLabel?.text = "\(value)"
      }
      else if value is NSNull {
        cell.textLabel?.text = "NULL Value"
      }
      else if value is [Any] {
        if let content = value as? [Any] {
          cell.detailTextLabel?.text = "Total Array: \(content.count)"
        }
      }
      else if value is [String: Any] {
        if let content = value as? [String: Any] {
          cell.detailTextLabel?.text = "Total Dictionaries: \(content.count)"
        }
      }
      else if value is Bool {
        if let content = value as? Bool {
          cell.detailTextLabel?.text = "\(content)"
        }
      }
      }
    return cell
    } else {
    let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
    cell.textLabel?.text = "Index[\(indexPath.row)]"
    return cell
    }
  }
}

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let secondScreen = storyboard.instantiateViewController(withIdentifier: "PokemonCell") as! ViewController
    
    let orderedKeys = jsonDictionary.keys.sorted()
    let keys = orderedKeys[indexPath.row]
    let currentValue = jsonDictionary[orderedKeys[indexPath.row]]
    if let currentValueStr = currentValue as? String {
    secondScreen.newAPI = currentValueStr
    navigationController?.pushViewController(secondScreen, animated: true)
    }
  }
}
 
