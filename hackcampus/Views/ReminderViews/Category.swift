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
    print("Category Data Saved!")
}

func load() -> [Category] {
    guard let encodedData = UserDefaults.standard.array(forKey: "categories") as? [Data] else {
        return [Category(categoryName: "COVID", items: [CategoryItem(itemName: "Mask"), CategoryItem(itemName: "Hand Sanitizer")], numOfItems: 2)]
    }
    
    print("Category Data Loaded!")
    
    return encodedData.map { try! JSONDecoder().decode(Category.self, from: $0) }
}

func savePresentIntro(_ presentIntro: Bool) {
    let presentString = presentIntro ? "true":"false"
    UserDefaults.standard.set(presentString, forKey: "presentIntro")
    print("presentIntro Data Saved!")
}

func loadPresentIntro() -> Bool {
    let presentString = UserDefaults.standard.string(forKey: "presentIntro")
    print("presentIntro Data Loaded!")
    let presentIntro = presentString != nil ? presentString! : "true"
    return presentIntro == "true" ? true : false
}

func saveName(_ name: String) {
    UserDefaults.standard.set(name, forKey: "name")
    print("name Data Saved!")
}

func loadName() -> String {
    let name = UserDefaults.standard.string(forKey: "name")
    print("name Data Loaded!")
    return name != nil ? name! : ""
}

func loadFirstTime() -> Bool {
    let firstString = UserDefaults.standard.string(forKey: "firstTime")
    print("presentIntro Data Loaded!")
    let firstTime = firstString != nil ? firstString! : "true"
    return firstTime == "true" ? true : false
}

func saveFirstTime(_ firstTime: Bool) {
    let firstString = firstTime ? "true":"false"
    UserDefaults.standard.set(firstString, forKey: "firstTime")
    print("firstTime Data Saved!")
}
