//
//  DietRestrictionView.swift
//  Eatsy
//
//  Created by Mac on 15/09/25.
//
import SwiftUI

struct DietRestrictionView: View {
    @Binding var userData: User
    let nextStep: () -> Void
    var saveUser: (User) -> Void
    @ObservedObject var viewModel: UserViewModel

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

            if userData.dietRestrictions.isEmpty {
                            Button("Skip") {
                                nextStep()
                                saveUser(userData)
                            }
                            .buttonStyle(OutlineButtonStyle())
                        } else {
                            Button("Next") {
                                nextStep()
                                saveUser(userData)
                            }
                            .buttonStyle(PrimaryButtonStyle())
                        }
                    }
        .background(Color("defaultBackground"))
    }
}
