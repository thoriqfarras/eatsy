import SwiftUI

struct TodayView: View {
    @Binding var showOnboarding: Bool
    @Binding var showButton: Bool
    
    @State private var showRecommendation = false
    @StateObject private var userVM = UserViewModel()
    
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
            
            // Info card / Button
            if !userVM.user.isSetUp  {
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
            } else {
                Button("GET MEAL PLAN") {
                    showOnboarding = true
                }
                .buttonStyle(PrimaryButtonStyle())
            }
            
            // Calories Intake
            HStack {
                Text("Calories Intake")
                    .bold()
                Spacer()
                Text("\(userVM.calculateTargetCalories(userData: userVM.user)) KCAL") // 👉 tampilkan hasil
                                    .font(.caption)
                                    .foregroundStyle(Color(.systemGray2)).bold()
            }
            .padding(.horizontal)
            
            // Timeline
            List {
                ForEach(0..<3, id: \.self) { _ in
                    TimelineRow {
                        showRecommendation = true
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear) // 👉 biar nyatu
                }
            }
            .listStyle(PlainListStyle())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) // isi penuh layar
        .background(Color("defaultBackground")) // 👉 kasih putih bersih
        .background(Color(.systemGroupedBackground)) // biar gak blank
        .sheet(isPresented: $showRecommendation) {
            RecomendationView()
                .presentationDetents([.fraction(0.8)]) // 👉 langsung atur tinggi modal
                .presentationCornerRadius(24)          // sudut rounded bawaan iOS 16+
        }

    }
}

struct TimelineRow: View {
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
            
            // Meal Card
            VStack(alignment: .leading, spacing: 8) {
                Text("8 AM")
                    .font(.caption)
                
                HStack() {
                    Text("🍳")
                        .font(.largeTitle)
                        .foregroundStyle(Color(.systemGray2))
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Breakfast")
                            .font(.caption)
                            .foregroundStyle(Color(.systemGray2))
                        Text("-")
                            .bold()
                    }
                    Spacer()
                    
                    Button(action: {
                        onAddTapped()
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                    }
                }
                .eatsyCard()
            }
        }
    }
}

#Preview {
    NavigationStack {
        TodayView(showOnboarding: .constant(false), showButton: .constant(false))
    }
}
