//
//  MapContentView.swift
//  hackcampus
//
//  Created by Travis Zhang on 8/27/20.
//  Copyright © 2020 Michael Liang. All rights reserved.
//

import SwiftUI
import MapKit

struct Location {
    var city: String
    var state: String
    var country: String
    var coordinates: CLLocationCoordinate2D
}

struct MapContentView: View {
    
    @State private var currentHeight: CGFloat = 150.0
    @State private var movingOffset: CGFloat = 150.0
    
    @ObservedObject var locationManager = LocationManager()
    
    var body: some View {
        
        return NavigationView {
            ZStack(alignment: .bottom) {
                MapView()
                    .edgesIgnoringSafeArea(.all)
                    .sheet(isPresented: $locationManager.showAlert) {
                        Text("Entered Region")
                }

                CustomSheetView(currentHeight: self.$currentHeight, movingOffset: self.$movingOffset)
            }
        }
    }
}

struct MapContentView_Previews: PreviewProvider {
    static var previews: some View {
        MapContentView()
    }
}
