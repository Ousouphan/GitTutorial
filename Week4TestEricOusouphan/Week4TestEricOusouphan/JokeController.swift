//
//  JokeController.swift
//  Week4TestEricOusouphan
//
//  Created by mcs on 11/1/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

import Foundation

protocol Session {
  func getData( with urlString: String, completion: @escaping (Data?, Error?) -> Void)
}

enum NetworkErrors: Error {
  case invalidURL
}

extension URLSession: Session {
  func getData(with urlString: String, completion: @escaping (Data?, Error?) -> Void) {
    guard let url = URL(string: urlString) else {
      completion(nil, NetworkErrors.invalidURL)
      return
    }
    dataTask(with: url) { (data, _, error) in
    completion(data, error)
    }.resume()
  }
}


struct JokeController {
  private let anyApiString = "https://sv443.net/jokeapi/category/Any"
  private let programApiString = "https://sv443.net/jokeapi/category/Programming"
  private let miscApiString = "https://sv443.net/jokeapi/category/Miscellaneous"
  private let darkApiString = "https://sv443.net/jokeapi/category/Dark"

  func getAnyJokes (session: Session = URLSession.shared, completion: @escaping (Jokes?) -> Void) {
    session.getData(with: anyApiString) { (data, _) in
      guard let data = data, let container = try?
        JSONDecoder().decode(JokeContainer.self, from: data) else {
          completion(nil)
          return
      }
      completion(container.jokeContainer)
    }
  }
  
  func getProgramJokes (session: Session = URLSession.shared, completion: @escaping (Jokes?) -> Void) {
    session.getData(with: programApiString) { (data, _) in
      guard let data = data, let container = try?
        JSONDecoder().decode(JokeContainer.self, from: data) else {
          completion(nil)
          return
      }
      completion(container.jokeContainer)
    }
  }
  
  func getMiscJokes (session: Session = URLSession.shared, completion: @escaping (Jokes?) -> Void) {
    session.getData(with: miscApiString) { (data, _) in
      guard let data = data, let container = try?
        JSONDecoder().decode(JokeContainer.self, from: data) else {
          completion(nil)
          return
      }
      completion(container.jokeContainer)
    }
  }
  
  func getDarkJokes (session: Session = URLSession.shared, completion: @escaping (Jokes?) -> Void) {
    session.getData(with: darkApiString) { (data, _) in
      guard let data = data, let container = try?
        JSONDecoder().decode(JokeContainer.self, from: data) else {
          completion(nil)
          return
      }
      completion(container.jokeContainer)
    }
  }
}
