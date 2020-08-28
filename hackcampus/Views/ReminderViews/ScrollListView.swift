//
//  ScrollListView.swift
//  hackcampus
//
//  Created by Travis Zhang on 8/27/20.
//  Copyright © 2020 Michael Liang. All rights reserved.
//

import SwiftUI

struct ScrollListView: View {
    
    init() {
        // To remove only extra separators below the list:
        UITableView.appearance().tableFooterView = UIView()

        // To remove all separators including the actual ones:
        UITableView.appearance().separatorStyle = .none
    }
    
    
    var body: some View {
        
        HStack {
            
            Spacer()
        
            ScrollView(.horizontal){
                
                HStack {
                    
                    VStack {
                        
                        HStack {
                    
                
                        Text("COVID").font(.custom("Poppins-bold", size: 20)).padding(.leading, -20)
                    
                    ZStack {
                    
                        Rectangle().fill(LinearGradient(gradient: Gradient(colors: [Color(red: 157/256, green: 78/256, blue: 221/256), Color(red: 224/256, green: 170/256, blue: 255/256)]), startPoint: UnitPoint(x: 0, y: 1), endPoint: UnitPoint(x: 1, y: 0))).frame(width: 30, height: 20.8695).cornerRadius(15).shadow(color: Color(red: 0, green: 0, blue: 0).opacity(0.5), radius: 4, x: 1, y: 4)
          
                        Text("2").font(.custom("Poppins-Bold", size: 10)).foregroundColor(.white)
                        
                    }.padding(.leading, 20)
                
                    }.padding(.top, 20)
                
    
                
                
            
                ZStack(alignment: .topTrailing) {
                
                    
                    
                        List() {
                            
                            Spacer()
                            
                            HStack {
                                Button(action: {
                                    
                                }) {
                                    Image(systemName: "checkmark.square")
                                }.padding(.leading, 20)
                                
                                Text("Item 1").padding(.leading, 20).font(.custom("Poppins-Regular", size: 15))
                                    
                                
                            }
                            
                            HStack {
                                
                                Button(action: {
                                    
                                }) {
                                    Image(systemName: "checkmark.square")
                                }.padding(.leading, 20)
                                
                                Text("Item 2").padding(.leading, 20).font(.custom("Poppins-Regular", size: 15))
                                
                            }

                        }.frame(width: 255, height: 300).cornerRadius(30).shadow(radius: 5)
                    

                        Button(action: {
                            
                        }) {
                            
                            ZStack {
                                Rectangle().fill(LinearGradient(gradient: Gradient(colors: [Color(red: 157/256, green: 78/256, blue: 221/256), Color(red: 224/256, green: 170/256, blue: 255/256)]), startPoint: UnitPoint(x: 0, y: 1), endPoint: UnitPoint(x: 1, y: 0))).frame(width:20, height: 20).cornerRadius(15).shadow(color: Color(red: 0, green: 0, blue: 0).opacity(0.5), radius: 4, x: 1, y: 4)
                                
                                Image("add").resizable().frame(width:7, height:7).foregroundColor(.white)
                            }
                    }.padding()
                    
                    
                }
                .padding(EdgeInsets(top: 20.0, leading: 60.0, bottom: 20.0, trailing: 60.0))
                
                    }
                    
                    VStack {
                                        
                                        HStack {
                                    
                                
                                        Text("COVID").font(.custom("Poppins-bold", size: 20)).padding(.leading, -20)
                                    
                                    ZStack {
                                    
                                        Rectangle().fill(LinearGradient(gradient: Gradient(colors: [Color(red: 157/256, green: 78/256, blue: 221/256), Color(red: 224/256, green: 170/256, blue: 255/256)]), startPoint: UnitPoint(x: 0, y: 1), endPoint: UnitPoint(x: 1, y: 0))).frame(width: 30, height: 20.8695).cornerRadius(15).shadow(color: Color(red: 0, green: 0, blue: 0).opacity(0.5), radius: 4, x: 1, y: 4)
                          
                                        Text("2").font(.custom("Poppins-Bold", size: 10)).foregroundColor(.white)
                                        
                                    }.padding(.leading, 20)
                                
                                    }.padding(.top, 20)
                                
                    
                                
                                
                            
                                ZStack(alignment: .topTrailing) {
                                
                                    
                                    
                                        List() {
                                            
                                            Spacer()
                                            
                                            HStack {
                                                
                                                Button(action: {
                                                    
                                                }) {
                                                    Image(systemName: "checkmark.square")
                                                }.padding(.leading, 20)
                                                
                                                Text("Item 1").padding(.leading, 40).font(.custom("Poppins-Regular", size: 15))
                                                
                                                
                                            }
                                            
                                            HStack {
                                                Button(action: {
                                                    
                                                }) {
                                                    Image(systemName: "checkmark.square")
                                                }.padding(.leading, 20)
                                                
                                                Text("Item 2").padding(.leading, 40).font(.custom("Poppins-Regular", size: 15))
                                            }

                                        }.frame(width: 255, height: 300).cornerRadius(30).shadow(radius: 5)
                                    

                                        Button(action: {
                                            
                                        }) {
                                            
                                            
                                            ZStack {
                                                Rectangle().fill(LinearGradient(gradient: Gradient(colors: [Color(red: 157/256, green: 78/256, blue: 221/256), Color(red: 224/256, green: 170/256, blue: 255/256)]), startPoint: UnitPoint(x: 0, y: 1), endPoint: UnitPoint(x: 1, y: 0))).frame(width:20, height: 20).cornerRadius(15).shadow(color: Color(red: 0, green: 0, blue: 0).opacity(0.5), radius: 4, x: 1, y: 4)
                                                
                                                Image("add").resizable().frame(width:7, height:7).foregroundColor(.white)
                                            }
                                    }.padding()
                                    
                                    
                                }.padding(EdgeInsets(top: 20.0, leading: 60.0, bottom: 20.0, trailing: 60.0))
                                
                                    }
                    
                    
                }
                
                
            
        }
        
            
        
            Spacer()
        }
    }
}

struct ScrollListView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollListView()
    }
}
