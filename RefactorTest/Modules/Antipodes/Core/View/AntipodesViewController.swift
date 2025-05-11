//
//  AntipodesViewController.swift
//  RefactorTest
//
//  Created by TonThatVinh on 10/05/2025.
//  Copyright © 2025 W3W. All rights reserved.
//

import UIKit
import MapKit

protocol AntipodesView: AnyObject {
    func showAnnotation(annotation: ColorPointAnnotation)
    func showAntipodeAnnotation(annotation: ColorPointAnnotation)
    func centerMapAt(_ coordinate: CLLocationCoordinate2D)
}

class AntipodesViewController: UIViewController, AntipodesView {
    @IBOutlet weak var mkMapView: MKMapView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    var presenter: AntipodesPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        label.text = "Select a square"
        label.layer.cornerRadius = 8.0
        label2.layer.cornerRadius = 8.0
    }
    
    func showAnnotation(annotation: ColorPointAnnotation) {
        DispatchQueue.main.async {
            self.mkMapView.addAnnotation(annotation)
            self.label.text = annotation.title
        }
    }
    
    func showAntipodeAnnotation(annotation: ColorPointAnnotation) {
        DispatchQueue.main.async {
            self.mkMapView.addAnnotation(annotation)
            self.label2.text = annotation.title
        }
    }
    
    func centerMapAt(_ coordinate: CLLocationCoordinate2D) {
        mkMapView.setCenter(coordinate, animated: true)
    }
}

extension AntipodesViewController: MKMapViewDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first, let map = view.subviews.first as? MKMapView else { return }
        let coord = map.convert(touch.location(in: touch.view), toCoordinateFrom: map)
        presenter.showCoordinate(coordinate: coord)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
      guard let colorPointAnnotation = annotation as? ColorPointAnnotation else {
        let defaultPin = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "defaultPin")
        defaultPin.pinTintColor = .gray // Or any default color you prefer
        return defaultPin
      }
      var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: "ColoredPin") as? MKPinAnnotationView
      if pinView == nil {
        pinView = MKPinAnnotationView(annotation: colorPointAnnotation, reuseIdentifier: "ColoredPin")
      } else {
        pinView?.annotation = colorPointAnnotation
      }

      pinView?.pinTintColor = colorPointAnnotation.color ?? .black

      return pinView
    }
}
