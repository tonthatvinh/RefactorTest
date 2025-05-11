//
//  W3WServiceMock.swift
//  RefactorTestTests
//
//  Created by vinhton on 5/10/25.
//

import W3WSwiftApi
import CoreLocation
import SwiftyJSON

@testable import RefactorTest

class W3WServiceMock: W3WService {
    var convertTo3waSuccess: Bool = false
    
    func convertTo3wa(coordinate: CLLocationCoordinate2D, completion: @escaping W3WSquareResponse) {
        if convertTo3waSuccess {
            let response = Bundle(for: type(of: self)).readJSONFromFile("w3w-square-response")!
            let square = W3WServiceMock.parseJSONObject(JSON(response))
            completion(square, nil)
        } else {
            let error: W3WError = .dataError
            completion(nil, error)
        }
    }
    
    static func parseJSONObject(_ object: JSON) -> W3WBaseSquare {
        let coodinates = object["coordinates"]
        let location = CLLocationCoordinate2D(latitude: coodinates["lat"].doubleValue, longitude: coodinates["lng"].doubleValue)
        return W3WBaseSquare(words: object["words"].string, coordinates: location)
    }
}
