//
//  ContentView.swift
//  hackcampus
//
//  Created by Michael Liang on 8/26/20.
//  Copyright © 2020 Michael Liang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showAddCategory = loadFirstTime()
    @State private var categories: [Category] = load()
    @State private var categoryIndex = 0
    @State private var name: String = loadName()
    @State private var defaultLocation: String = loadLocation()
    @State private var presentIntro = loadPresentIntro()
    
    var totalItems: Int {
        let array = categories
        var totalNumber = 0
        
        for category in array {
            totalNumber += category.numOfItems
        }
        
        return totalNumber
    }

    var body: some View {
        
        NavigationView {
            
            ScrollView {
        
            VStack(alignment: .leading) {
                
                HStack {
                    Text("Worry Less.").offset(x: 48).font(.custom("Poppins-SemiBold", size: 30))
                    
                    Spacer()
                
                }
                
                HStack {
                
                    Text("Remember More.").padding(.top, 2).offset(x: 60).font(.custom("Poppins-SemiBold", size: 20))
                    
                    Spacer()
                
                }.padding(.bottom, 50)
                
                HStack {
                    
                    Text("Welcome back, \(name == "" ? "User" : name)!").padding(.top, 30).offset(x: 50).font(.custom("Poppins-Regular", size: 15))
                }
                
                HStack(alignment: .bottom) {
                     
                        VStack {
                           
                            ZStack {
                            
                                Rectangle()
                                    .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 157/256, green: 78/256, blue: 221/256), Color(red: 224/256, green: 170/256, blue: 255/256)]), startPoint: UnitPoint(x: 0, y: 1), endPoint: UnitPoint(x: 1, y: 0))).frame(width: 63, height: 30).cornerRadius(15).shadow(color: Color(red: 0, green: 0, blue: 0).opacity(0.5), radius: 4, x: 1, y: 4)
                                
                                HStack(alignment: .top) {
                                    Image("bell").resizable().frame(width: 12, height: 12)
                                    
                                    Text("\(totalItems)").font(.custom("Poppins-Bold", size: 10)).foregroundColor(.white)
                                    
                                }
                        
                        }
                    
                    }
                    VStack {
                        Image("Reminder Supplies Photo").resizable().frame(width: 236, height: 133)
                    }.offset(x: 32)
                    
                    
                }.offset(x:40)
                    
                
                HStack {
                    // Vertical Line + Add Category
                    Rectangle().fill(Color(red: 235/256, green: 235/256, blue: 235/256)).frame(width: 250, height: 2).cornerRadius(100)
                    
                    Spacer()
                    
                    Button(action: {
                        self.showAddCategory.toggle()
                    }) {
                        ZStack {
                        
                            Rectangle().fill(LinearGradient(gradient: Gradient(colors: [Color(red: 157/256, green: 78/256, blue: 221/256), Color(red: 224/256, green: 170/256, blue: 255/256)]), startPoint: UnitPoint(x: 0, y: 1), endPoint: UnitPoint(x: 1, y: 0))).frame(width:30, height: 30).cornerRadius(15).shadow(color: Color(red: 0, green: 0, blue: 0).opacity(0.5), radius: 4, x: 1, y: 4)
                            
                            Image("add").resizable().frame(width:11, height:11).foregroundColor(.white)
                            
                        }
                    }
                    
                    Spacer()
                }.padding(EdgeInsets(top: 43, leading: 35, bottom: 0, trailing: 0))
                
                
                ScrollListView(categories: self.$categories, categoryIndex: self.$categoryIndex).padding(.bottom, 50)
                
            }.offset(y: 25)
            .sheet(isPresented: $showAddCategory, onDismiss: {
                self.presentIntro = false
                savePresentIntro(self.presentIntro)
                saveFirstTime(self.showAddCategory)
            }) {
                if(self.presentIntro == true) {
                    IntroViewOne(name: self.$name, defaultLocation: self.$defaultLocation)
                }
                else {
                    AddCategoryView(categories: self.$categories, categoryIndex: self.$categoryIndex)
                }
            }
            }.navigationBarItems(trailing: NavigationLink(destination: MapContentView(defaultLocation: self.$defaultLocation)) {
                Image(systemName: "chevron.right")
                }).navigationBarTitle("")

        }
        
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
