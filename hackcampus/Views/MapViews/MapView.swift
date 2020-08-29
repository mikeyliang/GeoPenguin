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
    
    var locationManager = LocationManager()
    
    func startGeofencingMonitoring() {
        print("Geofence starting")
        
        let coordinate = CLLocationCoordinate2D(latitude: 37.703026, longitude: -121.759735)
    
        let moniteringCoordinate = CLLocationCoordinate2DMake(coordinate.longitude, coordinate.latitude)
        let moniteringRegion = CLCircularRegion.init(center: moniteringCoordinate, radius: 20.0, identifier: "test" )
        locationManager.startMonitoring(for: moniteringRegion)
    }
    
    func makeUIView(context: Context) -> MKMapView {
//        startGeofencingMonitoring()
        let map = MKMapView()
        map.showsUserLocation = true
        map.userTrackingMode = .follow
        map.delegate = context.coordinator
        
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
