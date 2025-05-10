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
    
    var presenter: AntipodesPresenter!
    lazy var label = UILabel(frame: CGRect(x: 64.0, y: 64.0, width: view.frame.width - 128.0, height: 32.0))
    lazy var label2 = UILabel(frame: CGRect(x: 64.0, y: 64.0, width: view.frame.width - 128.0, height: 32.0))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "Select a square"
        label.textAlignment = .center
        label.layer.cornerRadius = 8.0
        label.font = .boldSystemFont(ofSize: 24.0)
        label.backgroundColor = .white
        label.textColor = .red
        label.frame = CGRect(x: 64.0, y: 64.0, width: 300.0, height: 32.0)
        view.addSubview(label)
        label2.textAlignment = .center
        label2.layer.cornerRadius = 8.0
        label2.font = .boldSystemFont(ofSize: 24.0)
        label2.backgroundColor = .white
        label2.textColor = .blue
        label2.frame = CGRect(x: 64.0, y: 100.0, width: 300.0, height: 32.0)
        view.addSubview(label2)
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
