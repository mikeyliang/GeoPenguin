//
//  LocationManager.swift
//  hackcampus
//
//  Created by Travis Zhang on 8/27/20.
//  Copyright © 2020 Michael Liang. All rights reserved.
//

import Foundation
import MapKit

class LocationManager: NSObject, ObservableObject {
    
    @Published var locationManager = CLLocationManager()
    @Published var location: CLLocation? = nil
    
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
        self.locationManager.startMonitoring(for: region)
    }
    
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.last else {
            return
        }
        
        self.location = location
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("Geofence triggered")
    }

    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("Geofence triggered")
    }
}
