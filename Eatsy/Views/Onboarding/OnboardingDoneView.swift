//
//  OnboardingDoneView.swift
//  Eatsy
//
//  Created by Mac on 15/09/25.
//
import SwiftUI

struct OnboardingDoneView: View {
    @Binding var showOnboarding: Bool  // anak
    @Binding var showButton: Bool  // anak
    @Binding var targetDate: Date?
    @Binding var height: Int?
    @Binding var dailyTargetCalories: Int
    
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
                Text("🗓️ \(targetDate?.formatted(formatter.dateFormat) ?? Date())")
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
        .background(Color("defaultBackground"))
    }
}
