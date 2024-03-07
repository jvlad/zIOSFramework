//
//  StringExtensionTest.swift
//  zvladIOSFramework
//
//  Created by Vlad Zamskoi on 8/18/17.
//  Copyright (c) 2017 MobileAppSoft. All rights reserved.
//

import XCTest
@testable import zIOSFramework

class StringExtensionTest: XCTestCase {
    
    func testAddParentheses() {
        var sourceString: String
        var wrappedWithBraces: String

        sourceString = "one two three"
        wrappedWithBraces = sourceString.inParentheses
        XCTAssertEqual(wrappedWithBraces, "(one two three)")

        sourceString = "(braced)"
        wrappedWithBraces = sourceString.inParentheses
        XCTAssertEqual(wrappedWithBraces, "((braced))")
    }
    
}
