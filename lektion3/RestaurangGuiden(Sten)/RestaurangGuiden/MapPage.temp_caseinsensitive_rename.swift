//
//  mapPage.swift
//  RestaurangGuiden
//
//  Created by Rahim Siahpoosh on 2018-01-11.
//  Copyright © 2018 Kaiser&Kaiser. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapPage: UIViewController {
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myLocation: CLLocation = CLLocation(latitude: 59.3474678, longitude: 18.1109555)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = myLocation.coordinate
        annotation.title = "Newton"
        mapView.addAnnotation(annotation)
        
        let region = MKCoordinateRegionMakeWithDistance(annotation.coordinate, 250, 250)
        mapView.setRegion(region, animated: false)
    }
}
