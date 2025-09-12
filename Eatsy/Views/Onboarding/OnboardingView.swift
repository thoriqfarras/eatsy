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
//<<<<<<< Updated upstream
    @Binding var showButton: Bool  // anak
//=======
    @StateObject var viewModel: UserViewModel = UserViewModel()
    @State var userData: User = User()
//>>>>>>> Stashed changes
    
    var body: some View {
        VStack {
            switch currentStep {
            case .gender:
                Navbar(
                    currentStep: $currentStep,
                    prevStep: { currentStep = .gender },
                    onCancel: {showOnboarding = false}
                )
                GenderView(nextStep: { currentStep = .goal }, gender: $userData.gender)
            case .goal:
                Navbar(
                    currentStep: $currentStep,
                    prevStep: { currentStep = .gender },
                    onCancel: { showOnboarding = false }
                )
//<<<<<<< Updated upstream
                GoalView(
                    selectedGoal: $userData.goal,
                    nextStep: { currentStep = .aboutYou },
                )
//=======
//                GoalView(nextStep: { currentStep = .aboutYou }, goal: $userData.goal)
//>>>>>>> Stashed changes
            case .aboutYou:
                Navbar(
                    currentStep: $currentStep,
                    prevStep: { currentStep = .goal },
                    onCancel: { showOnboarding = false }
                )
                AboutYouView(nextStep: { currentStep = .weightGoal }, height: $userData.height, weight: $userData.weight, age: $userData.age)
            case .weightGoal:
                Navbar(
                    currentStep: $currentStep,
                    prevStep: { currentStep = .aboutYou },
                    onCancel: { showOnboarding = false }
                )
                WeightGoalView(nextStep: { currentStep = .dietRestriction }, weightGoal: $userData.targetWeight)
            case .dietRestriction:
                Navbar(
                    currentStep: $currentStep,
                    prevStep: { currentStep = .weightGoal },
                    onCancel: { showOnboarding = false }
                )
                DietRestrictionView(nextStep: { currentStep = .done }, userData: $userData, saveUser: viewModel.saveData)
            case .done:
//<<<<<<< Updated upstream
                OnboardingDoneView(showOnboarding: $showOnboarding, showButton: $showButton)
//=======
//                OnboardingDoneView(showOnboarding: $showOnboarding)
//>>>>>>> Stashed changes
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
            .background(Color("defaultBackground"))
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
//<<<<<<< Updated upstream
                showOnboarding = false  // tutup onboarding
                showButton = false
            }) {
                Text("Let's get started")
//=======
//                showOnboarding = false
//            }) {
//                Text("Let's get started").foregroundStyle(Color.white).bold()
//                    .padding()
//                    .frame(maxWidth: .infinity)
//                    .background(Color("PrimaryGreen"))
//                    .clipShape(RoundedRectangle(cornerRadius: 16))
//>>>>>>> Stashed changes
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
            
            GenderRadioButtonsGroup(selectedGender: $gender)
            Spacer()
            NextButton(nextStep: nextStep)
        }
//<<<<<<< Updated upstream
        .background(Color("defaultBackground")) // 👈 pindah ke sini
//=======
//        
//        GenderRadioButtonsGroup(selectedGender: $gender)
//        
//        Spacer()
//        NextButton(nextStep: nextStep)
//>>>>>>> Stashed changes
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
//<<<<<<< Updated upstream
        .background(Color("defaultBackground"))
//=======
//        
//        GoalRadioButtonsGroup(selectedGoal: $goal)
//        Spacer()
//        NextButton(nextStep: nextStep)
//>>>>>>> Stashed changes
    }
}


let heights = 130..<221
let weights = 30..<201
let ages = 18..<26

struct AboutYouView: View {
//<<<<<<< Updated upstream
    @State private var selectedHeight: Int = 160
    @State private var selectedWeight: Int = 60
    @State private var selectedAge: Int = 21
    
    @State private var expandedPicker: PickerType? = nil
//=======
//>>>>>>> Stashed changes
    
    let nextStep: () -> Void
    
    @Binding var height: Int
    @Binding var weight: Int
    @Binding var age: Int
    
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
//<<<<<<< Updated upstream
            
            DropdownPicker(
                text: "📏 Height",
                selectedValue: $selectedHeight,
                values: heights,
                unit: "cm",
                isExpanded: expandedPicker == .height,
                toggle: { expandedPicker = expandedPicker == .height ? nil : .height }
            ) {
                Picker("Height", selection: $selectedHeight) {
                    ForEach(heights, id: \.self) { height in
                        Text("\(height) cm")
                    }
//=======
//        }
//        
//        DropdownPicker(text: "📏 Height", selectedValue: $height, values: heights, unit: "cm") {
//            Picker("Height", selection: $height) {
//                ForEach (heights, id: \.self) { height in
//                    Text("\(height) cm")
//                }
//            }
//            .pickerStyle(.wheel)
//        }
//        
//        DropdownPicker(text: "⚖️ Weight", selectedValue: $weight, values: weights, unit: "kg") {
//            
//            Picker("Weight", selection: $weight) {
//                ForEach (weights, id: \.self) { weight in
//                    Text("\(weight) kg")
//>>>>>>> Stashed changes
                }
                .pickerStyle(.wheel)
            }
//<<<<<<< Updated upstream
            
            DropdownPicker(
                text: "⚖️ Weight",
                selectedValue: $selectedWeight,
                values: weights,
                unit: "kg",
                isExpanded: expandedPicker == .weight,
                toggle: { expandedPicker = expandedPicker == .weight ? nil : .weight }
            ) {
                Picker("Weight", selection: $selectedWeight) {
                    ForEach(weights, id: \.self) { weight in
                        Text("\(weight) kg")
                    }
//=======
//            .pickerStyle(.wheel)
//        }
//        
//        DropdownPicker(text: "🎂 Age", selectedValue: $age, values: ages, unit: "yo") {
//            
//            Picker("Age", selection: $age) {
//                ForEach (ages, id: \.self) { age in
//                    Text("\(age) yo")
//>>>>>>> Stashed changes
                }
                .pickerStyle(.wheel)
            }
            
