//
//  GenderRadioButtonsGroup.swift
//  Eatsy
//
//  Created by Mac on 15/09/25.
//
import SwiftUI

struct GenderRadioButtonsGroup: View {
    @Binding var selectedGender: Gender?
    
    var body: some View {
        VStack(spacing: 10) {
            Button(action: {
                selectedGender = .m
            }) {
                Text("👨 Male")
                    .foregroundColor(.black)
                Spacer()
            }
            .selectableCard(isSelected: selectedGender == .m)
            Button(action: {
                selectedGender = .f
            }) {
                Text("👩‍🦰 Female")
                    .foregroundColor(.black)
                Spacer()
            }
            .selectableCard(isSelected: selectedGender == .f)
        }
    }
}
