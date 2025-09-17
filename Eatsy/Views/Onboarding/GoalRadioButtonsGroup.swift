//
//  GoalRadioButtonsGroup.swift
//  Eatsy
//
//  Created by Mac on 15/09/25.
//
import SwiftUI

struct GoalRadioButtonsGroup: View {
    @Binding var selectedButton: Goal?
    
    var body: some View {
        VStack(spacing: 10) {
            ForEach([Goal.lose, Goal.maintain, Goal.gain], id: \.self) { goal in
                Button(action: {
                    selectedButton = goal  // Always set the selected goal, don't toggle to nil
                }) {
                    HStack {
                        Text(goal.emoji + " " + goal.title)
                            .foregroundColor(.black)
                        Spacer()
                    }
                }
                .modifier(SelectableCard(isSelected: selectedButton == goal))
            }
        }
        .background(Color("defaultBackground"))
    }
}
