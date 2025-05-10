//
//  AntipodesInteractor.swift
//  RefactorTest
//
//  Created by TonThatVinh on 10/05/2025.
//  Copyright © 2025 W3W. All rights reserved.
//

import Foundation
import W3WSwiftApi
import CoreLocation

protocol AntipodesInteractor {
    func convertTo3wa(coordinate: CLLocationCoordinate2D, completion: @escaping W3WSquareResponse)
}

class AntipodesInteractorImp: AntipodesInteractor {
    let w3wService: W3WService
    
    init(w3wService: W3WService) {
        self.w3wService = w3wService
    }
    
    func convertTo3wa(coordinate: CLLocationCoordinate2D, completion: @escaping W3WSquareResponse) {
        w3wService.convertTo3wa(coordinate: coordinate, completion: completion)
    }
}
