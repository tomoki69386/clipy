//
//  UIBarButtonItem+EmptyTitleTests.swift
//  AppTests
//
//  Created by 築山朋紀 on 2020/08/24.
//

import XCTest
@testable import App

class UIBarButtonItem_EmptyTitleTests: XCTestCase {
    func testEmptyTitle() {
        let barButtonItem = UIBarButtonItem.createBackBarButtonItemForEmptyTitle()
        XCTAssertEqual(barButtonItem.title, " ")
    }
}
