//
//  MapPage.swift
//  RestaurangGuiden
//
//  Created by Rahim Siahpoosh on 2018-01-12.
//  Copyright © 2018 Kaiser&Kaiser. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MapPage: UIViewController, CLLocationManagerDelegate {

    var address = ""
    var name = ""
    var locationManager: CLLocationManager!
    var myLocation: CLLocation!
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(address)
        
        findMyLocation()
            mapView.showsUserLocation = true
        
        myLocation = CLLocation(latitude: 59.3474678, longitude: 18.1109555)
        
        //let myLocation: CLLocation = CLLocation(latitude: 59.3474678, longitude: 18.1109555)
        //
        //        let annotation = MKPointAnnotation()
        //
        //        annotation.coordinate = myLocation.coordinate
        //        annotation.title = "Newton"
        //        mapView.addAnnotation(annotation)
        //
        //        let region = MKCoordinateRegionMakeWithDistance(annotation.coordinate, 250, 250)
        //        mapView.setRegion(region, animated: false)
        CLGeocoder().geocodeAddressString(address, completionHandler: {(placemarks, error)
            in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            if let placemarks = placemarks {
                print(placemarks)
                let placemarks = placemarks[0]
                let annotation = MKPointAnnotation()
                
                if let restLocation = placemarks.location{
                    annotation.coordinate = restLocation.coordinate
                    annotation.title = self.name
                    
                    let distance = self.myLocation.distance(from: restLocation)
                    let distString = String(format:"%.1f", distance/1000)
                    annotation.title = self.name + "\n" + distString + " km"
                    self.mapView.addAnnotation(annotation)
                    let region = MKCoordinateRegionMakeWithDistance(restLocation.coordinate, 250,250)
                    self.mapView.setRegion(region, animated: false)
                }
            }
        })
    }
    
    @IBAction func swapMap(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 1:
            mapView.mapType = .satellite
        default:
            mapView.mapType = .standard
        }
    }
    
    func findMyLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation: CLLocation = locations[0] as CLLocation
        //myLocation = locations[0] as CLLocation
        
        print("user latitude = \(userLocation.coordinate.latitude)")
        print("user longitude = \(userLocation.coordinate.longitude)")
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error \(error)")
    }

}
