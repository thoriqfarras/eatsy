//
//  OnboardingView.swift
//  Eatsy
//
//  Created by Mac on 08/09/25.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        VStack {
            Navbar()
//            GenderView();
            GoalView()
            Spacer()
            NextButton()
        }
        .padding(.bottom, 1)
    }
}

struct Navbar: View {
    var body: some View {
        HStack(alignment: .top) {
            Button("Cancel") {
                print("")
            }
            .foregroundStyle(.green)
            Spacer()
            Text("Set Up Plan").bold()
            Spacer()
            Button("Cancel") {}.hidden()
        }.padding(.horizontal)
    }
}

struct NextButton: View {
    var body: some View {
        VStack {
            Button(action: {}) {
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

struct GenderView: View {
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
    }
}

struct GoalView: View {
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
    OnboardingView()
}
