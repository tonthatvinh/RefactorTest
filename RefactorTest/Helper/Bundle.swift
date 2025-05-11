//
//  Bundle.swift
//  RefactorTest
//
//  Created by vinhton on 5/10/25.
//

import UIKit

extension Bundle {
    func readJSONFromFile(_ name: String) -> Any? {
      if let jsonData = readDataFromFile(name: name, ofType: "json") {
        return try? JSONSerialization.jsonObject(with: jsonData, options: [])
      }
      
      return nil
    }
    
    private func readDataFromFile(name: String, ofType: String) -> Data? {
      if let jsonFile = path(forResource: name, ofType: ofType) {
        return (try? Data.init(contentsOf: URL(fileURLWithPath: jsonFile)))
      }
      
      return nil
    }
}
