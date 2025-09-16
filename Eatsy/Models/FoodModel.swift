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

enum MealType:  String, Codable, Hashable {
    case breakfast = "Breakfast"
    case lunch = "Lunch"
    case dinner = "Dinner"
}

// Codable struct to represent a single food item.
struct MealObject: Codable, Identifiable, Hashable {
    var id: Int
    let mealType: MealType
    let menuName: String
    let calories: Int
    let protein: Int
    let carbs: Int
    let fat: Int
    var imageName: String = ""
    let restrictions: [DietRestriction]
    var isSelected: Bool
}
