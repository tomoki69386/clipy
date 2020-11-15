//
//  InfoTests.swift
//  AppTests
//
//  Created by 築山朋紀 on 2020/08/26.
//

import XCTest

class InfoTests: XCTestCase {
    func testInfoPlist() {
        let path = Bundle.main.path(forResource: "Info", ofType: "plist")
        XCTAssertNotNil(path)
    }
}
