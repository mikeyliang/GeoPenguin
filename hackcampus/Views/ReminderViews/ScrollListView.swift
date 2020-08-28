//
//  ScrollListView.swift
//  hackcampus
//
//  Created by Travis Zhang on 8/27/20.
//  Copyright © 2020 Michael Liang. All rights reserved.
//

import SwiftUI

struct ScrollListView: View {
    
    @Binding var categories: [Category]
    
    func removeLines() {
        // To remove only extra separators below the list:
        UITableView.appearance().tableFooterView = UIView()

        // To remove all separators including the actual ones:
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        
        removeLines()
        
        return ScrollView(.horizontal){
                
                HStack {
                    
                    ForEach(0..<self.categories.count, id: \.self) { index in
                        // VStack 1 starts here
                        VStack {
                            
                            ScrollListTitle(categoryName: self.$categories[index].categoryName, numOfItems: self.$categories[index].numOfItems)

                            ScrollListContent(categories: self.$categories)
                    
                        }
                        // VStack 1 ends here
                    }
                }
   
            }
    }
}

//struct ScrollListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ScrollListView(categories: Binding<[Category(categoryName: "COVID", items: [CategoryItem(itemName: "Mask"), CategoryItem(itemName: "Hand Sanitizer")], numOfItems: 2)]>)
//    }
//}

struct ScrollListView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
