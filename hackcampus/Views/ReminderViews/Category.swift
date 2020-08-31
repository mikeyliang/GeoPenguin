//
//  CategoryItem.swift
//  hackcampus
//
//  Created by Travis Zhang on 8/27/20.
//  Copyright © 2020 Michael Liang. All rights reserved.
//

import Foundation

struct CategoryItem: Identifiable, Codable {
    let id = UUID()
    var itemName: String
}

struct Category: Identifiable, Codable {
    let id = UUID()
    var categoryName: String
    var items: [CategoryItem] = []
    var numOfItems: Int = 1
    
    mutating func addItem(_ itemName: String) {
        items.append(CategoryItem(itemName: itemName))
        numOfItems += 1
    }
    
    mutating func removeItem(_ itemName: String) {
        print(items.count)
        for itemIndex in 0..<items.count {
            if(itemName == items[itemIndex].itemName) {
                items.remove(at: itemIndex)
                numOfItems -= 1
                break
            }
        }
    }
}
