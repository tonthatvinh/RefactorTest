//
//  ProtocolHelper.swift
//  RefactorTest
//
//  Created by vinhton on 5/10/25.
//

import CoreLocation
import W3WSwiftApi

extension CLLocationCoordinate2D {
    func toString() -> String { String(format: "(%f, %f)", latitude, longitude) }
    
    func antipole() -> CLLocationCoordinate2D {
        var longitude = longitude + 180.0
        if longitude > 180.0 {
            longitude = longitude - 360.0
        }
        return CLLocationCoordinate2D(latitude: -latitude, longitude: longitude)
    }
}
