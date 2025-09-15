//
//  DoneButton.swift
//  Eatsy
//
//  Created by Mac on 15/09/25.
//
import SwiftUI

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
