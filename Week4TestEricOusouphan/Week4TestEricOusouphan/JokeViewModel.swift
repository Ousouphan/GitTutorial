//
//  JokeViewModel.swift
//  Week4TestEricOusouphan
//
//  Created by mcs on 11/1/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

import Foundation

final class JokesViewModel {
  private var jokes: [String: Any] = [:]
  private let apiString = "https://sv443.net/jokeapi/category/any"
  
  func getJokes(session: Session = URLSession.shared, completion: @escaping() -> Void) {
    session.getData(with: apiString) { [weak self] (data , _) in
        defer { completion() }
        guard let data = data, let container = try?
          JSONDecoder().decode(JokeContainer.self, from: data) else {
            return
        }
//      self?.jokes = container.jokeContainer
      }
  }
  func jokeLines() -> Int {
    return jokes.count
  }
  func getJokeViewModel(for index: Int) -> JokesViewModel {
    return JokesViewModel()
  }
}
