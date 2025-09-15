//
//  GoalView.swift
//  Eatsy
//
//  Created by Mac on 15/09/25.
//
import SwiftUI

struct GoalView: View {
    @Binding var selectedGoal: Goal?
    let nextStep: () -> Void
    
    var body: some View {
        VStack {
            VStack(spacing: 10) {
                Text("What's your goal?")
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Choose your goal and we’ll create a meal plan just for you.")
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            
            GoalRadioButtonsGroup(selectedButton: $selectedGoal)
            
            Spacer()
            
            NextButton(nextStep: nextStep, isEnabled: selectedGoal != nil)
        }
        .background(Color("defaultBackground"))
    }
}
