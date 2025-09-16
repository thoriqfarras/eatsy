import SwiftUI

// RecomendationView.swift
struct RecomendationView: View {
    @StateObject private var viewModel = FoodViewModel()
    @Environment(\.dismiss) var dismiss
    @State private var selectedMealID: Int? = nil
    
    var mealType: MealType
    let dummyRecomend = Recommendation(
        date: Date(),
        breakfasts: [
            MealObject(id:1, mealType: .breakfast, menuName: "Bubur Ayam", calories: 750, protein: 7, carbs: 30, fat: 23, restrictions: [.eggAllergy], isSelected: false),
            MealObject(id:2,mealType: .breakfast, menuName: "Ayam Goreng", calories: 500, protein: 27, carbs: 50, fat: 33, restrictions: [.eggAllergy], isSelected: false),
            MealObject(id:3,mealType: .breakfast, menuName: "Bakpao", calories: 600, protein: 17, carbs: 37, fat: 13, restrictions: [.eggAllergy], isSelected: false)
        ],
        lunches: [
            MealObject(id:11,mealType: .lunch, menuName: "Nasgor Ayam", calories: 750, protein: 7, carbs: 30, fat: 23, restrictions: [.eggAllergy], isSelected: false),
            MealObject(id:12,mealType: .lunch, menuName: "Mi Ayam", calories: 750, protein: 7, carbs: 30, fat: 23, restrictions: [.eggAllergy], isSelected: false),
            MealObject(id:13,mealType: .lunch, menuName: "Ayam Bali", calories: 750, protein: 7, carbs: 30, fat: 23, restrictions: [.eggAllergy], isSelected: false)
        ],
        dinners: [
            MealObject(id:21,mealType: .dinner, menuName: "Ketoprak Ayam", calories: 750, protein: 7, carbs: 30, fat: 23, restrictions: [.eggAllergy], isSelected: false),
            MealObject(id:22,mealType: .dinner, menuName: "Mi Kuah", calories: 750, protein: 7, carbs: 30, fat: 23, restrictions: [.eggAllergy], isSelected: false),
            MealObject(id:23,mealType: .dinner, menuName: "Ayam Bakar", calories: 750, protein: 7, carbs: 30, fat: 23, restrictions: [.eggAllergy], isSelected: false)
        ]
    )
    
    var body: some View {
        VStack {
            Capsule()
                .fill(Color.gray.opacity(0.4))
                .frame(width: 52, height: 6)
                .padding(.vertical, 6)
            
            Text("Recommendation")
                .bold()
                .padding(6)
            
            // Breakfast
            if mealType == .breakfast {
                HStack {
                    Label("Today", systemImage: "calendar")
                    Label("Breakfast", systemImage: "clock")
                }
                .font(.footnote)
//                .bold()
                .foregroundColor(.gray)
                .padding(.bottom, 6)
                
                VStack {
                    ForEach(dummyRecomend.breakfasts) { recomBreak in
                        Button {
                            selectedMealID = recomBreak.id
                            print("Pilih \(recomBreak.menuName)")
                        } label: {
                            FoodCardView(
                                meal: recomBreak,
                                isSelected: selectedMealID == recomBreak.id
                            )
                            .selectableCard(isSelected: selectedMealID == recomBreak.id)
                        }
                    }
                }
                
                Button("Choose") { dismiss() }
                    .buttonStyle(PrimaryButtonStyle())
            
            // Lunch
            } else if mealType == .lunch {
                HStack {
                    Label("Today", systemImage: "calendar")
                    Label("Lunch", systemImage: "clock")
                }
                .font(.footnote)
                .bold()
                .foregroundColor(.gray)
                .padding(.bottom, 6)
                
                VStack() {
                    ForEach(dummyRecomend.lunches) { recomLunch in
                        Button {
                            print("Pilih \(recomLunch.menuName)")
                        } label: {
                            FoodCardView(meal: recomLunch, isSelected: recomLunch.isSelected)
                        }
                    }
                }
                
                Button("Choose") { dismiss() }
                    .buttonStyle(PrimaryButtonStyle())
            
            } else if mealType == .dinner {
                HStack {
                    Label("Today", systemImage: "calendar")
                    Label("Dinner", systemImage: "clock")
                }
                .font(.footnote)
                .bold()
                .foregroundColor(.gray)
                .padding(.bottom, 6)
                
                VStack() {
                    ForEach(dummyRecomend.dinners) { recomDinner in
                        Button {
                            print("Pilih \(recomDinner.menuName)")
                        } label: {
                            FoodCardView(meal: recomDinner, isSelected: recomDinner.isSelected)
                        }
                    }
                }
                
                Button("Choose") { dismiss() }
                    .buttonStyle(PrimaryButtonStyle())
            } else {
                Text("MealType not found!")
            }
        }
    }
}


// MARK: - Custom corner radius
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = 12
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

#Preview {
    RecomendationView( mealType: .breakfast)
}
