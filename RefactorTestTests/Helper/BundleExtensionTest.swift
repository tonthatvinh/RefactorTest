//
//  BundleExtensionTest.swift
//  RefactorTestTests
//
//  Created by vinhton on 5/11/25.
//

import XCTest
@testable import RefactorTest

final class BundleExtensionTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testReadJSONFromFile() {
      XCTAssertNil(Bundle(for: type(of: self)).readJSONFromFile("invalid_name"))
      XCTAssertEqual(Bundle(for: type(of: self)).readJSONFromFile("legacy-error") as! Dictionary, ["message": "legacy error"])
    }
}
