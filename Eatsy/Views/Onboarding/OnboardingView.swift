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
                GoalView(nextStep: { currentStep = .aboutYou })
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
                OnboardingDoneView()
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
            .foregroundStyle(.green)
            Spacer()
            Text("Set Up Plan").bold()
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
                Text("Next").foregroundStyle(Color.white).bold()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.green)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .padding(.horizontal)
    }
}

struct DoneButton: View {
    
    var body: some View {
        VStack {
            Button(action: {}) {
                Text("Let's get started").foregroundStyle(Color.white).bold()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.green)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .padding(.horizontal)
    }
}

struct GenderView: View {
    
    let nextStep: () -> Void
    
    var body: some View {
        
        
        VStack {
            Text("1 of 5").foregroundStyle(.secondary).padding(.top, 1)
            VStack(spacing: 10) {
                Text("What's your gender?")
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("We'll use this to better personalize your plan.")
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
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
    
    let nextStep: () -> Void
    
    var body: some View {
        VStack {
            Text("2 of 5").foregroundStyle(.secondary).padding(.top, 1)
            VStack(spacing: 10) {
                Text("What's your goal?")
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Choose your goal and we’ll create a meal plan just for you.")
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity)
            .padding()
        }
        
        GoalRadioButtonsGroup()
        Spacer()
        NextButton(nextStep: nextStep)
    }
}

let heights = 130..<221
let weights = 30..<201
let ages = 18..<26

struct AboutYouView: View {
    
    @State private var selectedHeight: Int = 160
    @State private var selectedWeight: Int = 60
    @State private var selectedAge: Int = 21
    
    @State private var heightExpanded: Bool = true
    
    let nextStep: () -> Void
    
    var body: some View {
        VStack {
            Text("3 of 5").foregroundStyle(.secondary).padding(.top, 1)
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
        }
        
        DropdownPicker(text: "📏 Height", selectedValue: selectedHeight, values: heights, unit: "cm") {
            Picker("Height", selection: $selectedHeight) {
                ForEach (heights, id: \.self) { height in
                    Text("\(height) cm")
                }
            }
            .pickerStyle(.wheel)
        }
        
        DropdownPicker(text: "⚖️ Weight", selectedValue: selectedWeight, values: weights, unit: "kg") {
            
            Picker("Weight", selection: $selectedWeight) {
                ForEach (weights, id: \.self) { weight in
                    Text("\(weight) kg")
                }
            }
            .pickerStyle(.wheel)
        }
        
        DropdownPicker(text: "🎂 Age", selectedValue: selectedAge, values: ages, unit: "y.o.") {
            
            Picker("Age", selection: $selectedAge) {
                ForEach (ages, id: \.self) { age in
                    Text("\(age) y.o.")
                }
            }
            .pickerStyle(.wheel)
        }
        Spacer()
        NextButton(nextStep: nextStep)
        
    }
}

struct WeightGoalView: View {
    
    @State private var selectedWeightGoal: Int?
    
    let nextStep: () -> Void
    
    var body: some View {
        VStack {
            Text("4 of 5").foregroundStyle(.secondary).padding(.top, 1)
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
                    .foregroundStyle(Color.black).frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
            }
            .padding()
            
            Picker("Weight Goal", selection: $selectedWeightGoal) {
                ForEach (weights, id: \.self) { weight in
                    Text("\(weight) kg")
                }
            }
            .pickerStyle(.wheel)
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 4)
        .padding(.horizontal)
        
        Spacer()
        NextButton(nextStep: nextStep)
    }
}

struct DietRestrictionView: View {
    
    let nextStep: () -> Void
    
    var body: some View {
        VStack {
            Text("5 of 5").foregroundStyle(.secondary).padding(.top, 1)
            VStack(spacing: 10) {
                Text("Any dietary restriction?")
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Tell us about allergies or foods you need to avoid, so we can adjust your meal plan. ")
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity)
            .padding()
        }
        
        DietRestrictionCheckboxesGroup()
        
        Spacer()
        NextButton(nextStep: nextStep)
    }
}

struct OnboardingDoneView: View {
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
                .foregroundStyle(.green)
                .padding(.top, 5)
        }
        .frame(maxWidth: .infinity)
        .padding()
        Spacer()
        DoneButton()
    }
}

struct DropdownPicker<Content: View>: View {
    @State var showDropdown: Bool = false
    
