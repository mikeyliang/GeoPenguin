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

func save(_ categories: [Category]) {
    let data = categories.map { try? JSONEncoder().encode($0) }
    UserDefaults.standard.set(data, forKey: "categories")
    print("Data Saved!")
}

func load() -> [Category] {
    guard let encodedData = UserDefaults.standard.array(forKey: "categories") as? [Data] else {
        return [Category(categoryName: "COVID", items: [CategoryItem(itemName: "Mask"), CategoryItem(itemName: "Hand Sanitizer")], numOfItems: 2)]
    }
    
    print("Data Loaded!")
    
    return encodedData.map { try! JSONDecoder().decode(Category.self, from: $0) }
}

func savePresentIntro(_ presentIntro: Bool) {
    UserDefaults.standard.set(presentIntro, forKey: "presentIntro")
    print("Data Saved!")
}

func loadPresentIntro() -> Bool {
    let presentIntro = UserDefaults.standard.bool(forKey: "presentIntro")
    print("Data Loaded!")
    return presentIntro
}

func saveName(_ name: String) {
    UserDefaults.standard.set(name, forKey: "name")
    print("Data Saved!")
}

func loadName() -> String {
    let name = UserDefaults.standard.string(forKey: "name")
    print("Data Loaded!")
    return name != nil ? name! : ""
}

func loadFirstTime() -> Bool {
    let firstTime = UserDefaults.standard.bool(forKey: "firstTime")
    print("Data Loaded!")
    return firstTime
}

func saveFirstTime(_ firstTime: Bool) {
    UserDefaults.standard.set(firstTime, forKey: "firstTime")
    print("Data Saved!")
}
