//
//  IntroViewTwo.swift
//  hackcampus
//
//  Created by Mikayla on 8/27/20.
//  Copyright © 2020 Michael Liang. All rights reserved.
//

import SwiftUI

struct IntroViewTwo: View {
    
    @State var address: String = ""
    
    @ObservedObject var kGuardian: KeyboardGuardian
    
    var body: some View {
        
        NavigationView {
            ScrollView {
            VStack(spacing:0){
                HStack(alignment: .bottom){
                    Text("THE").font(.custom("Poppins-Bold", size: 50)).foregroundColor(.purple).offset(x:-15).frame(width: 142, height: 52)
            
                    Image("IntroThird").resizable().offset(x:-20).frame(width: 336.0, height: 189.0)
                }
                
                GradientText2(title: "Students")
                
                Text("WHO").font(.custom("Poppins-Bold", size: 50)).foregroundColor(.purple).offset(x:180).frame(width: 142, height: 52)
                
                Rectangle().frame(width: 252, height: 2).cornerRadius(100).foregroundColor(lightGreyColor).padding(.top, 30)
                
                Text("Where do you live?").font(.custom("Poppins-Bold", size: 15)).foregroundColor(Color(red: 126/256, green: 114/256, blue: 114/256)).padding(EdgeInsets(top: 70, leading: 0, bottom: 50, trailing: 0))
                
                 TextField("Enter Your Home Address", text: $address, onEditingChanged: { if $0 { self.kGuardian.showField = 1 } }).font(.custom("Poppins-Bold", size: 10)) .padding().background(Color(red: 1, green: 1, blue: 1).opacity(0.95)).cornerRadius(30.0).padding( [.leading, .trailing], 110).shadow(color: Color.black, radius: 4, x: 0, y:2).background(GeometryGetter(rect: $kGuardian.rects[1]))
                
                NavigationLink(destination: IntroViewThree()) {
                    
                    ZStack{
                        Rectangle().fill(LinearGradient(gradient: Gradient(colors: [Color(red: 157/256, green: 78/256, blue: 221/256), Color(red: 224/256, green: 170/256, blue: 255/256)]), startPoint: UnitPoint(x: 0, y: 1), endPoint: UnitPoint(x: 1, y: 0))).frame(width: 188, height: 41).cornerRadius(20).shadow(color: Color.black.opacity(0.5),radius:4,x:0,y:3)
                        
                        Text("CONTINUE").font(.custom("Poppins-Bold",size: 10
                            )).foregroundColor(.white)
                        
                        
                    }.padding(.top, 50)
                    .buttonStyle(DefaultButtonStyle())
                }
                Spacer().frame(height: 100)
            }.offset(y: kGuardian.slide).animation(.easeInOut(duration: 1.0))
            }
        }.navigationBarTitle("").navigationBarHidden(true)
        .navigationBarBackButtonHidden(true).edgesIgnoringSafeArea(.top)
        .onAppear { self.kGuardian.addObserver() }
        .onDisappear { self.kGuardian.removeObserver() }
    
        
    }
}

//struct IntroViewTwo_Previews: PreviewProvider {
//    static var previews: some View {
//        IntroViewTwo()
//    }
//}



struct GradientText2: View {
    let title: String
    let colors = Gradient(colors: [Color(red: 123/256, green: 44/256, blue: 191/256).opacity(0.65), Color(red: 123/256, green: 44/256, blue: 191/256).opacity(0.50)]
)
    
    var body: some View {
        LinearGradient(gradient: colors,
                       startPoint: UnitPoint(x: 0, y: 1), endPoint: UnitPoint(x: 1, y: 0))

            .frame(width: 248, height: 70)
            .mask(Text("Students")
                .font(.custom("Poppins-Bold", size: 50))
        )
    }
}
