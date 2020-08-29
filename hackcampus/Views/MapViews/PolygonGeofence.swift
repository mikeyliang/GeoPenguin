//
//  Test.swift
//  hackcampus
//
//  Created by Travis Zhang on 8/28/20.
//  Copyright © 2020 Michael Liang. All rights reserved.
//

import SwiftUI

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

struct PolygonGeofence: View {
    
    @State var geofencing: Bool = false
    @State var points:[CGPoint] = []
    @State var locations: [MKMapPoint] = []
    @State var inGeofence: Bool = false
    
    var body: some View {
        
        ZStack {

            VStack {
                ForEach(0..<self.locations.count, id: \.self) { loc in
                    HStack {
                        ZStack {
                            Color.red
                                .frame(width:50, height:50, alignment: .center)
                                .clipShape(Circle())
                            Image(systemName: "\(loc+1).circle")
                                .resizable()
                                .frame(width:40, height:40, alignment: .center)
                                .foregroundColor(.white)

                        }
                        VStack {
                            Text("latitude: \(self.locations[loc].coordinate.latitude)")
                            Text("longitude: \(self.locations[loc].coordinate.longitude)")
                        }
                    }

                }
                MapButton(title: "Select Geofence", icon: "map") {
                    self.geofencing.toggle()
                }

            }.opacity(self.geofencing ? 0:1)
            
            SwiftUIPolygonGeofence(show: self.$geofencing, points: self.$points, locations: self.$locations)
        
        }
        
    }
}

struct PolygonGeofence_Previews: PreviewProvider {
    static var previews: some View {
        PolygonGeofence()
    }
}
