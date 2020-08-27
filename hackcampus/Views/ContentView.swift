//
//  ContentView.swift
//  hackcampus
//
//  Created by Michael Liang on 8/26/20.
//  Copyright © 2020 Michael Liang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    // TODO: Change content on this view; This view will be the main page
    
    @State private var currentHeight: CGFloat = 0.0
    @State private var movingOffset: CGFloat = 0.0
    
    var body: some View {
        ZStack {
            Text("Hello World")
            CustomSheetView(currentHeight: self.$currentHeight, movingOffset: self.$movingOffset)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
