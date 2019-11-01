//
//  EpisodesControllerTests.swift
//  AppArchitecture+TestingEOTests
//
//  Created by mcs on 10/30/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

import XCTest
@testable import AppArchitecture_TestingEO

class EpisodesControllerTests: XCTestCase {
    func testGetEpisodes() {
      let controller = EpisodeController()
      let episodeExpectation = expectation(description: "")
      
      let mockEpisodes = [Episode(name: "Mock", season: -100)]
      let mockEpisodeContainer = EpisodeContainer(episodes: mockEpisodes)
      let mockContainer = GameOfThronesContainer(episodeContainer: mockEpisodeContainer)
      let mockContainerData = try? JSONEncoder().encode(mockContainer)
      let mockSession = MockSession(data: mockContainerData, error: nil)
      
      controller.getEpisodes(session: mockSession) { (episodes) in
        XCTAssertNotNil(episodes)
//        XCTAssertNil(episodes)
        episodeExpectation.fulfill()
      }
      waitForExpectations(timeout: 2, handler: nil)
    }
  }

struct MockSession: Session {
  let data: Data?
  let error: Error?
  func getData(with urlString: String, completion: @escaping (Data?, Error?) -> Void) {
    completion(data, error)
  }
}
