//
//  ViewController.swift
//  AsteroidProject
//
//  Created by MAC on 6/4/19.
//  Copyright © 2019 PaulRenfrew. All rights reserved.
//

import UIKit
//Things to do for this code assessment
//TODO: Call this API: https://api.nasa.gov/neo/rest/v1/feed?start_date=2015-09-07&end_date=2015-09-08&api_key=DEMO_KEY
//TODO: Show nearest asteroids as per the above API
//TODO: Network layer should be done in a separate target and imported into the project.
//TODO: Write unit tests for network layer
//TODO: Write unit tests for main project
//I will leave all UI decisions to you.

class ViewController: UIViewController {

  
  @IBOutlet weak var asteroidTableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    asteroidTableView.dataSource.self
    
  }
}

