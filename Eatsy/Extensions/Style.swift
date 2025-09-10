//
//  ViewShadow.swift
//  Eatsy
//
//  Created by Mac on 10/09/25.
//

import SwiftUI

struct EatsyCard: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(color: .black.opacity(0.08), radius: 8, x: 0, y: 2)
    }
}

extension View {
    func eatsyCard() -> some View {
        self.modifier(EatsyCard())
    }
}

struct SelectableCard: ViewModifier {
    var isSelected: Bool
    var cornerRadius: CGFloat = 12
    var color: Color = Color("PrimaryGreen")
    var lineWidth: CGFloat = 2
    var paddingValue: CGFloat = 8
    
    func body(content: Content) -> some View {
        content
            .padding(paddingValue)
            .eatsyCard()
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(isSelected ? color : .clear, lineWidth: lineWidth)
            )
            .padding(.horizontal, 16)
    }
}

extension View {
    func selectableCard(
        isSelected: Bool,
        cornerRadius: CGFloat = 12,
        color: Color = Color("PrimaryGreen"),
        lineWidth: CGFloat = 2,
        paddingValue: CGFloat = 8
    ) -> some View {
        self.modifier(
            SelectableCard(
                isSelected: isSelected,
                cornerRadius: cornerRadius,
                color: color,
                lineWidth: lineWidth,
                paddingValue: paddingValue
            )
        )
    }
}
