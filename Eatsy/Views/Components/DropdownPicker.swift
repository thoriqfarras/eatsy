//
//  DropdownPicker.swift
//  Eatsy
//
//  Created by Mac on 15/09/25.
//
import SwiftUI

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
