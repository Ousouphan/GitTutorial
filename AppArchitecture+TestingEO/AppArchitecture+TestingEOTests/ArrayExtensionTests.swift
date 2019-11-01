//
//  AppArchitecture_TestingEOTests.swift
//  AppArchitecture+TestingEOTests
//
//  Created by mcs on 10/30/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

import XCTest
@testable import AppArchitecture_TestingEO
final class ArrayExtensionTests: XCTestCase {


    func testObjectFunction() {
       let testArray = [1, 4, 7, 10, 111, 134431]
      XCTAssertEqual(testArray.object(at: 2), 7)
      XCTAssertNil(testArray.object(at: -1))
      XCTAssertNil(testArray.object(at: testArray.count))
      XCTAssertEqual(testArray.object(at: 0), testArray.first)
      XCTAssertEqual(testArray.object(at: testArray.count-1), testArray.last)
    }
}
