//
//  DietRestrictionCheckbox.swift
//  Eatsy
//
//  Created by Mac on 15/09/25.
//
import SwiftUI

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
