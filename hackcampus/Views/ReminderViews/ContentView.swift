//
//  ContentView.swift
//  hackcampus
//
//  Created by Michael Liang on 8/26/20.
//  Copyright © 2020 Michael Liang. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        
        
            VStack(alignment: .leading) {
                
                
                HStack {
                    Text("Worry Less.").offset(x: 48).font(.custom("Poppins-SemiBold", size: 30))
                    
                    Spacer()
                
                }
                
                HStack {
                
                    Text("Remember More.").padding(.top, 2).offset(x: 60).font(.custom("Poppins-SemiBold", size: 20))
                    
                    Spacer()
                
                }
                
                HStack {
                    
                    Text("Welcome back, Travis!").padding(.top, 30).offset(x: 50).font(.custom("Poppins-Regular", size: 15))
                }
                
                HStack(alignment: .bottom) {
                    
                        
                        VStack {
                           
                            ZStack {
                            
                                Rectangle()
                                    .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 157/256, green: 78/256, blue: 221/256), Color(red: 224/256, green: 170/256, blue: 255/256)]), startPoint: UnitPoint(x: 0, y: 1), endPoint: UnitPoint(x: 1, y: 0))).frame(width: 63, height: 30).cornerRadius(15).shadow(color: Color(red: 0, green: 0, blue: 0).opacity(0.5), radius: 4, x: 1, y: 4)
                                
                                HStack(alignment: .top) {
                                    Image("bell").resizable().frame(width: 12, height: 12)
                                    
                                    //TODO: Text here should be set equal to total list length from all categories
                                    
                                    Text("5").font(.custom("Poppins-Bold", size: 10)).foregroundColor(.white)
                                    
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
                    
                    
                    Button(action: {
                        
                        //TODO: Add action to add new category
                        
                    }) {
                        ZStack {
                        
                            Rectangle().fill(LinearGradient(gradient: Gradient(colors: [Color(red: 157/256, green: 78/256, blue: 221/256), Color(red: 224/256, green: 170/256, blue: 255/256)]), startPoint: UnitPoint(x: 0, y: 1), endPoint: UnitPoint(x: 1, y: 0))).frame(width:30, height: 30).cornerRadius(15).shadow(color: Color(red: 0, green: 0, blue: 0).opacity(0.5), radius: 4, x: 1, y: 4)
                            
                            Image("add").resizable().frame(width:11, height:11).foregroundColor(.white)
                            
                        }
                    }.padding(.leading, 29)
                }.padding(EdgeInsets(top: 43, leading: 35, bottom: 0, trailing: 0))
                
                
                ScrollListView()
                
                Spacer()
                
            }.offset(y: 25)


            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
