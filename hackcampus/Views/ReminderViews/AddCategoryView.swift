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
    
    @ObservedObject var categoriesContainer: CategoriesContainer
    @State private var name = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Add a category name")) {
                    TextField("Name", text: $name)
                }
            }
            .navigationBarTitle("Category")
            .navigationBarItems(leading: Button("Cancel") {
                self.presentationMode.wrappedValue.dismiss()
                }, trailing: Button("Save") {
                let category = Category(categoryName: self.name)
                self.categoriesContainer.categories.append(category)
                self.presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct AddCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        AddCategoryView(categoriesContainer: CategoriesContainer())
    }
}
