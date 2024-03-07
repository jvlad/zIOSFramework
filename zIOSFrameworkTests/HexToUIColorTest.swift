//
//  HexToUIColorTest.swift
//  TBFin
//
//  Created by Vlad Zamskoi on 8/18/17.
//  Copyright (c) 2017 MobileAppSoft. All rights reserved.
//

import XCTest
@testable import zIOSFramework

class HexToUIColorTest: XCTestCase {
    
    func testFullHex_WithAlpha_WithPrefix() {
        let color = "#ff00bbaa"
        let result = UIColor(hexColorString: color)
        let expectedResult = UIColor(red: 1.0, green: 0.0, blue: 0xbb / 255.0, alpha: 0xaa / 255.0)
        XCTAssertEqual(result, expectedResult)
    }

    func testFullHex_WithAlpha_WithoutPrefix() {
        let color = "ff00bbaa"
        let result = UIColor(hexColorString: color)
        let expectedResult = UIColor(red: 1.0, green: 0.0, blue: 0xbb / 255.0, alpha: 0xaa / 255.0)
        XCTAssertEqual(result, expectedResult)
    }

    func testFullHex_WithoutAlpha_WithPrefix() {
        let color = "#ff00bb"
        let result = UIColor(hexColorString: color)
        let expectedResult = UIColor(red: 1.0, green: 0.0, blue: 0xbb / 255.0, alpha: 1.0)
        XCTAssertEqual(result, expectedResult)
    }

    func testFullHex_WithoutAlpha_WithoutPrefix() {
        let color = "ff00bb"
        let result = UIColor(hexColorString: color)
        let expectedResult = UIColor(red: 1.0, green: 0.0, blue: 0xbb / 255.0, alpha: 1.0)
        XCTAssertEqual(result, expectedResult)
    }

    func testShortHex_WithAlpha_WithPrefix() {
        let color = "#f0ba"
        let result = UIColor(hexColorString: color)
        let expectedResult = UIColor(red: 1.0, green: 0.0, blue: 0xbb / 255.0, alpha: 0xaa / 255.0)
        XCTAssertEqual(result, expectedResult)
    }

    func testShortHex_WithAlpha_WithoutPrefix() {
        let color = "f0ba"
        let result = UIColor(hexColorString: color)
        let expectedResult = UIColor(red: 1.0, green: 0.0, blue: 0xbb / 255.0, alpha: 0xaa / 255.0)
        XCTAssertEqual(result, expectedResult)
    }

    func testShortHex_WithoutAlpha_WithPrefix() {
        let color = "#f0b"
        let result = UIColor(hexColorString: color)
        let expectedResult = UIColor(red: 1.0, green: 0.0, blue: 0xbb / 255.0, alpha: 1.0)
        XCTAssertEqual(result, expectedResult)
    }

    func testShortHex_WithoutAlpha_WithoutPrefix() {
        let color = "f0b"
        let result = UIColor(hexColorString: color)
        let expectedResult = UIColor(red: 1.0, green: 0.0, blue: 0xbb / 255.0, alpha: 1.0)
        XCTAssertEqual(result, expectedResult)
    }

    func testInvalidInput() {
        let color = "#fffzffff"
        let result = UIColor(hexColorString: color)
        XCTAssertNil(result)
    }

    func testInvalidLengthInput() {
        let color = "#ff"
        let result = UIColor(hexColorString: color)
        XCTAssertNil(result)
    }

    func testInvalidLengthInput2() {
        let color = "#ffaaffaaff"
        let result = UIColor(hexColorString: color)
        XCTAssertNil(result)
    }
}
