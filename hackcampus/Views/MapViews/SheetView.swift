//
//  SheetView.swift
//  hackcampus
//
//  Created by Travis Zhang on 8/26/20.
//  Copyright © 2020 Michael Liang. All rights reserved.
//

import SwiftUI

// Enum to identify whether the sheet is up on view or down
enum Position {
    case up
    case down
}

// Generate SheetView generic where generic parameter must be a View
struct SheetView<Content>: View where Content: View {
    
    // Keep track of current height after drag has ended
    @Binding var currentHeight: CGFloat
    // Keep track of drag state; will change and update vertical Offset of view
    @Binding var movingOffset: CGFloat
    // Position of view
    var position = Position.up
    var smallHeight: CGFloat = 50
    // Called when drag has ended
    var onDragEnded: ((_ position: Position) ->()) = {_ in}
    // Closure that will return a View
    var content: () -> Content
    
    var body: some View {
        Group(content: self.content)
            // Makes the parent View (group container) fill entire screen vertically and makes all children aligned to bottom
            .frame(minHeight: 0.0, maxHeight: .infinity, alignment: .bottom)
            // When dragging starts, the view will move by changing its Y offset
            .offset(y: self.movingOffset)
            .gesture(
                DragGesture().onChanged({ drag in
                    // Check if movingOffset >= 0 and perform drag
                    // Don't want to move view up
                    if(self.movingOffset >= 0) {
                        self.movingOffset = drag.translation.height + self.currentHeight
                    }
                }).onEnded({ drag in
                    // Animate back to final height based on where the user lifted finger
                    withAnimation( .spring(dampingFraction: 0.7) ) {
                        if(self.movingOffset > -50) {
                            self.movingOffset = 0.0
                            self.onDragEnded(.up)
                        }
                        
                        if drag.translation.height > 80 {
                            self.movingOffset = self.smallHeight
                            self.onDragEnded(.down)
                        }
                        
                        self.currentHeight = self.movingOffset
                    }
                })
            )
            // Removes bottom gap and makes view fill entire bottom and top area
            .edgesIgnoringSafeArea(.all)
    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView(currentHeight: .constant(0.0), movingOffset: .constant(0.0)) {
            Rectangle().foregroundColor(Color.red).frame(height: 500)
        }
    }
}
