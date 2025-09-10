//
//  ViewShadow.swift
//  Eatsy
//
//  Created by Mac on 10/09/25.
//

import SwiftUI

struct EatsyShadow: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(
                color: .black.opacity(0.08),
                radius: 8,
                x: 0,
                y: 2
            )
    }
}

extension View {
    func eatsyShadow() -> some View {
        self.modifier(EatsyShadow())
    }
}
