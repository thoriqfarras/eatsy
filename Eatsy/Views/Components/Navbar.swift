//
//  Navbar.swift
//  Eatsy
//
//  Created by Mac on 15/09/25.
//
import SwiftUI

struct Navbar: View {
    
    @Binding var currentStep: OnboardingStep
    let prevStep: () -> Void
    let onCancel: () -> Void
    private var currentStepNumber: Int {
        switch currentStep {
        case .gender: return 1
        case .goal: return 2
        case .aboutYou: return 3
        case .weightGoal: return 4
        case .dietRestriction: return 5
        case .done: return 5            }
    }
    
    var body: some View {
        HStack(alignment: .top) {
            Button(action: {
                if currentStep == .gender {
                    onCancel()
                } else {
                    prevStep()
                }
            }) {
                if currentStep == .gender {
                    Text("Cancel")
                } else {
                    Label("Back", systemImage: "chevron.left")
                        .labelStyle(.titleAndIcon)
                }
            }
            .foregroundColor(Color("PrimaryGreen"))
            Spacer()
            VStack {
                Text("\(currentStepNumber) of 5")
                    .foregroundColor(Color(.systemGray2))
            }
            Spacer()
            Button(action: {}) {
                if currentStep == .gender {
                    Text("Cancel")
                } else {
                    Label("Back", systemImage: "chevron.left")
                        .labelStyle(.titleAndIcon)
                    
                }
            }.hidden()
        }.padding(.horizontal)
//            .background(Color("defaultBackground").ignoresSafeArea())
    }
}
