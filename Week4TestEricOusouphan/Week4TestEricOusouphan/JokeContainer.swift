//
//  JokeContainer.swift
//  Week4TestEricOusouphan
//
//  Created by mcs on 11/1/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

import Foundation

struct JokeContainer: Codable {
  
  let jokeContainer: Jokes
  
}

struct Jokes: Codable {
  let category: String
  let type: String
  let joke: String
  let id: Int
  
}
