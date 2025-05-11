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
import SwiftyJSON

@testable import RefactorTest

class AntipodesPresenterTest: XCTestCase {
    var presenter: AntipodesPresenterImp!
    var mockView: MockViewController!
    var mockInteractor: MockInteractor!
    var mockRouter: MockRouter!
    
    override func setUp() {
        super.setUp()
        mockView = MockViewController()
        mockInteractor = MockInteractor()
        mockRouter = MockRouter()
        presenter = AntipodesPresenterImp(view: mockView,
                                       interactor: mockInteractor,
                                       router: mockRouter)
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testShowCoordinate_Success() {
        presenter.showCoordinate(coordinate: CLLocationCoordinate2D(latitude: 10, longitude: 10))
        XCTAssertTrue(mockInteractor.convertTo3waCalled)
        XCTAssertTrue(mockView.showAnnotationCalled)
        XCTAssertTrue(mockView.showAntipodeAnnotationCalled)
        XCTAssertTrue(mockView.centerMapAtCalled)
    }
    
    func testShowCoordinate_NoWords_Success() {
        mockInteractor.makeRequestNoWord = true
        presenter.showCoordinate(coordinate: CLLocationCoordinate2D(latitude: 10, longitude: 10))
        XCTAssertTrue(mockInteractor.convertTo3waCalled)
        XCTAssertTrue(mockView.showAnnotationCalled)
        XCTAssertTrue(mockView.showAntipodeAnnotationCalled)
        XCTAssertTrue(mockView.centerMapAtCalled)
    }

    class MockInteractor: AntipodesInteractor {
        var convertTo3waCalled = false
        var makeRequestNoWord = false
        func convertTo3wa(coordinate: CLLocationCoordinate2D, completion: @escaping W3WSwiftCore.W3WSquareResponse) {
            convertTo3waCalled = true
            let response = Bundle(for: type(of: self)).readJSONFromFile(makeRequestNoWord ? "w3w-square-response-no-words": "w3w-square-response")!
            let square = W3WServiceMock.parseJSONObject(JSON(response))
            completion(square, nil)
        }
    }

    class MockRouter: AntipodesRouter {

    }

    class MockViewController: AntipodesView {
        var showAnnotationCalled = false
        var showAntipodeAnnotationCalled = false
        var centerMapAtCalled = false
        
        func showAnnotation(annotation: RefactorTest.ColorPointAnnotation) {
            showAnnotationCalled = true
        }
        
        func showAntipodeAnnotation(annotation: RefactorTest.ColorPointAnnotation) {
            showAntipodeAnnotationCalled = true
        }
        
        func centerMapAt(_ coordinate: CLLocationCoordinate2D) {
            centerMapAtCalled = true
        }
    }
}

