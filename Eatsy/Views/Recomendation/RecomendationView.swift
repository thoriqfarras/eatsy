import SwiftUI

// RecomendationView.swift
struct RecomendationView: View {
    @StateObject private var viewModel = FoodViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Capsule()
                .fill(Color.gray.opacity(0.4))
                .frame(width: 52, height: 6)
                .padding(.vertical, 6)
            
            Text("Recommendation")
                .bold()
                .padding(6)
            
            HStack() {
                Label("Today", systemImage: "calendar")
                Label("Lunch", systemImage: "clock")
            }
            .font(.footnote)
            .bold()
            .foregroundColor(.gray)
            .padding(.bottom, 6)
            
            VStack(spacing: 12) {
//                ForEach(viewModel.foods.prefix(3)) { food in
//                    Button {
//                        viewModel.toggleSelection(for: food.id)
//                    } label: {
//                        FoodCardView(food: food)
//                    }
//                }
            }
            
            Button {
                dismiss()
            } label: {
                Text("Choose")
            }
            .buttonStyle(PrimaryButtonStyle())
//            .padding(.horizontal)
        }
//        .padding()
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
    RecomendationView()
}
