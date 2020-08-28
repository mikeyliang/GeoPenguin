//
//  ScrollListTitle.swift
//  hackcampus
//
//  Created by Travis Zhang on 8/28/20.
//  Copyright © 2020 Michael Liang. All rights reserved.
//

import SwiftUI

struct ScrollListTitle: View {
    
    @Binding var categoryName: String
    @Binding var numOfItems: Int
    
    var body: some View {
        HStack {
            Text("\(categoryName)").font(.custom("Poppins-bold", size: 20)).padding(.leading, -20)
        
            ZStack {
            
                Rectangle().fill(LinearGradient(gradient: Gradient(colors: [Color(red: 157/256, green: 78/256, blue: 221/256), Color(red: 224/256, green: 170/256, blue: 255/256)]), startPoint: UnitPoint(x: 0, y: 1), endPoint: UnitPoint(x: 1, y: 0))).frame(width: 30, height: 20.8695).cornerRadius(15).shadow(color: Color(red: 0, green: 0, blue: 0).opacity(0.5), radius: 4, x: 1, y: 4)
  
                Text("\(numOfItems)").font(.custom("Poppins-Bold", size: 10)).foregroundColor(.white)
                
            }.padding(.leading, 20)
        
        }.padding(.top, 20)
    }
}

//struct ScrollListTitle_Previews: PreviewProvider {
//    static var previews: some View {
//        ScrollListTitle()
//    }
//}
