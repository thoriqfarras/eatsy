//
//  FormatTimelineView.swift
//  Eatsy
//
//  Created by Mac on 16/09/25.
//
import SwiftUI


struct FormatTimelineView: View {
    var time: String
    var mealType: MealType
    var meal: MealObject
    var onAddTapped: () -> Void
    
    var body: some View {
        HStack {
            Image("nasgor")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 56, height: 56)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(mealType.rawValue.capitalized)
                    .font(.caption2)
                    .foregroundStyle(Color(.systemGray2))
                Text(meal.menuName)
                    .bold()
                HStack () {
                    Image(systemName: "drop")
                    
                    Text("\(meal.fat)g")
                    
                    Image(systemName: "leaf")
                    
                    Text("\(meal.carbs)g")
                    
                    Image(systemName: "bolt.heart")
                    
                    Text("\(meal.protein)g")
                }
                .foregroundColor(Color(.systemGray2))
                .font(.footnote)
            }
            Spacer()
                Text("\(meal.calories)kcal")
                    .font(.footnote)
                    .bold()
                    .padding(10)
                    .background(Color("secYellow"))
                    .foregroundColor(Color("PrimaryGreen"))
                    .cornerRadius(8)
        }
        .padding(-4)
        .eatsyCard()
    }
}

#Preview {
    FormatTimelineView(
        time: "08:00",
        mealType: .breakfast,
        meal: MealObject(id:1, mealType: .breakfast, menuName: "Bubur Ayam", calories: 750, protein: 7, carbs: 30, fat: 23, restrictions: [.eggAllergy], isSelected: false),
        onAddTapped: { print("Add tapped") }
    )
}


