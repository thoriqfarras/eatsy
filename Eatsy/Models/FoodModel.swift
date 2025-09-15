//
//  FoodModels.swift
//  Eatsy
//
//  Created by Mac on 11/09/25.
//

import SwiftUI

struct NutritionInfo: Identifiable {
    var id = UUID()
    var icon: String
    var text: String
    var color: Color
}

struct Meal: Identifiable {
    var id = UUID()
    var name: String
    var imageName: String
    var calories: Int
    var nutritions: [NutritionInfo]
    var isSelected: Bool = false
}

// Codable struct to represent a single food item.
//struct Meal: Codable, Identifiable {
//    let id: Int
//    let mealType: MealType
//    let menuName: String
//    let portionSizeGram: Int
//    let calories: Int
//    let protein: Int
//    let carbs: Int
//    let fat: Int
//    let description: String
//    var imageName: String = ""
//    let restrictions: [DietRestriction]
//}
