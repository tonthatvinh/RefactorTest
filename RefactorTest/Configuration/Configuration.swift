//
//  Configuration.swift
//  RefactorTest
//
//  Created by vinhton on 5/10/25.
//

import UIKit

protocol Configuration {
    func getW3WApiKey() -> String
}

class ConfigurationManager: Configuration {
    private var parsedPlist: NSDictionary?

    enum PlistKey: String {
        case MainDictionary = "W3W"
        case ApiKey
    }
    
    init(_ plistName: String? = "Info", bundle: Bundle? = Bundle.main) {
      if let path = bundle?.path(forResource: plistName, ofType: "plist") {
        parsedPlist = NSDictionary(contentsOfFile: path)?
          .object(forKey: PlistKey.MainDictionary.rawValue) as? NSDictionary
      }
    }

    func getW3WApiKey() -> String {
        return parsedPlist?.object(forKey: PlistKey.ApiKey.rawValue) as? String ?? ""
    }
}
