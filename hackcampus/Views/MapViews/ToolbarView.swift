//
//  ToolBarView.swift
//  hackcampus
//
//  Created by Travis Zhang on 8/27/20.
//  Copyright © 2020 Michael Liang. All rights reserved.
//

import SwiftUI

struct ToolbarView: View {
    
    @Binding var currentHeight: CGFloat
    @Binding var movingOffset: CGFloat
    
    @State private var showEdit = false
    
    var body: some View {
        HStack {
            
            ToolbarButton(icon: "pencil") {
                self.showEdit.toggle()
            }
            .sheet(isPresented: $showEdit) {
                EditView()
            }
            .shadow(color: Color.purple.opacity(0.5), radius: 5, x: 0.0, y: 10)
            
            Spacer()
                               
            ToolbarButton(icon: "gear") {
                withAnimation(.spring(dampingFraction: 0.7)) {
                    self.currentHeight = 0.0
                    self.movingOffset = 0.0
                }
            }.shadow(color: Color.purple.opacity(0.5), radius: 5, x: 0.0, y: 10)
            
        }.padding(.top, 30)
            .padding(.horizontal, 30)
            .frame(minWidth: 0.0, maxWidth: .infinity)
            .offset(y: self.currentHeight == 0 ? -100 : 0)
    }
}

struct ToolbarView_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarView(currentHeight: .constant(0.0), movingOffset: .constant(0.0))
    }
}
