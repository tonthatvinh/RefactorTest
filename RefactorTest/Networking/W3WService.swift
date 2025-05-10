//
//  W3WService.swift
//  RefactorTest
//
//  Created by vinhton on 5/10/25.
//
import UIKit
import W3WSwiftApi
import CoreLocation

protocol W3WService {
    func convertTo3wa(coordinate: CLLocationCoordinate2D, completion: @escaping W3WSquareResponse)
}

class W3WServiceDefault: W3WService {
    let api: What3WordsV4
    let configuration: ConfigurationManager
    
    init() {
        configuration = ConfigurationManager()
        api = What3WordsV4(apiKey: configuration.getW3WApiKey())
    }
    
    func convertTo3wa(coordinate: CLLocationCoordinate2D, completion: @escaping W3WSquareResponse) {
        api.convertTo3wa(coordinates: coordinate, language: W3WBaseLanguage(code: "en"), completion: completion)
    }
}
