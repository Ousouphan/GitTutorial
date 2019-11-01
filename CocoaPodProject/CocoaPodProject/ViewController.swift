//
//  ViewController.swift
//  CocoaPodProject
//
//  Created by mcs on 10/31/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

import UIKit
import Alamofire
class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    request("https://www.google.com", method: .get, parameters: nil, encoding: JSONEncoding(), headers: nil).responseData { (response) in
      print(response.data)
      print(response.error)
      print.(response.response)
    }
  }


}

