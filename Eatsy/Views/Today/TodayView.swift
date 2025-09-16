import SwiftUI

enum TimelineState {
    case beforeSignIn
    case afterSignIn(calorie: Int?)
    case filled(meal: MealObject)
}

struct TodayView: View {
    @Binding var showOnboarding: Bool
    @Binding var showButton: Bool      // tombol GET MEAL PLAN
    @Binding var enableButton: Bool    // tombol + di meal card
    @Binding var showRecommendation: Bool
    var mealType: MealType
    
    @EnvironmentObject var userVM : UserViewModel
    var type = 2
    var recommendation = Recommendation(
        date: Date(),
        breakfasts: [
            MealObject(id:1, mealType: .breakfast, menuName: "Bubur Ayam", calories: 750, protein: 7, carbs: 30, fat: 23, restrictions: [.eggAllergy], isSelected: false),
            MealObject(id:2,mealType: .breakfast, menuName: "Bubur Ayam", calories: 750, protein: 7, carbs: 30, fat: 23, restrictions: [.eggAllergy], isSelected: false),
            MealObject(id:3,mealType: .breakfast, menuName: "Bubur Ayam", calories: 750, protein: 7, carbs: 30, fat: 23, restrictions: [.eggAllergy], isSelected: false)
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
        VStack(spacing: 16) {
            // Info card / GET MEAL PLAN
            if !userVM.user.isSetUp {
                Button("GET MEAL PLAN") {
                    showOnboarding = true
                }
                .buttonStyle(PrimaryButtonStyle())
                .padding(.horizontal)
                .onAppear {
                    print("user tidak ada")
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
                    print("user ada")
                    enableButton = false
                }
            }
            
            // Calories Intake
            HStack {
                Text("Calories Intake")
                    .bold()
                Spacer()
                // Uncomment when needed
                // Text("\(userVM.calculateTargetCalories(userData: userVM.user)) KCAL")
                //     .font(.caption)
                //     .foregroundStyle(Color(.systemGray2))
                //     .bold()
            }
            .padding(.horizontal)
            
            // Timeline
            List {
                TimelineRow(
                    onAddTapped: { showRecommendation = true },
                    isEnabled: enableButton,
                    mealType: .breakfast,
                    time: "8 AM"
                )
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
                
                TimelineRow(
                    onAddTapped: { showRecommendation = true },
                    isEnabled: enableButton,
                    mealType: .lunch,
                    time: "1 PM",
                    calorie: 300
                )
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
                
                TimelineRowFilled(
                    onAddTapped: { showRecommendation = true },
                    isEnabled: enableButton,
                    mealType: .dinner,
                    time: "5 PM"
                )
                
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
                
            }
            .listStyle(PlainListStyle())
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("defaultBackground"))
        .sheet(isPresented: $showRecommendation) {
            RecomendationView(mealType: .breakfast)
                .presentationDetents([.fraction(0.8)])
                .presentationCornerRadius(24)
        }
    }
}

// Keep your existing TimelineRow components unchanged
struct TimelineRow: View {
    var onAddTapped: () -> Void
    var isEnabled: Bool
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
                    Text("🍛")
                        .font(.largeTitle)
                        .foregroundStyle(Color(.systemGray2))
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("\(mealType.rawValue)")
                            .font(.caption)
                            .foregroundStyle(Color(.systemGray2))
                        if let calorie = calorie {
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

struct TimelineRowFilled: View {
    var onAddTapped: () -> Void
    var isEnabled: Bool
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
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text("\(mealType.rawValue)")
                            .font(.caption2)
                            .foregroundStyle(Color(.systemGray2))
                        Text("Nasi Goreng")
                            .bold()
                        HStack {
                            Image(systemName: "drop")
                            
                            Text("300g")
                                .padding(.leading, -4)
                            
                            Image(systemName: "leaf")
                            
                            Text("600g")
                                .padding(.leading, -4)
                            
                            Image(systemName: "bolt.heart")
                            
                            Text("500g")
                                .padding(.leading, -4)
                        }
                        .foregroundColor(Color(.systemGray2))
                        .font(.footnote)
                    }
                    Spacer()
                    
                    Text("800kcal")
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
    }
}

struct TimelineRowUniversal: View {
    var time: String
    var mealType: MealType
    var state: TimelineState
    var onAddTapped: () -> Void
    
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
            
            // Timeline Content
            VStack(alignment: .leading, spacing: 8) {
                Text(time)
                    .font(.caption)
                
                switch state {
                case .beforeSignIn:
                    HStack {
                        Text("🍛")
                            .font(.largeTitle)
                            .foregroundStyle(Color(.systemGray2))
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(mealType.rawValue.capitalized)
                                .font(.caption)
                                .foregroundStyle(Color(.systemGray2))
                            Text("-").bold()
                        }
                        Spacer()
                        Button(action: onAddTapped) {
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                        }
                    }
                    .eatsyCard()
                    
                case .afterSignIn(let calorie):
                    HStack {
                        Text("🍛")
                            .font(.largeTitle)
                            .foregroundStyle(Color(.systemGray2))
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(mealType.rawValue.capitalized)
                                .font(.caption)
                                .foregroundStyle(Color(.systemGray2))
                            if let c = calorie {
                                Text("~\(c)kcal").bold()
                            } else {
                                Text("-").bold()
                            }
                        }
                        Spacer()
                        Button(action: onAddTapped) {
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                        }
                    }
                    .eatsyCard()
                    
                case .filled(let meal):
                    FormatTimelineView(
                        time: "08:00", // bisa diganti sesuai jam meal yang sesuai
                        mealType: mealType,
                        meal: meal,
                        onAddTapped: {
                            // action kalau user mau add meal
                            print("Add tapped for \(meal.menuName)")
                        }
                    )
                    .eatsyCard()
                }
            }
        }
    }
}

#Preview {
    TodayView(
        showOnboarding: .constant(false),
        showButton: .constant(false),
        enableButton: .constant(false),
        showRecommendation: .constant(false),
        mealType: .breakfast
    )
    .environmentObject(UserViewModel())
}
