import SwiftUI

// RecomendationView.swift
struct RecomendationView: View {
    @State var selectedMeal: MealObject?
    @State var selectedMealID: Int?
    
    @Binding var mealType: MealType
    @State var meals: [MealObject]
    
    @EnvironmentObject var userViewModel: UserViewModel
    @Environment(\.dismiss) var dismiss
    
    init(mealType: Binding<MealType>, meals: [MealObject]) {
        _mealType = mealType
        _meals = State(initialValue: meals)
    }
    
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

                HStack {
                    Label("Today", systemImage: "calendar")
                    Label("\(mealType.rawValue)", systemImage: "clock")
                }
                .font(.footnote)
//                .bold()
                .foregroundColor(.gray)
                .padding(.bottom, 6)
                
                VStack {
                    ForEach(meals) { meal in
                        Button {
                            selectedMealID = meal.id
                            selectedMeal = meal
                        } label: {
                            FoodCardView(
                                meal: meal,
                                isSelected: selectedMealID == meal.id
                            )
                            .selectableCard(isSelected: selectedMealID == meal.id)
                        }
                    }
                }
                
            Button("Choose") { action: do {
                if mealType == .breakfast {
                    userViewModel.user.selectedMealsForToday.breakfast = selectedMeal
                } else if mealType == .lunch {
                    userViewModel.user.selectedMealsForToday.lunch = selectedMeal
                } else if mealType == .dinner {
                    userViewModel.user.selectedMealsForToday.dinner = selectedMeal
                }
                userViewModel.saveDefaults()
                dismiss()
            } }
                    .buttonStyle(PrimaryButtonStyle())
        }
        .onAppear {
            // Use .onAppear to set the initial state from the userViewModel
            // This runs after the view is fully initialized and the environment is available
            let selectedMeals = userViewModel.user.selectedMealsForToday
            
            switch mealType {
            case .breakfast:
                self.selectedMeal = selectedMeals.breakfast
            case .lunch:
                self.selectedMeal = selectedMeals.lunch
            case .dinner:
                self.selectedMeal = selectedMeals.dinner
            }
            
            self.selectedMealID = self.selectedMeal?.id
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

//#Preview {
//    RecomendationView(mealType: .breakfast)
//}
