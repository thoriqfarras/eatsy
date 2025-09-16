import SwiftUI

struct TodayView: View {
    @Binding var showOnboarding: Bool
    @Binding var showButton: Bool      // tombol GET MEAL PLAN
    @Binding var enableButton: Bool    // tombol + di meal card
    @Binding var showRecommendation: Bool
    
    @State private var selectedMealCardType: MealType = .breakfast
    
    @EnvironmentObject var userVM : UserViewModel
    var type = 2
    var recommendation = Recommendation(
        date: Date(),
        breakfasts: [
            MealObject(id:1, mealType: .breakfast, menuName: "Bubur Ayam", calories: 750, protein: 7, carbs: 30, fat: 23, restrictions: [.eggAllergy]),
            MealObject(id:2,mealType: .breakfast, menuName: "Bubur Ayam", calories: 750, protein: 7, carbs: 30, fat: 23, restrictions: [.eggAllergy]),
            MealObject(id:3,mealType: .breakfast, menuName: "Bubur Ayam", calories: 750, protein: 7, carbs: 30, fat: 23, restrictions: [.eggAllergy])
        ],
        lunches: [
            MealObject(id:11,mealType: .lunch, menuName: "Nasgor Ayam", calories: 750, protein: 7, carbs: 30, fat: 23, restrictions: [.eggAllergy]),
            MealObject(id:12,mealType: .lunch, menuName: "Mi Ayam", calories: 750, protein: 7, carbs: 30, fat: 23, restrictions: [.eggAllergy]),
            MealObject(id:13,mealType: .lunch, menuName: "Ayam Bali", calories: 750, protein: 7, carbs: 30, fat: 23, restrictions: [.eggAllergy])
        ],
        dinners: [
            MealObject(id:21,mealType: .dinner, menuName: "Ketoprak Ayam", calories: 750, protein: 7, carbs: 30, fat: 23, restrictions: [.eggAllergy]),
            MealObject(id:22,mealType: .dinner, menuName: "Mi Kuah", calories: 750, protein: 7, carbs: 30, fat: 23, restrictions: [.eggAllergy]),
            MealObject(id:23,mealType: .dinner, menuName: "Ayam Bakar", calories: 750, protein: 7, carbs: 30, fat: 23, restrictions: [.eggAllergy])
        ]
    )
    
    @EnvironmentObject var recommendationViewModel: RecommendationViewModel
    
    
    var body: some View {
        VStack(spacing: 16) {
            // Title & Profile
            HStack {
                Text("Today's Meal Plan")
                    .font(.title)
                    .bold()
                
                Spacer()
                
                NavigationLink {
                    ProfileView()
                } label: {
                    Image(systemName: "person.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 28, height: 28)
                        .foregroundColor(.white)
                        .background(Circle().fill(Color.gray))
                }
            }
            .padding(.horizontal)
            .padding(.top, 12)
            
            // Info card / GET MEAL PLAN
            if !userVM.user.isSetUp {
                Button("GET MEAL PLAN") {
                    showOnboarding = true
                }
                .buttonStyle(PrimaryButtonStyle())
                .padding(.horizontal)
                .onAppear {
                    print("user tidak ada") // ✅ sekarang aman
                    enableButton = true
                }
                            
                // tombol hijau GET MEAL PLAN
            } else {
                HStack(spacing: 12) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("This is your starting line!")
                            .bold()
                            .font(.headline)
                            .padding(.bottom, 6)
                        
                        Text("Small steps today, big changes ahead\nFirst progress visible by next week")
                            .font(.caption)
                            .foregroundStyle(Color(.systemGray2))
                    }
                    Spacer()
                    Image("daun")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 68, height: 68)
                }
                .eatsyCard()
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(.systemGray5), lineWidth: 1)
                )
                .padding([.horizontal, .bottom])
                .onAppear {
                    print("user ada") // ✅ sekarang aman
                    enableButton = false
                }
            }
            
            // Calories Intake
            HStack {
                Text("Calories Intake")
                    .bold()
                Spacer()
                Text("\(userVM.user.dailyTargetCalories) kcal")
                    .font(.caption)
                    .foregroundStyle(Color(.systemGray2))
                    .bold()
            }
            .padding(.horizontal)
            
            // Timeline
            
            List {
                if recommendationViewModel.recommendations.count > 0 {
                    Text("RECOMMENDATION GENERATED")
                    TimelineRow(
                        onAddTapped: {
                            selectedMealCardType = .breakfast
                            showRecommendation = true
                        },
                        isEnabled: enableButton,
                        mealType: .breakfast,
                        time: "8 AM",
                        calorie: recommendationViewModel.recommendations[0].avgBreakfastsCalorie
                    )
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                    
                    TimelineRow(
                        onAddTapped: {
                            selectedMealCardType = .lunch
                            showRecommendation = true
                        },
                        isEnabled: enableButton,
                        mealType: .lunch,
                        time: "1 PM",
                        calorie: recommendationViewModel.recommendations[0].avgLunchesCalorie
                    )
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                    
                    TimelineRow(
                        onAddTapped: {
                            selectedMealCardType = .dinner
                            showRecommendation = true
                        },
                        isEnabled: enableButton,
                        mealType: .dinner,
                        time: "5 PM",
                        calorie: recommendationViewModel.recommendations[0].avgDinnersCalorie
                    )
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                } else {
                    Text("RECOMMENDATION NOT GENERATED")
                    TimelineRow(
                        onAddTapped: { showRecommendation = true },
                        isEnabled: enableButton,
                        mealType: .breakfast,
                        time: "8 AM",
                        calorie: 0
                    )
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                    
                    TimelineRow(
                        onAddTapped: { showRecommendation = true },
                        isEnabled: enableButton,
                        mealType: .lunch,
                        time: "1 PM",
                        calorie: 0
                    )
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                    
                    TimelineRow(
                        onAddTapped: { showRecommendation = true },
                        isEnabled: enableButton,
                        mealType: .dinner,
                        time: "5 PM",
                        calorie: 0
                    )
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                }
                
                
            }
            .listStyle(PlainListStyle())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("defaultBackground"))
        .background(Color(.systemGroupedBackground))
        .sheet(isPresented: $showRecommendation) {
            RecomendationView(mealType: $selectedMealCardType)
                .presentationDetents([.fraction(0.8)])
                .presentationCornerRadius(24)
        }
    }
}

