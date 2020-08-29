//
//  GeometryGetter.swift
//  hackcampus
//
//  Created by Travis Zhang on 8/28/20.
//  Copyright © 2020 Michael Liang. All rights reserved.
//

import Foundation
import SwiftUI

struct GeometryGetter: View {
    @Binding var rect: CGRect

    var body: some View {
        GeometryReader { geometry in
            Group { () -> AnyView in
                DispatchQueue.main.async {
                    if(geometry.size.width > 0 && geometry.size.height > 0)
                    {
                        self.rect = geometry.frame(in: .global)
                    }
                }

                return AnyView(Color.clear)
            }
        }
    }
}
