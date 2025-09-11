//
//  RecomendationView.swift
//  Eatsy
//
//  Created by Mac on 11/09/25.
//

import Foundation
import SwiftUI

struct RecomendationView: View {
    @StateObject private var viewModel = FoodViewModel()
    @State private var isExpanded: Bool = true
    @State private var dragAmount: CGSize = .zero
    @Environment(\.dismiss) var dismiss   // 👉 buat nutup sheet/modal
    
    private let minimizedHeight: CGFloat = 1000
    
    var body: some View {
        ZStack {
            // Background
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                //buat ala ala sheet
                ZStack(alignment: .top) {
                    Color.white
                        .frame(maxWidth: .infinity)
                        .cornerRadius(24, corners: [.topLeft, .topRight])
                        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: -4)
                    
                    VStack(spacing: 20) {
                        Capsule()
                            .fill(Color.gray.opacity(0.4))
                            .frame(width: 52, height: 6)
                        
                        VStack() {
                            Text("Recommendation")
                                .bold()
                                .padding(.bottom, 4)
                            
                            HStack(spacing: 8) {
                                Label("Today", systemImage: "calendar")
                                Label("Lunch", systemImage: "clock")
                            }
                            .font(.footnote)
                            .bold()
                            .foregroundColor(Color(.systemGray2))
                            .padding(.bottom, 8)
                            
                            // Ganti ScrollView dengan VStack biasa
                            VStack() {
                                ForEach(viewModel.foods) { food in
                                    Button {
                                        viewModel.toggleSelection(for: food.id)
                                    } label: {
                                        FoodCardView(food: food)
                                    }
                                }
                            }
    
                            
                            Button {
                                print("Tombol Choose ditekan!")
                                dismiss()   // 👉 nutup modal dan balik ke TodayView
                            } label: {
                                Text("Choose")
                            }
                            .buttonStyle(PrimaryButtonStyle())
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, isExpanded ? 20 : 0)
                }
                .frame(maxHeight: isExpanded ? UIScreen.main.bounds.height * 0.6 : minimizedHeight)
                .frame(maxWidth: .infinity)
                .offset(y: dragAmount.height)
                .animation(.interactiveSpring(), value: dragAmount)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            dragAmount.height = value.translation.height
                        }
                        .onEnded { value in
                            if value.translation.height > 100 {
                                isExpanded = false
                            } else if value.translation.height < -100 {
                                isExpanded = true
                            }
                            dragAmount = .zero
                        }
                )
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
    RecomendationView()
}
