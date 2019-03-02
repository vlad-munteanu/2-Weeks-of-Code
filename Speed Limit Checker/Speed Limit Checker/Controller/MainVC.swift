//
//  MainVC.swift
//  Speed Limit Checker
//
//  Created by Vlad Munteanu on 3/2/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MainVC: UIViewController, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    
    //main view
    let mainView = MainView()
    
    public override func loadView() {
        self.view = mainView
    }
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMap()
        if CLLocationManager.locationServicesEnabled() == true {
            
            if CLLocationManager.authorizationStatus() == .restricted || CLLocationManager.authorizationStatus() == .denied ||  CLLocationManager.authorizationStatus() == .notDetermined {
                locationManager.requestWhenInUseAuthorization()
            }
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.delegate = self
            locationManager.startUpdatingLocation()
        } else {
            print("PLease turn on location services or GPS")
        }
    }
    
    func setupMap() {
        mainView.mapView.showsUserLocation = true
        mainView.mapView.isScrollEnabled = false
        mainView.mapView.isRotateEnabled = false
        mainView.mapView.isPitchEnabled = false
        mainView.mapView.isZoomEnabled = false
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.locationManager.stopUpdatingLocation()
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.008, longitudeDelta: 0.008))
        self.mainView.mapView.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Unable to access your current location")
    }
    
}
