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

    private let minimizedHeight: CGFloat = 80

    var body: some View {
        ZStack {
            // Background
            Color(.systemGroupedBackground)
                .ignoresSafeArea()

            VStack {
                Spacer()

                ZStack(alignment: .top) {
                    Color.white
                        .frame(maxWidth: .infinity)
                        .cornerRadius(24, corners: [.topLeft, .topRight])
                        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: -4)

                    VStack(spacing: 20) {
                        Capsule()
                            .fill(Color.gray.opacity(0.4))
                            .frame(width: 40, height: 5)
                            .padding(.top, 8)
                        
                        VStack(spacing: 20) {
                            Text("Recommendation")
                                .font(.title2)
                                .fontWeight(.bold)
                                .opacity(isExpanded ? 1 : 0)

                            HStack(spacing: 10) {
                                Label("Today", systemImage: "calendar")
                                Label("Lunch", systemImage: "clock")
                            }
                            .font(.headline)
                            .foregroundColor(.gray)
                            .opacity(isExpanded ? 1 : 0)

                            ScrollView(.vertical, showsIndicators: false) {
                                VStack(spacing: 16) {
                                    ForEach(viewModel.foods) { food in
                                        Button {
                                            viewModel.toggleSelection(for: food.id)
                                        } label: {
                                            FoodCardView(food: food)
                                                .buttonStyle(.plain)
                                                .scaleEffect(food.isSelected ? 1.05 : 1.0)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 16)
                                                        .stroke(food.isSelected ? Color.green : Color.clear, lineWidth: 3)
                                                )
                                                .animation(.spring(), value: food.isSelected)
                                        }
                                    }
                                }
                                .padding(.horizontal)
                                .padding(.top, 8)
                            }
                            .opacity(isExpanded ? 1 : 0)

                            Button {
                                print("Tombol Choose ditekan!")
                            } label: {
                                Text("Choose")
                                    .font(.headline)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.green)
                                    .cornerRadius(12)
                            }
                            .padding(.horizontal)
                            .padding(.top, 12)
                            .opacity(isExpanded ? 1 : 0)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, isExpanded ? 20 : 0)
                }
                .frame(maxHeight: isExpanded ? UIScreen.main.bounds.height * 0.55 : minimizedHeight)
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
