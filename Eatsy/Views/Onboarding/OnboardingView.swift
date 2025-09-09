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
            
            // Title & Subtitle
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
            
            VStack(spacing: 10) {
                Button(action: {}) {
                    Text("👨 Male")
                        .foregroundStyle(Color.black).frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                }
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 4)
                .padding(.horizontal)
                Button(action: {}) {
                    Text("👩‍🦰 Female").foregroundStyle(Color.black).frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                }
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 4)
                .padding(.horizontal)
            }
            
            Spacer()
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
        .padding(.bottom, 1)
    }
}

#Preview {
    OnboardingView()
}
