//
//  AntipodesPresenter.swift
//  RefactorTest
//
//  Created by TonThatVinh on 10/05/2025.
//  Copyright © 2025 W3W. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

class ColorPointAnnotation: MKPointAnnotation {
    var color: UIColor?
    
    init(title: String?, coordinate: CLLocationCoordinate2D, color: UIColor? = nil) {
        super.init()
        self.color = color
        self.title = title
        self.coordinate = coordinate
    }
}

protocol AntipodesPresenter {
    func showCoordinate(coordinate: CLLocationCoordinate2D)
}

class AntipodesPresenterImp: AntipodesPresenter {

    weak var view: AntipodesView!
    var interactor: AntipodesInteractor!
    var router: AntipodesRouter!
    init(view: AntipodesView, interactor: AntipodesInteractor, router: AntipodesRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func showCoordinate(coordinate: CLLocationCoordinate2D) {
        interactor.convertTo3wa(coordinate: coordinate) { [weak self] square, error in
            guard let self else { return }
            let title = square?.words ?? coordinate.toString()
            let annotation = ColorPointAnnotation(title: title,
                                                  coordinate: coordinate,
                                                  color: .red)
            view.showAnnotation(annotation: annotation) 
        }
        
        print(coordinate, coordinate.antipole())
        showAntipole(coordinate: coordinate.antipole())
    }
    
    func showAntipole(coordinate: CLLocationCoordinate2D) {
        interactor.convertTo3wa(coordinate: coordinate) { [weak self] square, error in
            guard let self, let squareCoordinate = square?.coordinates else { return }
            let title = square?.words ?? squareCoordinate.toString()
            let annotation = ColorPointAnnotation(title: title,
                                                  coordinate: squareCoordinate,
                                                  color: .blue)
            view.showAntipodeAnnotation(annotation: annotation)
        }
        view.centerMapAt(coordinate)
    }
}
