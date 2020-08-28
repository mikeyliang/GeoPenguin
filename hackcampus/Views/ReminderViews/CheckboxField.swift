//
//  CheckboxField.swift
//  hackcampus
//
//  Created by Travis Zhang on 8/28/20.
//  Copyright © 2020 Michael Liang. All rights reserved.
//

import SwiftUI

struct CheckboxField: View {
    let id: UUID
    let label: String
    let size: CGFloat
    let color: Color
    let textSize: Int
    
    init(
        id: UUID,
        label:String,
        size: CGFloat = 10,
        color: Color = Color.black,
        textSize: Int = 14
        ) {
        self.id = id
        self.label = label
        self.size = size
        self.color = color
        self.textSize = textSize
    }
    
    @State var isMarked:Bool = false
    
    var body: some View {
        Button(action:{
            self.isMarked.toggle()
        }) {
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: self.isMarked ? "checkmark.square" : "square")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: self.size, height: self.size)
                Text(label)
                    .font(.custom("Poppins-Regular", size: size))
                Spacer()
            }.foregroundColor(self.color).padding(.leading, 10)
        }
        .foregroundColor(Color.white)
    }
}

struct CheckboxField_Previews: PreviewProvider {
    
    static var previews: some View {
        CheckboxField(id: UUID(), label: "Test")
    }
}