struct TimelineRow: View {
    
    var onAddTapped: () -> Void
    var isEnabled: Bool   // 👈 flag untuk kontrol tombol
    var mealType: MealType
    var meal: MealObject?
    var time: String
    var calorie: Int

    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            // Timeline dots + line
            VStack {
                Circle()
                    .fill(Color.white)
                    .frame(width: 14, height: 14)
                    .overlay(
                        Circle().stroke(Color.gray, lineWidth: 1)
                    )
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 2)
                    .padding(.top, -2)
            }
            
            // Conditional Meal Card
            VStack(alignment: .leading, spacing: 8) {
                Text("\(time)")
                    .font(.caption)
                
                // Use a single 'if let' to handle both cases
                if let chosenMeal = meal {
                    // This block runs when `meal` is NOT nil
                    HStack {
                        Image(chosenMeal.menuName) // Use chosenMeal directly
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 56, height: 56)
                            .clipped()
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("\(mealType.rawValue)")
                                .font(.caption)
                                .foregroundStyle(Color(.systemGray2))
                            Text(chosenMeal.menuName)
                                .bold()
                            Text("P: \(chosenMeal.protein)g C: \(chosenMeal.carbs)g F: \(chosenMeal.fat)g")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        
                        Spacer()
                        
                        Text("\(chosenMeal.calories)kcal")
                            .bold()
                            .padding(4)
                            .foregroundStyle(.green)
                            .background(.green.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.green, lineWidth: 1)
                            )
                    }
                    .eatsyCard()
                } else {
                    // This block runs when `meal` is nil
                    HStack {
                        Text("🍛")
                            .font(.largeTitle)
                            .foregroundStyle(Color(.systemGray2))
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("\(mealType.rawValue)")
                                .font(.caption)
                                .foregroundStyle(Color(.systemGray2))
                            if calorie > 0 {
                                Text("~\(calorie)kcal")
                                    .bold()
                            } else {
                                Text("-")
                                    .bold()
                            }
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            onAddTapped()
                        }) {
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                        }
                        .disabled(isEnabled)
                        .opacity(isEnabled ? 1.0 : 0.4)
                    }
                    .eatsyCard()
                }
            }
        }
    }
}

struct TimelineRowFilled: View {
    var onAddTapped: () -> Void
    var isEnabled: Bool   // 👈 flag untuk kontrol tombol
    var mealType: MealType
    var meal: MealObject?
    var time: String
    var calorie: Int?

    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            // Timeline dots + line
            VStack {
                Circle()
                    .fill(Color.white)
                    .frame(width: 14, height: 14)
                    .overlay(
                        Circle().stroke(Color.gray, lineWidth: 1)
                    )
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 2)
                    .padding(.top, -2)
            }
            
            // Meal Card
            VStack(alignment: .leading, spacing: 8) {
                Text("\(time)")
                    .font(.caption)
                
                HStack {
                    
                    Image("nasgor")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 56, height: 56)
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("\(mealType.rawValue)")
                            .font(.caption)
                            .foregroundStyle(Color(.systemGray2))
                        Text("Nasi Goreng")
                            .bold()
                        Text("50g | 20g | 7g")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                    
                    Text("800kcal")
                        .bold()
                        .padding(4)
                        .foregroundStyle(.green)
                        .background(.green.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.green, lineWidth: 1)
                        )
                    
//                    Button(action: {
//                        onAddTapped()
//                    }) {
//                        Image(systemName: "plus")
//                            .foregroundColor(.black)
//                    }
//                    .disabled(isEnabled)
//                    .opacity(isEnabled ? 1.0 : 0.4)
                }
                .eatsyCard()
            }
        }
    }
}

#Preview {
    NavigationStack {
        TodayView(showOnboarding: .constant(false), showButton: .constant(false), enableButton: .constant(false), showRecommendation: .constant(false))
    }
}
