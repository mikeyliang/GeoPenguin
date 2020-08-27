//
//  TestView.swift
//  hackcampus
//
//  Created by Travis Zhang on 8/26/20.
//  Copyright © 2020 Michael Liang. All rights reserved.
//

import SwiftUI

struct TestView: View {
    
    // NOTE: TestView is purely for visualization purposes; Will alter once we finalize settings design
    
    @Binding var movingOffset: CGFloat
    let screenSize = UIScreen.main.bounds.size
    @State private var textTitle = ""
    
    var body: some View {
        let screenWidth = screenSize.width
        let phoneRatio = String(format: "%.3f", screenSize.width / screenSize.height)
        let refRatio =   String(format: "%.3f",  9.0 / 16.0)
        let isXorAbove = phoneRatio != refRatio
        
        return VStack(spacing: 25) {
            //                    Spacer()
            Rectangle()
                .frame(width: 80, height: 7)
                .cornerRadius(5)
                .foregroundColor(Color.gray.opacity(0.5))
            Text("Create New Wiki")
            
            VStack {
                TextField("Type a title", text: self.$textTitle, onEditingChanged: { value in
                    print(value)
                }, onCommit: {
                    print("Finished editing")
                }).multilineTextAlignment(.center)
                Divider().padding(.horizontal,50)
            }
            
            VStack(spacing: 15){
                TestButton(icon: "plus", color: "green", text: "Create New Wiki", isFolder: false, action: {
                    print("Adding new wiki")
                })
                TestButton(icon: "folder.fill.badge.plus", color: "green", text: "Create New Folder", isFolder: true,action: {
                    print("Adding new folder")
                })
            }
            
            Text("*Only visible to you, if you want you can share with others later")
                .font(.footnote)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .frame(width: screenWidth * 0.8 )
                .foregroundColor(Color.gray)
            
        }.padding(.bottom, isXorAbove ? 60 : 50 )
            .padding(.top, 15)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView(movingOffset: .constant(0.0))
    }
}
