//
//  ToolBarButton.swift
//  hackcampus
//
//  Created by Travis Zhang on 8/27/20.
//  Copyright © 2020 Michael Liang. All rights reserved.
//

import SwiftUI

struct ToolbarButton: View{
    
    // Parameters for type of image to show
    var icon = "gear"
    var isSelected = false
    var action: (()->()) = {}

    var body: some View{
        
        return Button(action: {
            self.action()
        }) {
            // Create HStack to be able to place buttons next to each other
            HStack {
                Image(systemName: self.icon)
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .foregroundColor(Color.purple)
                
            }.padding(10)
                .background(Color.purple.opacity(0.2))
                .cornerRadius(10)
        }
    }
}


struct ToolbarButton_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarButton()
    }
}
