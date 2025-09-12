//
//  Lab.swift
//  Eatsy
//
//  Created by Mac on 10/09/25.
//

import SwiftUI

struct DropdownMenu: View {
    @State private var isExpanded: Bool = false
    @State private var selectedOption: String = "Select Option"
    
    enum Flavor: String, CaseIterable, Identifiable {
        case chocolate, vanilla, strawberry
        var id: Self { self }
    }

    @State private var selectedFlavor: Flavor = .chocolate

    let options: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // The button that expands/collapses the menu
            Button(action: {
                withAnimation {
                    isExpanded.toggle()
                }
            }) {
                HStack {
                    Text(selectedOption)
                        .foregroundColor(.black)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .rotationEffect(.degrees(isExpanded ? -180 : 0))
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
            }

            // The list of options, conditionally shown
            if isExpanded {
                VStack(alignment: .leading, spacing: 0) {
//                    ForEach(options, id: \.self) { option in
//                        Button(action: {
//                            withAnimation {
//                                self.selectedOption = option
//                                self.isExpanded = false
//                            }
//                        }) {
//                            Text(option)
//                                .foregroundColor(.black)
//                                .frame(maxWidth: .infinity, alignment: .leading)
//                                .padding(.vertical, 10)
//                                .padding(.horizontal)
//                        }
//                    }
                    List {
                        Picker("Flavor", selection: $selectedFlavor) {
                            Text("Chocolate").tag(Flavor.chocolate)
                            Text("Vanilla").tag(Flavor.vanilla)
                            Text("Strawberry").tag(Flavor.strawberry)
                        }
                        .pickerStyle(.wheel)
                    }
                }
                .background(Color.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
            }
        }
        .padding()
    }
}

// How to use the DropdownMenu
struct LabView: View {
    let menuOptions = ["Option A", "Option B", "Option C", "Option D"]

    var body: some View {
        DropdownMenu(options: menuOptions)
    }
}

#Preview {
    LabView()
}
