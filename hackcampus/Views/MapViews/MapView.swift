//
//  MapView.swift
//  hackcampus
//
//  Created by Travis Zhang on 8/27/20.
//  Copyright © 2020 Michael Liang. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    @ObservedObject var locationManager = LocationManager()
    let map = MKMapView()
    
    func setupData() {
        print("Geofence started")
        // 1. check if system can monitor regions
        if CLLocationManager.isMonitoringAvailable(for: CLCircularRegion.self) {
     
            // 2. region data
            let title = "Home"
            let coordinate = CLLocationCoordinate2DMake(37.703026, -121.759735)
            let regionRadius = 500.0
     
            // 3. setup region
            let region = CLCircularRegion(center: CLLocationCoordinate2D(latitude: coordinate.latitude,
                longitude: coordinate.longitude), radius: regionRadius, identifier: title)
            locationManager.startMonitoring(for: region)
     
            // 4. setup annotation
            let restaurantAnnotation = MKPointAnnotation()
            restaurantAnnotation.coordinate = coordinate;
            restaurantAnnotation.title = "\(title)";
            map.addAnnotation(restaurantAnnotation)
     
            // 5. setup circle
            let circle = MKCircle(center: coordinate, radius: regionRadius)
            map.addOverlay(circle)
        }
        else {
            print("System can't track regions")
        }
    }
    
    func makeUIView(context: Context) -> MKMapView {
        map.showsUserLocation = true
        map.userTrackingMode = .follow
        map.delegate = context.coordinator
        
        
        setupData()
        // TODO: Annotation for all Locations
//        let annotation = MKPointAnnotation()
//        annotation.title = "Test"
//        annotation.subtitle = "Testing it out"
//        annotation.coordinate = CLLocationCoordinate2D(latitude: 51.5, longitude: 0.13)
//        map.addAnnotation(annotation)
        
        return map
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self, locationManager)
    }
    
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