    let text: String
    let selectedValue: Int
    let values: Range<Int>
    let unit: String
    @ViewBuilder var content: Content
    
    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    showDropdown.toggle()
                }
            }) {
                HStack {
                    Text("\(text)")
                        .foregroundStyle(Color.black).frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    Text("\(selectedValue) \(unit)").foregroundStyle(.green)
                }
                .padding()
            }
            
            if (showDropdown) {
                content
            }
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 4)
        .padding(.horizontal)
    }
}

struct DietRestrictionCheckboxesGroup: View {
    @State var selectedRestrictions: Set<DietRestriction> = []
    
    var body: some View {
        Button(action: {
            if selectedRestrictions.contains(.lactoreIntolerant) {
                selectedRestrictions.remove(.lactoreIntolerant)
            } else {
                selectedRestrictions.insert(.lactoreIntolerant)
            }
        }) {
            Text("🥛 Lactose intolerant")
                .foregroundStyle(Color.black).frame(maxWidth: .infinity, alignment: .leading)
                .padding()
        }
        .background(selectedRestrictions.contains(.lactoreIntolerant) ? .yellow.opacity(75) : .white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 4)
        .padding(.horizontal)
        
        Button(action: {
            if selectedRestrictions.contains(.glutenFree) {
                selectedRestrictions.remove(.glutenFree)
            } else {
                selectedRestrictions.insert(.glutenFree)
            }
        }) {
            Text("🌾 Gluten-free")
                .foregroundStyle(Color.black).frame(maxWidth: .infinity, alignment: .leading)
                .padding()
        }
        .background(selectedRestrictions.contains(.glutenFree) ? .yellow.opacity(75) : .white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 4)
        .padding(.horizontal)
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
                    .foregroundStyle(Color.black).frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
            }
            .background(isMaleSelected ? .yellow.opacity(75) : .white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 4)
            .padding(.horizontal)
            Button(action: {
                isMaleSelected = false
                isFemaleSelected.toggle()
                
            }) {
                Text("👩‍🦰 Female").foregroundStyle(Color.black).frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
            }
            .background(isFemaleSelected ? .yellow.opacity(75) : .white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 4)
            .padding(.horizontal)
        }
    }
}

struct GoalRadioButtonsGroup: View {
    @State var selectedButton: Goal?
    
    var body: some View {
        VStack(spacing: 10) {
            Button(action: {
                if (selectedButton == .lose) {
                    selectedButton = nil
                } else {
                    selectedButton = .lose
                }
            }) {
                Text("🥗 Lose weight")
                    .foregroundStyle(Color.black).frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
            }
            .background(selectedButton == .lose ? .yellow.opacity(75) : .white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 4)
            .padding(.horizontal)
            
            Button(action: {
                if (selectedButton == .maintain) {
                    selectedButton = nil
                } else {
                    selectedButton = .maintain
                }
            }) {
                Text("🍽️ Maintain weight").foregroundStyle(Color.black).frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
            }
            .background(selectedButton == .maintain ? .yellow.opacity(75) : .white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 4)
            .padding(.horizontal)
            
            Button(action: {
                if (selectedButton == .gain) {
                    selectedButton = nil
                } else {
                    selectedButton = .gain
                }
            }) {
                Text("🍗 Gain weight").foregroundStyle(Color.black).frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
            }
            .background(selectedButton == .gain ? .yellow.opacity(75) : .white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 4)
            .padding(.horizontal)
        }
    }
}

#Preview {
    OnboardingView(showOnboarding: .constant(true))
}
