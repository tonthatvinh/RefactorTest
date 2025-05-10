//
//  AntipodesPresenterTests.swift
//  RefactorTest
//
//  Created by TonThatVinh on 10/05/2025.
//  Copyright © 2025 W3W. All rights reserved.
//

import XCTest
import W3WSwiftApi
import CoreLocation
@testable import RefactorTest

class AntipodesPresenterTest: XCTestCase {

  override func setUp() {
    super.setUp()
    // Put setup code here.
    // This method is called before the invocation of each test method in the class.
  }

  override func tearDown() {
    // Put teardown code here.
    // This method is called after the invocation of each test method in the class.
    super.tearDown()
  }

    class MockInteractor: AntipodesInteractor {
        func convertTo3wa(coordinate: CLLocationCoordinate2D, completion: @escaping W3WSwiftCore.W3WSquareResponse) {
            
        }
        

  }

  class MockRouter: AntipodesRouter {

  }

    class MockViewController: AntipodesView {
        func showAnnotation(annotation: RefactorTest.ColorPointAnnotation) {
            
        }
        
        func showAntipodeAnnotation(annotation: RefactorTest.ColorPointAnnotation) {
            
        }
        
        func centerMapAt(_ coordinate: CLLocationCoordinate2D) {
            
        }
        

  }
}

