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
    @Binding var showButton: Bool  // anak
    @StateObject var viewModel: UserViewModel = UserViewModel()
    @State var userData: User = User()
    @State private var selectedHeight: Int? = nil
    @State private var selectedWeight: Int? = nil
    @State private var selectedAge: Int? = nil
    
    var body: some View {
        VStack {
            switch currentStep {
            case .gender:
                Navbar(
                    currentStep: $currentStep,
                    prevStep: { currentStep = .gender },
                    onCancel: {showOnboarding = false}
                )
                GenderView(
                    nextStep: { currentStep = .goal },
                    gender: $userData.gender
                )
                
            case .goal:
                Navbar(
                    currentStep: $currentStep,
                    prevStep: { currentStep = .gender },
                    onCancel: { showOnboarding = false }
                )
                GoalView(
                    selectedGoal: $userData.goal,
                    nextStep: { currentStep = .aboutYou },
                )
                
            case .aboutYou:
                Navbar(
                    currentStep: $currentStep,
                    prevStep: { currentStep = .goal },
                    onCancel: { showOnboarding = false }
                )
                AboutYouView(
                    selectedHeight: $selectedHeight,
                    selectedWeight: $selectedWeight,
                    selectedAge: $selectedAge,
                    nextStep: { currentStep = .weightGoal },
                    height: $userData.height,
                    weight: $userData.weight,
                    age: $userData.age
                )
                
            case .weightGoal:
                Navbar(
                    currentStep: $currentStep,
                    prevStep: { currentStep = .aboutYou },
                    onCancel: { showOnboarding = false }
                )
                WeightGoalView(
                    nextStep: { currentStep = .dietRestriction },
                    weightGoal: $userData.targetWeight
                )
                
            case .dietRestriction:
                Navbar(
                    currentStep: $currentStep,
                    prevStep: { currentStep = .weightGoal },
                    onCancel: { showOnboarding = false }
                )
                DietRestrictionView(userData: $userData, nextStep: {
                    currentStep = .done
                    viewModel.saveData(userData: userData)
                }, saveUser: viewModel.saveData)
                
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
    }
}

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
    }
}

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
    }
}

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
    }
}

struct DietRestrictionView: View {
    @Binding var userData: User
    let nextStep: () -> Void
    var saveUser: (User) -> Void

    var body: some View {
        VStack {
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

            DietRestrictionCheckboxesGroup(selectedRestrictions: $userData.dietRestrictions)

            Spacer()

            NextButton(nextStep: {
                saveUser(userData)
                nextStep()
            }, isEnabled: !userData.dietRestrictions.isEmpty)
        }
    }
}


struct OnboardingDoneView: View {
    @Binding var showOnboarding: Bool  // anak
    @Binding var showButton: Bool  // anak
    
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 10) {
                Text("Well done 🎉")
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity)
                Text("Your personalized plan is ready!")
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .center)
                Text("Follow the plan we've built for you and  you'll reach your goal by")
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
}

struct DropdownPicker<Content: View>: View {
    let text: String
    @Binding var selectedValue: Int? // Make optional
    let values: Range<Int>
    let unit: String
    let isExpanded: Bool
    let isEnabled: Bool  // Add this
    let toggle: () -> Void
    @ViewBuilder let content: Content
    
    var body: some View {
        VStack {
            Button(action: toggle) {
                HStack {
                    Text(text)
                        .foregroundColor(isEnabled ? .primary : .secondary)
                    Spacer()
                    if let value = selectedValue {
                        Text("\(value) \(unit)")
                            .foregroundColor(.secondary)
                    } else {
                        Text("Select")
                            .foregroundColor(.gray)
                    }
                }
            }
            .disabled(!isEnabled)
            .opacity(isEnabled ? 1.0 : 0.6)
            
            if isExpanded && isEnabled {
                content
                    .frame(height: 150)
            }
        }
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
        .background(Color("defaultBackground"))
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
        .background(Color("defaultBackground"))
    }
}

#Preview {
    OnboardingView(showOnboarding: .constant(true), showButton: .constant(false))
        .background(Color("defaultBackground"))
}
