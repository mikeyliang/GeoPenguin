//
//  AddCategoryView.swift
//  hackcampus
//
//  Created by Travis Zhang on 8/27/20.
//  Copyright © 2020 Michael Liang. All rights reserved.
//

import SwiftUI

struct AddCategoryView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var categories: [Category]
    @State private var name = ""
    @State private var itemName = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Add a category name")) {
                    TextField("Name", text: $name)
                }
                
                Section(header: Text("Add at least one item")) {
                    TextField("Item Name", text: $itemName)
                }
            }
            .navigationBarTitle("Category")
            .navigationBarItems(leading: Button("Cancel") {
                self.presentationMode.wrappedValue.dismiss()
                }, trailing: Button("Save") {
                    let category = Category(categoryName: self.name, items: [CategoryItem(itemName: self.itemName)])
                self.categories.append(category)
                self.presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

//struct AddCategoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddCategoryView(categories: Binding<[Category(categoryName: "COVID", items: [CategoryItem(itemName: "Mask"), CategoryItem(itemName: "Hand Sanitizer")], numOfItems: 2)])
//    }
//}
