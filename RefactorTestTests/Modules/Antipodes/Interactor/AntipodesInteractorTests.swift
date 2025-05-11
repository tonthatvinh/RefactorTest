//
//  AntipodesInteractorTests.swift
//  RefactorTest
//
//  Created by TonThatVinh on 10/05/2025.
//  Copyright © 2025 W3W. All rights reserved.
//

import XCTest
import CoreLocation

@testable import RefactorTest

class AntipodesInteractorTests: XCTestCase {
    var w3wServiceMock: W3WServiceMock!
    var interactor: AntipodesInteractorImp!
    
    override func setUp() {
        super.setUp()
        w3wServiceMock = W3WServiceMock()
        interactor = AntipodesInteractorImp(w3wService: w3wServiceMock)
    }
  
    override func tearDown() {
        // Put teardown code here.
        // This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testConvertTo3waSuccess() {
        w3wServiceMock.convertTo3waSuccess = true
        let coordinate = CLLocationCoordinate2D(latitude: 10, longitude: 10)
        interactor.convertTo3wa(coordinate: coordinate) { square, error in
            XCTAssertNotNil(square)
            XCTAssertNil(error)
        }
    }
    
    func testConvertTo3waFailed() {
        w3wServiceMock.convertTo3waSuccess = false
        let coordinate = CLLocationCoordinate2D(latitude: 10, longitude: 10)
        interactor.convertTo3wa(coordinate: coordinate) { square, error in
            XCTAssertNil(square)
            XCTAssertNotNil(error)
        }
    }
}
