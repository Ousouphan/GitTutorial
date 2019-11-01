//
//  TDDEpisodeViewModelTests.swift
//  AppArchitecture+TestingEO
//
//  Created by mcs on 10/31/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

import XCTest

@testable import AppArchitecture_TestingEO
final class TDDEpisodesViewModelTests: XCTestCase {
  
  var testData: Data? {
    let episodes = [Episode(name: "Cool", season: -9)]
     let episodeContainer = EpisodeContainer(episodes: episodes)
     let container = GameOfThronesContainer(episodeContainer: episodeContainer)
     let containerData = try? JSONEncoder().encode(container)
     return containerData
  }
  
  var sut: TDDEpisodeViewModel!
  
  override func setUp() {
    super.setUp()
    sut = TDDEpisodeViewModel()
  }
  
  override func tearDown() {
    sut = nil
    super.tearDown()
  }
  
  func testNumberOfEpisodesWithNoEpisodes() {
    let expectedValue = 0
    let actualValue = sut.numberOfEpisodes()
    XCTAssertEqual(expectedValue, actualValue)
    
  }
  
  func testNumberEpisodesAfterGettingEpisodes() {
    let expectedValue = 73
    sut.getEpisodes (session: MockSession(data: testData, error: nil)) { _ in
      let actualValue = self.sut.numberOfEpisodes()
    XCTAssertEqual(expectedValue, actualValue)
    }
  }
  
  func testErrorWhenNoData() {
    sut.getEpisodes(session: MockSession(data: nil, error: nil)) { error in
      XCTAssertNotNil(error)
    }
  }
  func testErrorWhenBadData() {
    sut.getEpisodes(session: MockSession(data: Data(), error: nil)) {
      (error) in
      XCTAssertNotNil(error)
    }
  }
  func testErrorWhenErrorInSessionCall() {
    sut.getEpisodes(session: MockSession(data: nil, error: TestErrors.testError)) { (error) in
      XCTAssertNotNil(error)
      XCTAssertEqual(error as! TestErrors, .testError)
  }
  }
}

enum TestErrors: Error {
  case testError
}

