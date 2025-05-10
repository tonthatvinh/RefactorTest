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
  
}

class AntipodesViewController: UIViewController, AntipodesView {
    @IBOutlet weak var mkMapView: MKMapView!
    
    var presenter: AntipodesPresenter!
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
