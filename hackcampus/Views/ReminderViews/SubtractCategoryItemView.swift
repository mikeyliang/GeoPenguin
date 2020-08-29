//
//  SubtractCategoryItemView.swift
//  hackcampus
//
//  Created by Travis Zhang on 8/29/20.
//  Copyright © 2020 Michael Liang. All rights reserved.
//

import SwiftUI

struct SubtractCategoryItemView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var categories: [Category]
    @State var index: Int
    @State private var name = ""
    
    var body: some View {
        
        NavigationView {
            Form {
                Section(header: Text("Remove item")) {
                    TextField("Name", text: $name)
                }
            }
            .navigationBarTitle("Remove Item")
            .navigationBarItems(leading: Button("Cancel") {
                self.presentationMode.wrappedValue.dismiss()
                }, trailing: Button("Remove") {
                    self.categories[self.index].removeItem(self.name)
                    self.presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

//struct SubtractCategoryItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        SubtractCategoryItemView()
//    }
//}
