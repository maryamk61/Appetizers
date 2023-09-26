//
//  CustomModifiers.swift
//  Appetizers
//
//  Created by Maryam Kaveh on 7/3/1402 AP.
//

import Foundation
import SwiftUI


struct StandardButtonStyle: ViewModifier {

    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .controlSize(.regular)
    }
    
}

struct AppetizerRowImageStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .cornerRadius(8)
            .frame(width: 120, height: 80)
            .shadow(radius: 5, y: 8)
    }
}

extension View {
    func standardButtonStyle() -> some View {
        self.modifier(StandardButtonStyle())
    }
}
