//
//  DataManager.swift
//  hackcampus
//
//  Created by Travis Zhang on 8/30/20.
//  Copyright © 2020 Michael Liang. All rights reserved.
//

import Foundation

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

func saveLocation(_ location: String) {
    UserDefaults.standard.set(location, forKey: "defaultLocation")
    print("location Data Saved!")
}

func loadLocation() -> String {
    let location = UserDefaults.standard.string(forKey: "defaultLocation")
    print("location Data Loaded!")
    return location != nil ? location! : ""
}
