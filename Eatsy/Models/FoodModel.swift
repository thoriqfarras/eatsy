//
//  FoodModels.swift
//  Eatsy
//
//  Created by Mac on 11/09/25.
//

import SwiftUI

enum MealType:  String, Codable, Hashable, CaseIterable {
    case breakfast = "Breakfast"
    case lunch = "Lunch"
    case dinner = "Dinner"
}

// Codable struct to represent a single food item.
struct MealObject: Codable, Identifiable, Hashable {
    let id: Int
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
