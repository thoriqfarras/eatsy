//
//  NextButton.swift
//  Eatsy
//
//  Created by Mac on 15/09/25.
//
import SwiftUI

struct NextButton: View {
    let nextStep: () -> Void
    var isEnabled: Bool = true
    var body: some View {
        VStack {
            Button(action: {
                nextStep()
            }) {
                Text("Next")
            }
            .buttonStyle(PrimaryButtonStyle(isEnabled: isEnabled))
            .disabled(!isEnabled)
        }
    }
}
