//
//  CategoryItem.swift
//  hackcampus
//
//  Created by Travis Zhang on 8/27/20.
//  Copyright © 2020 Michael Liang. All rights reserved.
//

import Foundation

struct CategoryItem {
    var itemName: String
    var checked = false
}

struct Category {
    var categoryName: String
    var items: [CategoryItem] = []
    var numOfItems: Int = 0
    
    mutating func addItem(_ itemName: String) {
        items.append(CategoryItem(itemName: itemName))
        numOfItems += 1
    }
}

