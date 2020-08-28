//
//  ScrollListContent.swift
//  hackcampus
//
//  Created by Travis Zhang on 8/28/20.
//  Copyright © 2020 Michael Liang. All rights reserved.
//

import SwiftUI

struct ScrollListContent: View {
    
    @Binding var categories: [Category]
    var body: some View {
        ZStack(alignment: .topTrailing) {
        
                    List() {
                    
                        
                        
                        LoopViews(categories: $categories)
                        
                    }.buttonStyle(PlainButtonStyle())
                    .frame(width: 255, height: 300).cornerRadius(30).shadow(radius: 5)
            
                }
                .padding(EdgeInsets(top: 20.0, leading: 60.0, bottom: 20.0, trailing: 60.0))
    }
}

struct ScrollListAddButton: View {
    
    var body: some View {
        ZStack {
            Rectangle().fill(LinearGradient(gradient: Gradient(colors: [Color(red: 157/256, green: 78/256, blue: 221/256), Color(red: 224/256, green: 170/256, blue: 255/256)]), startPoint: UnitPoint(x: 0, y: 1), endPoint: UnitPoint(x: 1, y: 0))).frame(width:20, height: 20).cornerRadius(15).shadow(color: Color(red: 0, green: 0, blue: 0).opacity(0.5), radius: 4, x: 1, y: 4)
            
            Image("add").resizable().frame(width:7, height:7).foregroundColor(.white)
        }
    }
}

struct LoopViews: View {
    
    @Binding var categories: [Category]
    @State private var selectedButton: Int? = nil
    @State private var showAddItem = false
    
    var body: some View {
        
        
        

                ForEach(0..<self.categories.count) { index in
                    HStack(alignment: .top) {
                        
                        Spacer()
                        
                        Button(action: {
                            self.selectedButton = index
                            self.showAddItem.toggle()
                        }) {
                            ScrollListAddButton()
                        }
                    }
                    ForEach(0..<self.categories[index].numOfItems, id: \.self) { itemIndex in


                        CheckboxField(id:
                            self.categories[index].items[itemIndex].id, label: self.categories[index].items[itemIndex].itemName, size: 14, textSize: 14)
                    }
                    

                    
                }.sheet(isPresented: self.$showAddItem) {
            AddCategoryItemView(categories: self.$categories, index: self.selectedButton!)
                }
    
    }
}

//struct ScrollListContent_Previews: PreviewProvider {
//    static var previews: some View {
//        ScrollListContent()
//    }
//}
