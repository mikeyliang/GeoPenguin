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
    
    @ObservedObject var categoriesContainer: CategoriesContainer
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
                    self.categoriesContainer.addItem(index: self.index, itemName: self.name)
                    self.presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct AddCategoryItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddCategoryItemView(categoriesContainer: CategoriesContainer(), index: 0)
    }
}
