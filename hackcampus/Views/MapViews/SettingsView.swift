//
//  SettingsView.swift
//  hackcampus
//
//  Created by Travis Zhang on 8/27/20.
//  Copyright © 2020 Michael Liang. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var movingOffset: CGFloat
    let screenSize = UIScreen.main.bounds.size
    
    
    let notificationtitles = ["Travis - 6 Items", "6 Items to Bring", "Don't Forget to Bring Anything"]
    
    let notificationtext = ["Don't Forget to bring your daily life and school supplies.", "Travis, take a look at your checklist for the items you need to bring.", "Travis, there are 6 items you need to remember to bring."]
    
    
    @State var radius = 12
    
    @State var notificationselection = 0
    
    var body: some View {
        let screenWidth = screenSize.width
        let phoneRatio = String(format: "%.3f", screenSize.width / screenSize.height)
        let refRatio = String(format: "%.3f",  9.0 / 16.0)
        let isXorAbove = phoneRatio != refRatio
        
        return VStack(spacing: 15) {
            
            Rectangle()
            .frame(width: 80, height: 7)
            .cornerRadius(5)
                .foregroundColor(Color.gray.opacity(0.5)).padding(.bottom, 25)
            
            HStack(spacing: 25) {
                Button(action: {
                    
                }) {
                    Image(systemName: "bandage")
                        .foregroundColor(Color.white)
                }
                .addBackground()
                
                Button(action: {
                    
                }) {
                    Image(systemName: "bell.fill")
                        .foregroundColor(Color.white)
                }
                .addBackground()
            }
            
            HStack(spacing: 25) {
                Button(action: {
                    
                }) {
                    Image(systemName: "list.bullet")
                        .foregroundColor(Color.white)
                }
                .addBackground()
                
                Button(action: {
                    
                }) {
                    Image(systemName: "moon.fill")
                        .foregroundColor(Color.white)
                }
                .addBackground()
            }
            
            HStack(spacing: 25) {
                Button(action: {
                    
                }) {
                    Image("instagram")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16.0, height: 16.0)
                        .foregroundColor(Color.white)
                }
                .addBackground()
                
                Button(action: {
                    
                }) {
                    Image("facebook")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16.0, height: 16.0)
                        .foregroundColor(Color.white)
                }
                .addBackground()
            }
        }.frame(width: screenWidth)
            .padding(.bottom, isXorAbove ? 60 : 50 )
            .padding(.top, 15)
            .background(Color.gray.opacity(0.3))
            .offset(y: movingOffset)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(movingOffset: .constant(0.0))
    }
}

struct modifyButton: ViewModifier {
    
    func body(content: Content) -> some View {
        content
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 1)
        )
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray))
    }
    
}

extension View {
    func addBackground() -> some View {
        self.modifier(modifyButton())
    }
}

// TODO: Add Notifications later
//struct addNotificationView: View {
//    var body: some View {
//        ScrollView(.horizontal, showsIndicators: false) {
//            HStack(spacing: 0) {
//                ForEach(0..<notificationtitles.count) {i in
//                    ZStack {
//
//                        Rectangle().frame(width: 112, height: 78).foregroundColor(Color(.black).opacity(0)).overlay(
//                            RoundedRectangle(cornerRadius: 10)
//                                .stroke(Color.white, lineWidth: 2)
//                        )
//
//                        Button(action: {
//                            self.notificationselection = i
//                        }) {
//
//                        VStack(alignment: .leading) {
//
//
//                            Text(self.notificationtitles[i]).foregroundColor(self.notificationselection == i ? Color.purple : Color.white).frame(width: 100, height: 10).font(.custom("SF-Pro", size: 8)).font(Font.body.bold()).offset(x: -20)
//
//
//                            Text(self.notificationtext[i]).foregroundColor(.white).frame(width: 100, height: 40).font(.custom("SF-Pro", size: 8))
//
//
//                            }
//
//
//                        }
//
//                        }.frame(width: 130, height: 119.34).addBackground().cornerRadius(20).padding(-5)
//
//                }
//
//
//            }
//
//        }.frame(width: 150, height: 119.34).cornerRadius(20).padding(.trailing, 20)
//    }
//}
