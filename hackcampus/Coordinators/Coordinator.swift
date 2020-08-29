//
//  Coordinator.swift
//  hackcampus
//
//  Created by Travis Zhang on 8/27/20.
//  Copyright © 2020 Michael Liang. All rights reserved.
//

import Foundation
import MapKit

// Responsible for coordinating different delegate functions/eevnts from MKMapView delegate
final class Coordinator: NSObject, MKMapViewDelegate {
    
    // create MapView control
    var control: MapView
    
    var locManager: LocationManager
    
    // Initialize MapView control
    init(_ control: MapView, _ locManager: LocationManager) {
        self.control = control
        self.locManager = locManager
    }
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        
        if let annotationView = views.first {
            if let annotation = annotationView.annotation {
                if annotation is MKUserLocation {
                    
                    let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
                    mapView.setRegion(region, animated: true)
                    
                }
            }
        }
    }
    
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        let view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: nil)
//        view.canShowCallout = true
//        return view
//    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let circleRenderer = MKCircleRenderer(overlay: overlay)
        circleRenderer.strokeColor = UIColor.red
        circleRenderer.lineWidth = 1.0
        return circleRenderer
    }
}
