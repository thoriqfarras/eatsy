import SwiftUI

struct ScheduleMealRow: View {
    var meal: MealObject
    var mealType: MealType
    
    var body: some View {
        HStack {
            Image(meal.imageName)
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
                        .padding(.leading, -4)
                    
                    Image(systemName: "leaf")
                    
                    Text("\(meal.carbs)g")
                        .padding(.leading, -4)
                    
                    Image(systemName: "bolt.heart")
                    
                    Text("\(meal.protein)g")
                        .padding(.leading, -4)
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
    //        .padding(14)
    //        .background(
    //            RoundedRectangle(cornerRadius: 18, style: .continuous)
    //                .fill(Color(.systemBackground))
    //                .shadow(color: .black.opacity(0.08), radius: 8, y: 2)
    //        )
}

