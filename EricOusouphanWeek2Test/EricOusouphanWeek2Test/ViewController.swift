//
//  ViewController.swift
//  EricOusouphanWeek2Test
//
//  Created by mcs on 10/18/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

  @IBOutlet weak var tableView: UITableView!
  
  var gotArray: [GameOfThrones] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
  
    tableView.dataSource = self
    
    guard let url = URL(string: "https://api.tvmaze.com/shows/82?embed=seasons&embed=episodes") else {return}
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      guard let dataResponse = data,
        error == nil else {
          print(error?.localizedDescription ?? "Error")
          return
    }
    
    do {
      let new = try JSONDecoder().decode(GameOfThrones.self, from: dataResponse)
      self.gotArray.append(new)
      print(self.gotArray)
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
      
    } catch let parsingError {
      print("Err", parsingError)
    }
    }
    task.resume()
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return gotArray.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
    let episodeinfo = gotArray[indexPath.row].embedded.episodes
    cell.textLabel?.text = episodeinfo[indexPath.row].name
    cell.detailTextLabel?.text = "Season: \(episodeinfo[indexPath.row].season) Episode"
    return cell
    
  }
  
}

struct GameOfThrones: Codable {
  let embedded: EpisodeInfo
  
  enum CodingKeys: String, CodingKey {
    case embedded = "_embedded"
  }
}

struct EpisodeInfo: Codable {
  let episodes: [Episodes]
}

struct Episodes: Codable {
  let season: Int
  let name: String
  let number: Int
  let airdate: String
  let airtime: String
  let summary: String
  }
