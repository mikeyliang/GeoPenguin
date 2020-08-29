//
//  IntroViewThree.swift
//  hackcampus
//
//  Created by Mikayla on 8/27/20.
//  Copyright © 2020 Michael Liang. All rights reserved.
//

import SwiftUI

struct IntroViewThree: View {
    
    var body: some View {
        
        NavigationView {
            ScrollView {
            VStack(spacing: 0) {
                Image("IntroSecond").resizable().frame(width: 450.0, height: 253.0).offset(x: 37.5)
                
                Text("WHO").font(.custom("Poppins-Bold", size: 50)).foregroundColor(.purple).offset(x:-190).frame(width: 142, height: 52)
                
                GradientText3(title: "Forget . . .")
                
                Rectangle().frame(width: 252, height: 2).cornerRadius(100).foregroundColor(lightGreyColor).padding(.top, 30).padding(.bottom,20).padding(.vertical, 60)
                
                Spacer()
                
                Text("Swipe down to continue!").font(.custom("Poppins-Bold", size: 15)).foregroundColor(Color(red: 126/256, green: 114/256, blue: 114/256))
                
//                Button(action: {
//                    self.presentationMode.wrappedValue.dismiss()
//                }) {
//                    ZStack{
//                        Rectangle().fill(LinearGradient(gradient: Gradient(colors: [Color(red: 157/256, green: 78/256, blue: 221/256), Color(red: 224/256, green: 170/256, blue: 255/256)]), startPoint: UnitPoint(x: 0, y: 1), endPoint: UnitPoint(x: 1, y: 0))).frame(width: 188, height: 41).cornerRadius(20).shadow(color: Color.black.opacity(0.5),radius:4,x:0,y:3)
//
//                        Text("CONTINUE").font(.custom("Poppins-Bold",size: 10
//                            )).foregroundColor(.white)
//
//
//                    }.padding(.top, 77)
//                    .buttonStyle(DefaultButtonStyle())
//                }
                
                Spacer()
                
            
        
            }
            }
            
        }.navigationBarTitle("").navigationBarHidden(true).navigationBarBackButtonHidden(true).edgesIgnoringSafeArea(.top)
    }
}

struct IntroViewThree_Previews: PreviewProvider {
    static var previews: some View {
        IntroViewThree()
    }
}



struct GradientText3: View {
    let title: String
    let colors = Gradient(colors: [Color(red: 123/256, green: 44/256, blue: 191/256).opacity(0.50), Color(red: 123/256, green: 44/256, blue: 191/256).opacity(0)]
)
    
    var body: some View {
        LinearGradient(gradient: colors,
                       startPoint: UnitPoint(x: 0, y: 1), endPoint: UnitPoint(x: 1, y: 0))

            .frame(width: 248, height: 70)
            .mask(Text("Forget...")
                .font(.custom("Poppins-Bold", size: 50))
        )
    }
}
