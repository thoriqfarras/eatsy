//
//  OnboardingView.swift
//  Eatsy
//
//  Created by Mac on 08/09/25.
//

import SwiftUI

enum OnboardingStep {
    case gender
    case goal
    case aboutYou
    case weightGoal
    case dietRestriction
    case done
}

struct OnboardingView: View {
    @State var currentStep: OnboardingStep = .gender
    @Binding var showOnboarding: Bool  // anak
    @State private var selectedGoal: Goal? = nil
    @Binding var showButton: Bool  // anak
    
    var body: some View {
        VStack {
            switch currentStep {
            case .gender:
                Navbar(
                    currentStep: $currentStep,
                    prevStep: { currentStep = .gender },
                    onCancel: {showOnboarding = false}
                )
                GenderView(nextStep: { currentStep = .goal })
            case .goal:
                Navbar(
                    currentStep: $currentStep,
                    prevStep: { currentStep = .gender },
                    onCancel: { showOnboarding = false }
                )
                GoalView(
                    selectedGoal: $selectedGoal,
                    nextStep: { currentStep = .aboutYou }
                )
            case .aboutYou:
                Navbar(
                    currentStep: $currentStep,
                    prevStep: { currentStep = .goal },
                    onCancel: { showOnboarding = false }
                )
                AboutYouView(nextStep: { currentStep = .weightGoal })
            case .weightGoal:
                Navbar(
                    currentStep: $currentStep,
                    prevStep: { currentStep = .aboutYou },
                    onCancel: { showOnboarding = false }
                )
                WeightGoalView(nextStep: { currentStep = .dietRestriction })
            case .dietRestriction:
                Navbar(
                    currentStep: $currentStep,
                    prevStep: { currentStep = .weightGoal },
                    onCancel: { showOnboarding = false }
                )
                DietRestrictionView(nextStep: { currentStep = .done })
            case .done:
                OnboardingDoneView(showOnboarding: $showOnboarding, showButton: $showButton)
            }
        }
        .padding(.bottom, 1)
    }
}

struct Navbar: View {
    
    @Binding var currentStep: OnboardingStep
    let prevStep: () -> Void
    let onCancel: () -> Void
    
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
                    Image(systemName: "chevron.left")
                }
            }
            .foregroundColor(Color("PrimaryGreen"))
            Spacer()
            Text("Set Up Plan")
                .bold()
            Spacer()
            Button(action: {}) {
                if currentStep == .gender {
                    Text("Cancel")
                } else {
                    Image(systemName: "chevron.left")
                }
            }.hidden()
        }.padding(.horizontal)
    }
}

struct NextButton: View {
    let nextStep: () -> Void
    
    var body: some View {
        VStack {
            Button(action: {
                nextStep()
            }) {
                Text("Next")
            }
            .buttonStyle(PrimaryButtonStyle())
        }
    }
}

struct DoneButton: View {
    @Binding var showOnboarding: Bool  // anak
    @Binding var showButton: Bool  // anak
    
    var body: some View {
        VStack {
            Button(action: {
                showOnboarding = false  // tutup onboarding
                showButton = false
            }) {
                Text("Let's get started")
            }
            .buttonStyle(PrimaryButtonStyle())
        }
    }
}

struct GenderView: View {
    
    let nextStep: () -> Void
    
    var body: some View {
        
        
        VStack {
            Text("1 of 5")
                .foregroundColor(Color(.systemGray2))
                .padding(.top, 1)
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
        }
        
        GenderRadioButtonsGroup()
        
        Spacer()
        NextButton(nextStep: nextStep)
    }
}

struct GoalView: View {
    @Binding var selectedGoal: Goal?
    let nextStep: () -> Void
    
    var body: some View {
        VStack {
            VStack(spacing: 10) {
                Text("2 of 5")
                    .foregroundColor(Color(.systemGray2))
                    .padding(.top, 1)
                
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
            
            NextButton(nextStep: nextStep)
                .disabled(selectedGoal == nil) // disable kalau belum pilih
        }
    }
}


let heights = 130..<221
let weights = 30..<201
let ages = 18..<26

struct AboutYouView: View {
    @State private var selectedHeight: Int = 160
    @State private var selectedWeight: Int = 60
    @State private var selectedAge: Int = 21
    
    @State private var expandedPicker: PickerType? = nil
    
    let nextStep: () -> Void
    
    var body: some View {
        VStack {
            Text("3 of 5").foregroundColor(Color(.systemGray2)).padding(.top, 1)
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
                selectedValue: selectedHeight,
                values: heights,
                unit: "cm",
                isExpanded: expandedPicker == .height,
                toggle: { expandedPicker = expandedPicker == .height ? nil : .height }
            ) {
                Picker("Height", selection: $selectedHeight) {
                    ForEach(heights, id: \.self) { height in
                        Text("\(height) cm")
                    }
                }
                .pickerStyle(.wheel)
            }
            
            DropdownPicker(
                text: "⚖️ Weight",
                selectedValue: selectedWeight,
                values: weights,
                unit: "kg",
                isExpanded: expandedPicker == .weight,
                toggle: { expandedPicker = expandedPicker == .weight ? nil : .weight }
            ) {
                Picker("Weight", selection: $selectedWeight) {
                    ForEach(weights, id: \.self) { weight in
                        Text("\(weight) kg")
                    }
                }
                .pickerStyle(.wheel)
            }
            
            DropdownPicker(
                text: "🎂 Age",
                selectedValue: selectedAge,
                values: ages,
                unit: "yo",
                isExpanded: expandedPicker == .age,
                toggle: { expandedPicker = expandedPicker == .age ? nil : .age }
            ) {
                Picker("Age", selection: $selectedAge) {
                    ForEach(ages, id: \.self) { age in
                        Text("\(age) yo")
                    }
                }
                .pickerStyle(.wheel)
            }
            
            Spacer()
            NextButton(nextStep: nextStep)
        }
    }
}