            DropdownPicker(
                text: "🎂 Age",
                selectedValue: $selectedAge,
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
        .background(Color("defaultBackground"))
    }
}

struct WeightGoalView: View {
    
    let nextStep: () -> Void
    
    @Binding var weightGoal: Int
    
    var body: some View {
        VStack {
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
            
//<<<<<<< Updated upstream
            VStack {
                HStack {
                    Text("🎯 Goal Weight")
                        .foregroundStyle(Color.black)
                    Spacer()
//=======
//            Picker("Weight Goal", selection: $weightGoal) {
//                ForEach (weights, id: \.self) { weight in
//                    Text("\(weight) kg")
//>>>>>>> Stashed changes
                }
                
                Picker("Weight Goal", selection: $weightGoal) {
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
        .background(Color("defaultBackground"))
    }
}

struct DietRestrictionView: View {
    @State private var selectedRestrictions: Set<DietRestriction> = []
    let nextStep: () -> Void
    
    @Binding var userData: User
    var saveUser: (User) -> Void
    
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
            
            DietRestrictionCheckboxesGroup(selectedRestrictions: $userData.dietRestrictions)
            
            Spacer()
            NextButton(nextStep: nextStep)
                .onTapGesture {
                    print("This is button")
                    saveUser(userData)
                }
        }
//<<<<<<< Updated upstream
        .background(Color("defaultBackground"))
//=======
//        
//        DietRestrictionCheckboxesGroup(dietRestrictions: $userData.dietRestrictions)
//        
//        Spacer()
//        NextButton(nextStep: nextStep)
//            .onTapGesture {
//                print("This is button")
//                saveUser(userData)
//            }
//>>>>>>> Stashed changes
    }
}

struct OnboardingDoneView: View {
//<<<<<<< Updated upstream
    @Binding var showOnboarding: Bool  // anak
    @Binding var showButton: Bool  // anak
//=======
//    @Binding var showOnboarding: Bool
//>>>>>>> Stashed changes
    
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
//<<<<<<< Updated upstream
        .background(Color("defaultBackground"))
//=======
//        .frame(maxWidth: .infinity)
//        .padding()
//        Spacer()
//        DoneButton(showOnboarding: $showOnboarding)
//>>>>>>> Stashed changes
    }
}

struct DropdownPicker<Content: View>: View {
    let text: String
    @Binding var selectedValue: Int
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
        .background(Color("defaultBackground"))
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
//<<<<<<< Updated upstream
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
        .background(Color("defaultBackground"))
//=======
//    @Binding var dietRestrictions: Set<DietRestriction>
//    
//    var body: some View {
//        
//        ForEach(DietRestriction.allCases, id: \.self) { restriction in
//            RestrictionCard(selectedRestrictions: $dietRestrictions, restriction: restriction, text: restriction.rawValue)
//        }
//    }
//}
//
//struct RestrictionCard: View {
//    @Binding var selectedRestrictions: Set<DietRestriction>
//    var restriction: DietRestriction
//    var text: String
//    
//    var body: some View {
//        Button(action: {
//            if selectedRestrictions.contains(restriction) {
//                selectedRestrictions.remove(restriction)
//                print(selectedRestrictions)
//            } else {
//                selectedRestrictions.insert(restriction)
//                print(selectedRestrictions)
//            }
//        }) {
//            Text("\(text)")
//                .foregroundStyle(Color.black)
//            Spacer()
//            Image(systemName: selectedRestrictions.contains(restriction) ? "checkmark.square.fill" : "square")
//                .foregroundColor(selectedRestrictions.contains(restriction) ? Color("PrimaryGreen") : Color(.systemGray5))
//        }
//        .modifier(
//            SelectableCard(
//                isSelected: selectedRestrictions.contains(restriction)
//            )
//        )
//>>>>>>> Stashed changes
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
//<<<<<<< Updated upstream
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
//=======
//    @Binding var selectedGoal: Goal?
//    
//    var body: some View {
//        VStack(spacing: 10) {
//            Button(action: {
//                if (selectedGoal == .lose) {
//                    selectedGoal = nil
//                } else {
//                    selectedGoal = .lose
//>>>>>>> Stashed changes
                }
                .modifier(SelectableCard(isSelected: selectedButton == goal))
            }
//<<<<<<< Updated upstream
//=======
//            .modifier(SelectableCard(
//                isSelected: selectedGoal == .lose
//            ))
//            
//            Button(action: {
//                if (selectedGoal == .maintain) {
//                    selectedGoal = nil
//                } else {
//                    selectedGoal = .maintain
//                }
//            }) {
//                Text("🍽️ Maintain weight")
//                    .foregroundColor(.black)
//                Spacer()
//            }
//            .modifier(SelectableCard(
//                isSelected: selectedGoal == .maintain
//            ))
//            
//            Button(action: {
//                if (selectedGoal == .gain) {
//                    selectedGoal = nil
//                } else {
//                    selectedGoal = .gain
//                }
//            }) {
//                Text("🍗 Gain weight")
//                    .foregroundColor(.black)
//                Spacer()
//            }
//            .modifier(SelectableCard(
//                isSelected: selectedGoal == .gain
//            ))
//            
//>>>>>>> Stashed changes
        }
        .background(Color("defaultBackground"))
    }
}

#Preview {
    OnboardingView(showOnboarding: .constant(true), showButton: .constant(false))
}
