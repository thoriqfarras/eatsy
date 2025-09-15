//
//  WeightGoalView.swift
//  Eatsy
//
//  Created by Mac on 15/09/25.
//
import SwiftUI

struct WeightGoalView: View {
    
    let nextStep: () -> Void
    
    @Binding var weightGoal: Int?
    
    var body: some View {
        VStack {
            VStack {
                VStack(spacing: 10) {
                    Text("Set your weight goal!")
                        .font(.title)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Tell us your target weight so we can plan your journey and estimate how long it will take.")
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(maxWidth: .infinity)
                .padding()
            }
            VStack {
                HStack {
                    Text("🎯 Goal Weight")
                        .foregroundStyle(Color.black)
                    Spacer()
                }
                
                Picker("Weight Goal", selection: Binding(
                    get: { weightGoal ?? weights.first! },
                    set: { weightGoal = $0 }
                )) {
                    ForEach(weights, id: \.self) { weightgoal in
                        Text("\(weightgoal) kg")
                    }
                }
                .pickerStyle(.wheel)
            }
            .eatsyCard()
            .padding(.horizontal)
            
            Spacer()
            NextButton(
                nextStep: nextStep,
                isEnabled: weightGoal != nil)
        }
        .background(Color("defaultBackground"))
    }
}
