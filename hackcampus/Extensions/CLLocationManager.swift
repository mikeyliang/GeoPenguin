//
//  CLLocationManager.swift
//  test
//
//  Created by Travis Zhang on 8/28/20.
//  Copyright © 2020 Travis Zhang. All rights reserved.
//

#if canImport(Foundation)
    import Foundation
#endif
#if canImport(SwiftUI)
    import SwiftUI
#endif
#if canImport(MapKit)
    import MapKit
#endif
#if canImport(CoreGraphics)
    import CoreGraphics
#endif

extension CLLocationManager {
    func isInsideFence(points: Binding<[CGPoint]>, locations: Binding<[MKMapPoint]>, map: MKMapView) -> Bool {
        let coor = self.location?.coordinate ?? nil
        if coor != nil && locations.wrappedValue.count > 0 {
            let polygon = MKPolygon(coordinates: locations.wrappedValue.map({$0.coordinate}), count: locations.wrappedValue.count)
            return polygon.containsCoor(coor: coor!)
        }
        else {
            return false
        }
    }
}
