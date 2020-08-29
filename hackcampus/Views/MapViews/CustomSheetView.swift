//
//  CustomSheetView.swift
//  hackcampus
//
//  Created by Travis Zhang on 8/26/20.
//  Copyright © 2020 Michael Liang. All rights reserved.
//

import SwiftUI

struct CustomSheetView: View {
    
    @Binding var currentHeight: CGFloat
    @Binding var movingOffset: CGFloat
    
    var body: some View {
        SheetView(currentHeight: self.$currentHeight, movingOffset: self.$movingOffset, smallHeight: 150, onDragEnded: { position in
            // Do things on drag end
        }) {
            ZStack(alignment: .top) {
                ToolbarView(currentHeight: self.$currentHeight, movingOffset: self.$movingOffset)
                SettingsView(movingOffset: self.$currentHeight)
            }
            .background(Color.white)
            .clipShape(RoundedShape())
            .shadow(color: Color.gray.opacity(0.2), radius: 6, x: 0.0, y: -5)
        }
    }
}

struct CustomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        CustomSheetView(currentHeight: .constant(0.0), movingOffset: .constant(0.0))
    }
}
