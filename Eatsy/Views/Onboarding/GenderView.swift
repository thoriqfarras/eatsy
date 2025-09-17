//
//  GenderView.swift
//  Eatsy
//
//  Created by Mac on 15/09/25.
//
import SwiftUI

struct GenderView: View {
    
    let nextStep: () -> Void
    @Binding var gender: Gender?
    
    var body: some View {
        
        VStack {
            VStack(spacing: 10) {
                HStack {
                    Text("What's your gender?")
                        .font(.title)
                        .bold()
                    Spacer()
                }
                HStack {
                    Text("We'll use this to better personalize your plan.")
                        .foregroundStyle(.secondary)
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            
            GenderRadioButtonsGroup(selectedGender: $gender)
            Spacer()
            NextButton(nextStep: nextStep, isEnabled: gender != nil)
        }
//        .background(Color("defaultBackground"))
    }
}
