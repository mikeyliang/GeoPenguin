//
//  LocationManager.swift
//  hackcampus
//
//  Created by Travis Zhang on 8/27/20.
//  Copyright © 2020 Michael Liang. All rights reserved.
//

import Foundation
import MapKit

class LocationManager: NSObject, ObservableObject, MKMapViewDelegate {
    
    @Published var locationManager = CLLocationManager()
    @Published var location: CLLocation? = nil
    var showAlert: Bool = false
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        
//        let geofenceRegionCenter = CLLocationCoordinate2DMake(coordinate.latitude, coordinate.longitude)
//        let geofenceRegion = CLCircularRegion(center: geofenceRegionCenter, radius: 1, identifier: "notifymeonExit")
//        geofenceRegion.notifyOnExit = true
//        geofenceRegion.notifyOnEntry = false
//        self.locationManager.startMonitoring(for: geofenceRegion)
    }
    
    func startMonitoring(for region: CLCircularRegion) {
        locationManager.startMonitoring(for: region)
    }
    
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.last else {
            return
        }
        
        self.location = location
    }
    
    // 1. user enter region
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print(manager.location!)
        self.showAlert = true
        print("Geofence enter")
    }
     
    // 2. user exit region
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        self.showAlert = false
        print("Geofence exit")
    }
}
