//
//  ViewController.swift
//  SwiftyJSONProjectEO
//
//  Created by mcs on 11/6/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {

  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let jsonURLString = "https://api.tvmaze.com/shows/82?embed=seasons&embed=episodes"
    guard let url = URL(string: jsonURLString) else { return }
    
    URLSession.shared.dataTask(with: url) { (data, response, error) in
      guard let data = data else { return }
      let dataAsString = String(data: data, encoding: .utf8)
//      print(dataAsString)
      
      let json = try? JSON(data: data)
      let id = json!["id"].intValue
      print(id)
      let gameOfThronesURL = json!["url"].stringValue
      print(gameOfThronesURL)
      let name = json!["name"].stringValue
      print(name)
      let genre = json!["genres"].arrayValue
      print(genre)
      let embedded = json!["_embedded"].dictionaryValue
      print(embedded)
    }.resume()
    
    
    
  }


}

