//
//  TestButton.swift
//  hackcampus
//
//  Created by Travis Zhang on 8/26/20.
//  Copyright © 2020 Michael Liang. All rights reserved.
//

import SwiftUI

struct TestButton: View {
    
    // NOTE: Purely Visualization Purposes!

    let screenSize = UIScreen.main.bounds.size
    var icon = "plus"
    var color = "green"
    var text = "Create New Wiki"
    var isFolder = false
    var action: (()->()) = {}
    
    var body: some View {
        let screenWidth = screenSize.width
        
        return Button(action: {
            self.action()
        }) {
            HStack {
                Image(systemName: icon)
                    .resizable()
                    .frame(width: 15, height: 15)
                    .foregroundColor(isFolder ? Color.green : Color.white)
                
                Text(text)
                    .foregroundColor(isFolder ? Color.green : Color.white)
                
            }.frame(width: screenWidth * 0.7)
                .padding(.vertical)
                .background(Color.green.opacity(isFolder ? 0.2 : 1))
                .cornerRadius(10)
        }
    }
}

struct TestButton_Previews: PreviewProvider {
    static var previews: some View {
        TestButton()
    }
}