struct WeightGoalView: View {
    
    @State private var selectedWeightGoal: Int?
    
    let nextStep: () -> Void
    
    var body: some View {
        VStack {
            Text("4 of 5").foregroundColor(Color(.systemGray2)).padding(.top, 1)
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
            
            Picker("Weight Goal", selection: $selectedWeightGoal) {
                ForEach (weights, id: \.self) { weight in
                    Text("\(weight) kg")
                }
            }
            .pickerStyle(.wheel)
        }
        .eatsyCard()
        .padding(.horizontal)
        Spacer()
        NextButton(nextStep: nextStep)
    }
}


struct DietRestrictionView: View {
    @State private var selectedRestrictions: Set<DietRestriction> = []
    let nextStep: () -> Void
    
    var body: some View {
        VStack {
            Text("5 of 5").foregroundColor(Color(.systemGray2)).padding(.top, 1)
            VStack(spacing: 10) {
                Text("Any dietary restriction?")
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Tell us about allergies or foods you need to avoid, so we can adjust your meal plan.")
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            
            DietRestrictionCheckboxesGroup(selectedRestrictions: $selectedRestrictions)
            
            Spacer()
            NextButton(nextStep: nextStep)
        }
    }
}

struct OnboardingDoneView: View {
    @Binding var showOnboarding: Bool  // anak
    @Binding var showButton: Bool  // anak
    
    var body: some View {
        Spacer()
        VStack(spacing: 10) {
            Text("Well done 🎉")
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity)
            Text("Your personalized plan is ready!")
                .foregroundStyle(.secondary)
                .frame(maxWidth: .infinity, alignment: .center)
            Text("Follow the plan we’ve built for you and  you’ll reach your goal by")
                .multilineTextAlignment(.center)
                .foregroundStyle(.primary)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 20)
            Text("🗓️ 12 December 2025 ")
                .bold()
                .foregroundColor(Color("PrimaryGreen"))
                .padding(.top, 5)
        }
        .frame(maxWidth: .infinity)
        .padding()
        Spacer()
        DoneButton(showOnboarding: $showOnboarding,
                   showButton: $showButton)
    }
}

struct DropdownPicker<Content: View>: View {
    let text: String
    let selectedValue: Int
    let values: Range<Int>
    let unit: String
    let isExpanded: Bool
    let toggle: () -> Void
    @ViewBuilder var content: Content
    
    var body: some View {
        VStack {
            Button(action: toggle) {
                HStack {
                    Text("\(text)")
                        .foregroundStyle(Color.black)
                    Spacer()
                    Text("\(selectedValue) \(unit)")
                        .font(.footnote)
                        .bold()
                        .foregroundStyle(Color(.systemGray2))
                }
            }
            
            if isExpanded {
                content
            }
        }
        .modifier(
            SelectableCard(isSelected: isExpanded)
        )
        .padding(.bottom, 2)
    }
}

struct DietRestrictionCheckbox: View {
    let restriction: DietRestriction
    @Binding var selectedRestrictions: Set<DietRestriction>
    
    var body: some View {
        Button(action: toggleSelection) {
            HStack {
                Text(restriction.rawValue)
                    .foregroundColor(.black)
                Spacer()
                Image(systemName: selectedRestrictions.contains(restriction) ? "checkmark.square.fill" : "square")
                    .foregroundColor(selectedRestrictions.contains(restriction) ? Color("PrimaryGreen") : Color(.systemGray5))
            }
        }
        .modifier(
            SelectableCard(
                isSelected: selectedRestrictions.contains(restriction)
            )
        )
    }
    
    private func toggleSelection() {
        if selectedRestrictions.contains(restriction) {
            selectedRestrictions.remove(restriction)
        } else {
            selectedRestrictions.insert(restriction)
        }
    }
}

struct DietRestrictionCheckboxesGroup: View {
    @Binding var selectedRestrictions: Set<DietRestriction>
    
    var body: some View {
        VStack(spacing: 8) {
            ForEach(DietRestriction.allCases, id: \.self) { restriction in
                DietRestrictionCheckbox(
                    restriction: restriction,
                    selectedRestrictions: $selectedRestrictions
                )
            }
        }
    }
}

struct GenderRadioButtonsGroup: View {
    @State var isMaleSelected: Bool = false
    @State var isFemaleSelected: Bool = false
    
    var body: some View {
        VStack(spacing: 10) {
            Button(action: {
                isMaleSelected.toggle()
                isFemaleSelected = false
            }) {
                Text("👨 Male")
                    .foregroundColor(.black)
                Spacer()
            }
            .selectableCard(isSelected: isMaleSelected)
            Button(action: {
                isMaleSelected = false
                isFemaleSelected.toggle()
                
            }) {
                Text("👩‍🦰 Female")
                    .foregroundColor(.black)
                Spacer()
            }
            .selectableCard(isSelected: isFemaleSelected)
        }
    }
}

struct GoalRadioButtonsGroup: View {
    @Binding var selectedButton: Goal?
    
    var body: some View {
        VStack(spacing: 10) {
            ForEach([Goal.lose, Goal.maintain, Goal.gain], id: \.self) { goal in
                Button(action: {
                    selectedButton = (selectedButton == goal) ? nil : goal
                }) {
                    HStack {
                        Text(goal.emoji + " " + goal.title)
                            .foregroundColor(.black)
                        Spacer()
                    }
                }
                .modifier(SelectableCard(isSelected: selectedButton == goal))
            }
        }
    }
}

#Preview {
    OnboardingView(showOnboarding: .constant(true), showButton: .constant(false))
}
