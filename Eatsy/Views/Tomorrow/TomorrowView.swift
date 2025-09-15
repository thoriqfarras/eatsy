import SwiftUI

struct TomorrowView: View {
    @StateObject private var vm = TomorrowViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {
                
                // Header
                HStack {
                    Text("Tomorrow Meal's Plan")
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
                
                // List of meals
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        
                        // Breakfast
                        Text("🍳 Breakfast")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        ForEach(vm.recommendations(for: "breakfast")) { meal in
                            TomorrowMealRow(item: meal)
                                .padding(.horizontal)
                        }
                        
                        // Lunch
                        Text("🍲 Lunch")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        ForEach(vm.recommendations(for: "lunch")) { meal in
                            TomorrowMealRow(item: meal)
                                .padding(.horizontal)
                        }
                        
                        // Dinner
                        Text("🍽 Dinner")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        ForEach(vm.recommendations(for: "dinner")) { meal in
                            TomorrowMealRow(item: meal)
                                .padding(.horizontal)
                        }
                    }
                    .padding(.vertical)
                }
            }
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}

struct TomorrowMealRow: View {
    let item: TomorrowMeal
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text(item.menu_name)
                    .font(.headline)
                Spacer()
                Text("\(item.calories) kcal")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            
            Text(item.description)
                .font(.caption)
                .foregroundStyle(.secondary)
            
            HStack {
                Text("Protein: \(item.protein) g")
                Text("Carbs: \(item.carbs) g")
                Text("Fat: \(item.fat) g")
            }
            .font(.caption2)
            .foregroundStyle(.secondary)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
        )
    }
}

#Preview {
    TomorrowView()
}
