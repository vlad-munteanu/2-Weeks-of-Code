//
//  MainVC.swift
//  Speed Limit Checker
//
//  Created by Vlad Munteanu on 3/2/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import UIKit
import CoreLocation

class MainVC: UIViewController, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    
    //main view
    let mainView = MainView()
    
    public override func loadView() {
        self.view = mainView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        if NSString(string:UIDevice.current.systemVersion).doubleValue > 8 {
            locationManager.requestAlwaysAuthorization()
        }
        locationManager.desiredAccuracy=kCLLocationAccuracyBest
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        var speed: CLLocationSpeed = CLLocationSpeed()
        speed = locationManager.location!.speed
        print(speed)
    }
    
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status != CLAuthorizationStatus.denied{
            locationManager.startUpdatingLocation()
        }
    }
    
}
