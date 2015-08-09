//
//  ChromaTests.swift
//  ChromaTests
//
//  Created by iChrille on 8/9/15.
//  Copyright (c) 2015 Reversebox. All rights reserved.
//

import UIKit
import XCTest
import Chroma

class ChromaTests: XCTestCase {

  override func setUp() {
    super.setUp()
  }
    
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }

  func testTintIsEqual() {
    var c = ColorTint(startColor: UIColor.redColor(), endColor: UIColor.yellowColor(), amount: 0)
    var cc = ColorTint(startColor: UIColor.redColor(), endColor: UIColor.yellowColor(), amount: 0)
    XCTAssertEqual(c, cc, "")
    cc.amount = 1
    XCTAssertNotEqual(c, cc, "")
  }

}
