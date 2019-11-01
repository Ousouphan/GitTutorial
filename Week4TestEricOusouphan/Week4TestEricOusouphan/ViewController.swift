//
//  ViewController.swift
//  Week4TestEricOusouphan
//
//  Created by mcs on 11/1/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let apiString = "https://sv443.net/jokeapi/category/any"

  @IBOutlet weak var jokeTableView: UITableView!
  
  @IBOutlet weak var segmentedView: UISegmentedControl!
  
  @IBAction func indexChanged(_ sender: Any) {
    
    switch segmentedView.selectedSegmentIndex
    {
    case 0:
      NSLog("Any Selected")
      
    case 1:
      NSLog("Program Selected")
      
    case 2:
      NSLog("Misc Selected")
      
    case 3:
      NSLog("Dark Selected")
      
    case 4:
      NSLog("Favorite Selected")
      
    default:
      break
    }
  
  }
  
  @IBAction func getJokeButton(_ sender: Any) {
  
  }
  
  let jokeViewModel = JokesViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    jokeTableView.dataSource = self
//    jokeTableView.delegate = self
    
    jokeViewModel.getJokes { [weak self] in
      DispatchQueue.main.async {
        self?.jokeTableView.reloadData()
      }
    }
  }
  }

  extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return jokeViewModel.jokeLines()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
      let episodeViewModel = jokeViewModel.getJokeViewModel(for: indexPath.row)
      return cell
    }

  }



