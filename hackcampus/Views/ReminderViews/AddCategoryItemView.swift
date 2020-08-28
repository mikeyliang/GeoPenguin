//
//  AddCategoryItemView.swift
//  hackcampus
//
//  Created by Travis Zhang on 8/27/20.
//  Copyright © 2020 Michael Liang. All rights reserved.
//

import SwiftUI

struct AddCategoryItemView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var categories: [Category]
    @State var index: Int
    @State private var name = ""
    
    var body: some View {
        
        NavigationView {
            Form {
                Section(header: Text("Add an item")) {
                    TextField("Name", text: $name)
                }
            }
            .navigationBarTitle("Item")
            .navigationBarItems(leading: Button("Cancel") {
                self.presentationMode.wrappedValue.dismiss()
                }, trailing: Button("Add") {
                    self.categories[self.index].addItem(self.name)
                    self.presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

//struct AddCategoryItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddCategoryItemView(categories: Binding<[Category(categoryName: "COVID", items: [CategoryItem(itemName: "Mask"), CategoryItem(itemName: "Hand Sanitizer")], numOfItems: 2)]>, index: 0)
//    }
//}
