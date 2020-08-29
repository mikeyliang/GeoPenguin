//
//  IntroViewOne.swift
//  hackcampus
//
//  Created by Mikayla on 8/27/20.
//  Copyright © 2020 Michael Liang. All rights reserved.
//

import SwiftUI

let lightGreyColor = Color(red: 200.0/256.0, green: 200.0/256.0, blue: 200.0/256.0, opacity: 1.0)

struct IntroViewOne: View {
    
    @State private var action: Int? = 0
    @Binding var name: String
    @State private var showDetails = false
    
    @ObservedObject private var kGuardian = KeyboardGuardian(textFieldCount: 1)

    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack(spacing: 0){
                    
                    GradientText1(title: "Serving").offset(x:30)
                    
                    
                    HStack(alignment: .top) {
                        
                        Image("IntroFirst").resizable().frame(width: 267.0, height: 150.0).offset(x: 68)
                        
                        Text("THE").font(.custom("Poppins-Bold", size: 50)).foregroundColor(.purple).offset(x: 50).frame(width: 142, height: 52)
                    }
                
                    Rectangle().frame(width: 252, height: 2).cornerRadius(100).foregroundColor(lightGreyColor).padding(.vertical, 20)
                    
                    
                    
                    Text("Welcome!").font(.custom("Poppins-SemiBold", size: 35)).offset(x: -50).padding(.vertical, 20)
                    
                    Text("What's your name?").font(.custom("Poppins-Bold", size: 15)).foregroundColor(Color(red: 126/256, green: 114/256, blue: 114/256)).padding(.vertical, 30)
                    
                    TextField("Enter Your First Name", text: $name, onEditingChanged: { if $0 { self.kGuardian.showField = 0 } }, onCommit: {saveName(self.name)}).font(.custom("Poppins-Bold", size: 10)) .padding().background(Color(red: 1, green: 1, blue: 1).opacity(0.95)).cornerRadius(30.0).padding( [.leading, .trailing], 60).shadow(color: Color.black, radius: 4, x: 0, y:2)
                        .background(GeometryGetter(rect: $kGuardian.rects[0]))
                    
                    Spacer().frame(height: 100)
                    
                    NavigationLink(destination: IntroViewTwo(kGuardian: kGuardian)) {
                    
                        ZStack{
                            Rectangle().fill(LinearGradient(gradient: Gradient(colors: [Color(red: 157/256, green: 78/256, blue: 221/256), Color(red: 224/256, green: 170/256, blue: 255/256)]), startPoint: UnitPoint(x: 0, y: 1), endPoint: UnitPoint(x: 1, y: 0))).frame(width: 188, height: 41).cornerRadius(20).shadow(color: Color.black.opacity(0.5),radius:4,x:0,y:3)
                            
                            Text("CONTINUE").font(.custom("Poppins-Bold",size: 10
                                )).foregroundColor(.white)
                            
                            
                        }
                        .buttonStyle(DefaultButtonStyle())
                    }
                    Spacer().frame(height: 100)
                }.offset(y: kGuardian.slide).animation(.easeInOut(duration: 1.0))
                
            }
            .onAppear { self.kGuardian.addObserver() }

        }.navigationBarTitle("").navigationBarHidden(true).padding(.top, -8)
        .onDisappear { self.kGuardian.removeObserver() }
    }
        
}

//struct IntroViewOne_Previews: PreviewProvider {
//    static var previews: some View {
//        IntroViewOne()
//    }
//}



struct GradientText1: View {
    let title: String
    let colors = Gradient(colors: [Color(red: 157/256, green: 78/256, blue: 221/256), Color(red: 224/256, green: 170/256, blue: 255/256)]
)
    
    var body: some View {
        LinearGradient(gradient: colors,
                       startPoint: UnitPoint(x: 0, y: 1), endPoint: UnitPoint(x: 1, y: 0))

            .frame(width: 248, height: 70)
            .mask(Text("Serving")
                .font(.custom("Poppins-Bold", size: 50))
        )
    }
}
