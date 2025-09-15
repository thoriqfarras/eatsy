//
//  AboutYouView.swift
//  Eatsy
//
//  Created by Mac on 15/09/25.
//
import SwiftUI

let heights = 130..<221
let weights = 30..<201
let ages = 18..<26

struct AboutYouView: View {
    @State private var expandedPicker: PickerType? = nil
    @Binding var selectedHeight: Int?
    @Binding var selectedWeight: Int?
    @Binding var selectedAge: Int?
    @State private var completedSteps: Set<PickerType> = []
    
    let nextStep: () -> Void
    
    @Binding var height: Int?
    @Binding var weight: Int?
    @Binding var age: Int?
    
    var body: some View {
        VStack {
            VStack(spacing: 10) {
                Text("Tell Us About You!")
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Enter your height, weight, and age so we can calculate your BMI and daily calorie needs.")
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity)
            .padding()
            
            DropdownPicker(
                text: "📏 Height",
                selectedValue: $selectedHeight,
                values: heights,
                unit: "cm",
                isExpanded: expandedPicker == .height,
                isEnabled: true,
                toggle: { expandedPicker = expandedPicker == .height ? nil : .height }
            ) {
                Picker("Height", selection: Binding(
                    get: { selectedHeight ?? heights.lowerBound },
                    set: { newValue in
                        selectedHeight = newValue
                        height = newValue
                        completedSteps.insert(.height)
                    }
                )) {
                    ForEach(heights, id: \.self) { h in
                        Text("\(h) cm")
                    }
                }
                .pickerStyle(.wheel)
            }
            .modifier(SelectableCard(isSelected: expandedPicker == .height))
            
            
            DropdownPicker(
                text: "⚖️ Weight",
                selectedValue: $selectedWeight,
                values: weights,
                unit: "kg",
                isExpanded: expandedPicker == .weight,
                isEnabled: completedSteps.contains(.height),
                toggle: {
                    guard completedSteps.contains(.height) else { return }
                    expandedPicker = expandedPicker == .weight ? nil : .weight
                }
            ) {
                Picker("Weight", selection: Binding(
                    get: { selectedWeight ?? weights.lowerBound },
                    set: { newValue in
                        selectedWeight = newValue
                        weight = newValue
                        completedSteps.insert(.weight)
                    }
                )) {
                    ForEach(weights, id: \.self) { w in
                        Text("\(w) kg")
                    }
                }
                .pickerStyle(.wheel)
            }
            .modifier(SelectableCard(isSelected: expandedPicker == .weight))
            
            DropdownPicker(
                text: "🎂 Age",
                selectedValue: $selectedAge,
                values: ages,
                unit: "yo",
                isExpanded: expandedPicker == .age,
                isEnabled: completedSteps.contains(.weight),
                toggle: {
                    guard completedSteps.contains(.weight) else { return }
                    expandedPicker = expandedPicker == .age ? nil : .age
                }) {
                    Picker("Age", selection: Binding(
                        get: { selectedAge ?? ages.first! },
                        set: { newValue in
                            selectedAge = newValue
                            age = newValue
                            completedSteps.insert(.age)
                        }
                    )) {
                        ForEach(ages, id: \.self) { age in
                            Text("\(age) yo")
                        }
                    }
                    .pickerStyle(.wheel)
                }
                .modifier(SelectableCard(isSelected: expandedPicker == .age))
            
            Spacer()
            NextButton(
                nextStep: nextStep,
                isEnabled: completedSteps.contains(.age)  // All steps completed
            )
            .onAppear {
                completedSteps = []
                if selectedHeight != nil { completedSteps.insert(.height) }
                if selectedWeight != nil { completedSteps.insert(.weight) }
                if selectedAge != nil { completedSteps.insert(.age) }
            }
        }
        .background(Color("defaultBackground"))
    }
}
