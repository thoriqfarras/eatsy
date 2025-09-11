import SwiftUI

struct TodayView: View {
    @Binding var showOnboarding: Bool
    @Binding var showButton: Bool
    
    @State private var showRecommendation = false
    
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
            if !showButton {
                HStack(spacing: 12) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("This is your starting line!")
                            .bold()
                            .font(.subheadline)
                        
                        Text("Small steps today, big changes ahead\nFirst progress visible by next week")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Image("daun")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white)
                        .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 2)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.green, lineWidth: 2)
                )
                .padding(.horizontal)
                .padding(.top, 8)
            } else {
                Button(action: {
                    showOnboarding = true
                }) {
                    Text("GET MEAL PLAN")
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.green)
                        )
                        .foregroundColor(.white)
                        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                }
                .padding(.horizontal)
                .padding(.top, 8)
            }
            
            // Calories Intake
            HStack {
                Text("Calories Intake")
                    .font(.headline)
                Spacer()
                Text("- KCAL")
                    .foregroundColor(.gray)
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
        .background(Color.white) // 👉 kasih putih bersih
        .background(Color(.systemGroupedBackground)) // biar gak blank
        .sheet(isPresented: $showRecommendation) {
            RecomendationView()
                .presentationDetents([.fraction(0.7)]) // 👉 langsung atur tinggi modal
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
                    .foregroundColor(.gray)
                
                HStack(spacing: 12) {
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(Color.gray.opacity(0.3), lineWidth: 1)
                        .frame(width: 60, height: 60)
                        .overlay(
                            Image(systemName: "photo")
                                .foregroundColor(.gray)
                        )
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Breakfast")
                            .font(.headline)
                        Text("-")
                            .foregroundColor(.gray)
                            .font(.subheadline)
                    }
                    Spacer()
                    
                    Button(action: {
                        onAddTapped()
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 2)
            }
        }
    }
}

#Preview {
    NavigationStack {
        TodayView(showOnboarding: .constant(false), showButton: .constant(false))
    }
}
