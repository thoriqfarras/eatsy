//
//  OnboardingView.swift
//  Eatsy
//
//  Created by Mac on 08/09/25.
//

import SwiftUI
import Foundation

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
    //@StateObject var viewModel: UserViewModel = UserViewModel()
    @State var userData: User = User()
    @State private var selectedHeight: Int? = nil
    @State private var selectedWeight: Int? = nil
    @State private var selectedAge: Int? = nil
    
    @EnvironmentObject var viewModel : UserViewModel
    @EnvironmentObject var recViewModel : RecommendationViewModel
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
                    viewModel.save(userData: userData)
                    viewModel.setDailyTargetCalories()
                    viewModel.setTargetDate()
                    viewModel.completeSetUp()
                    recViewModel.generateRecommendation(dailyTargetCalories: viewModel.user.dailyTargetCalories, date: Date())
                    recViewModel.generateRecommendation(dailyTargetCalories: viewModel.user.dailyTargetCalories, date: Calendar.current.date(byAdding: .day, value: 1, to: Date())!)
                })
                
            case .done:
                OnboardingDoneView(showOnboarding: $showOnboarding, showButton: $showButton, targetDate: $viewModel.user.targetDate,
                                   dailyTargetCalories: $viewModel.user.dailyTargetCalories
                )
            }
        }
        .padding(.bottom, 1)
    }
}

#Preview {
    OnboardingView(
        showOnboarding: .constant(true),
        showButton: .constant(false)
    )
    .environmentObject(UserViewModel())
    .background(Color("defaultBackground"))
}
