//
//  FoodViewModel.swift
//  Recomendation
//
//
//  FoodViewModel.swift
//  Eatsy
//
//  Created by Mac on 11/09/25.
//


import SwiftUI
import Foundation

class FoodViewModel: ObservableObject {
    @Published var foods: [Meal] = [
        Meal(
            name: "Nasi Goreng",
            imageName: "nasgor",
            calories: 800,
            nutritions: [
                NutritionInfo(icon: "drop", text: "5g Fat", color: .blue),
                NutritionInfo(icon: "leaf", text: "20g Carbs", color: .green),
                NutritionInfo(icon: "bolt.heart", text: "50g Protein", color: .red)
            ]
        ),
        Meal(
            name: "Belum ada data",
            imageName: "piring",
            calories: 150,
            nutritions: [
                NutritionInfo(icon: "drop", text: "15g Fat", color: .red),
                NutritionInfo(icon: "leaf", text: "5g Carbs", color: .green),
                NutritionInfo(icon: "bolt.heart", text: "50g Protein", color: .red)
            ]
        ),
        Meal(
            name: "Belum ada data",
            imageName: "piring",
            calories: 800,
            nutritions: [
                NutritionInfo(icon: "drop", text: "12g Fat", color: .green),
                NutritionInfo(icon: "leaf", text: "2g Carbs", color: .blue),
                NutritionInfo(icon: "bolt.heart", text: "50g Protein", color: .red)
            ]
        )
    ]

    func toggleSelection(for foodId: UUID) {
        if let index = foods.firstIndex(where: { $0.id == foodId }) {
            for i in foods.indices {
                foods[i].isSelected = false
            }
            foods[index].isSelected.toggle()
        }
    }
    
    func 
}
