//
//  ContentView.swift
//  hackcampus
//
//  Created by Michael Liang on 8/26/20.
//  Copyright © 2020 Michael Liang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button(action: {
            // do nothing
        }) {
            Text("Click me to do nothing")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
