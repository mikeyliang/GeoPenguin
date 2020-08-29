//
//  EditView.swift
//  hackcampus
//
//  Created by Travis Zhang on 8/27/20.
//  Copyright © 2020 Michael Liang. All rights reserved.
//

import SwiftUI

struct EditView: View {
    
    @State var locations: [Location] = []
    
    @Environment(\.presentationMode) var presentationMode
    
    
    
    var body: some View {
        VStack {
            HStack {
                
                Text("Edit Addresses").font(.custom("Poppins-Bold", size: 20)).padding(.trailing, 20)
                
                Button(action: {
                
                }) {
                    ZStack {

                        Rectangle().fill(LinearGradient(gradient: Gradient(colors: [Color(red: 157/256, green: 78/256, blue: 221/256), Color(red: 224/256, green: 170/256, blue: 255/256)]), startPoint: UnitPoint(x: 0, y: 1), endPoint: UnitPoint(x: 1, y: 0))).frame(width:30, height: 30).cornerRadius(15).shadow(color: Color(red: 0, green: 0, blue: 0).opacity(0.5), radius: 4, x: 1, y: 4)

                        Image("add").resizable().frame(width:11, height:11).foregroundColor(.white)
                        
                        

                    }
                }
                
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    ZStack {

                        Rectangle().fill(LinearGradient(gradient: Gradient(colors: [Color(red: 157/256, green: 78/256, blue: 221/256), Color(red: 224/256, green: 170/256, blue: 255/256)]), startPoint: UnitPoint(x: 0, y: 1), endPoint: UnitPoint(x: 1, y: 0))).frame(width:30, height: 30).cornerRadius(15).shadow(color: Color(red: 0, green: 0, blue: 0).opacity(0.5), radius: 4, x: 1, y: 4)

                        Image("add").resizable().frame(width:11, height:11).foregroundColor(.white).rotationEffect(.degrees(45))
                        
                        

                    }
                }
                
                
            }.padding(.bottom, 30)
           
            List {
                HStack {
                    
                    Image(systemName: "house.fill").foregroundColor(Color.purple.opacity(0))
                
                    Text("Home").font(.custom("Poppins-Regular", size: 15)).padding(.leading, 20)
                    
                }.padding(.leading, 20)
                
                
                HStack {
                    
                    Image(systemName: "house.fill").foregroundColor(Color.purple.opacity(0))
                    
                    Text("Dorm").font(.custom("Poppins-Regular", size: 15)).padding(.leading, 20)
                    
                }.padding(.leading, 20)
                
                HStack {
                    
                    Image(systemName: "house.fill").foregroundColor(Color.purple.opacity(1))
                    
                    Text("Mom's House").font(.custom("Poppins-Regular", size: 15)).padding(.leading, 20)
                }.padding(.leading, 20)
                
                HStack {
                    
                    Image(systemName: "house.fill").foregroundColor(Color.purple.opacity(0))
                    
                    Text("Dad's House").font(.custom("Poppins-Regular", size: 15)).padding(.leading, 20)
                }.padding(.leading, 20)
            }.frame(width: 250, height: 300).cornerRadius(30).shadow(color: Color.black.opacity(0.6), radius: 4, x: 1, y: 3)

            
   
        }
        
    }
    
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView()
    }
}
