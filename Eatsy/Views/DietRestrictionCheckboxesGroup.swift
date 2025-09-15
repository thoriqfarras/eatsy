//
//  DietRestrictionCheckboxesGroup.swift
//  Eatsy
//
//  Created by Mac on 15/09/25.
//
import SwiftUI

struct DietRestrictionCheckboxesGroup: View {
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
    }
}
