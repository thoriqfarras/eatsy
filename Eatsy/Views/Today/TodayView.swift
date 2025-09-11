import SwiftUI

struct TodayView: View {
    @Binding var showOnboarding:Bool // anak
    @Binding var showButton:Bool
    
    var body: some View {
        VStack(spacing: 16) {
            // Title & Profile
            HStack {
                Text("Today's Meal Plan")
                    .font(.title)
                    .bold()
                
                Spacer()
                
                NavigationLink {
                    ProfileView() // nanti arahkan ke view profil
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
            
            if !showButton {
                VStack{
                    HStack(spacing: 12) {
                        VStack(alignment: .leading){
                            Text("This is your starting line!").bold()
                            Text("Small steps today, big changes ahead\nFirst progress visible by next week").font(.caption).fontWeight(.light)
                        }
                        Spacer()
                        Image(systemName: "photo")
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 2)

                }
                
            } else {
                Button(action: {
                    showOnboarding = true   // ganti halaman
                }) {
                    Text("GET MEAL PLAN")
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.horizontal)
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
                VStack(spacing: 32) {
                    ForEach(0..<3) { _ in
                        TimelineRow()
                    }
                }
                .padding(.horizontal)
                .padding(.top, 8)
            }
            .listStyle(PlainListStyle())
        }
    }
}

struct TimelineRow: View {
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
                    
                    Button(action:{
                        
                    }){
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

