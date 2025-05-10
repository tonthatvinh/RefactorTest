//
//  ConfigurationManagerTest.swift
//  RefactorTestTests
//
//  Created by vinhton on 5/10/25.
//

import XCTest
import Swinject

@testable import RefactorTest

final class ConfigurationManagerTest: XCTestCase {
    let container: Container = {
      let container = Container()
      container.register(Configuration.self, name: "Case1") { _ in
          ConfigurationManager("Info", bundle: .main)
      }
      return container
    }()
    
    // 
    func testGetW3wApiKey() {
      let manager = container.resolve(Configuration.self, name: "Case1") as! ConfigurationManager
      
      XCTAssertEqual(manager.getW3WApiKey(), "CTF89056")
    }
    
    /*
     Test all enum keys are present
     **/
    func testKeysValues() {
        XCTAssertEqual(ConfigurationManager.PlistKey.MainDictionary.rawValue, "W3W")
        XCTAssertEqual(ConfigurationManager.PlistKey.ApiKey.rawValue, "ApiKey")
    }
}
