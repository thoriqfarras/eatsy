//
//  UserModel.swift
//  Eatsy
//
//  Created by Mac on 09/09/25.
//

import Foundation

enum Gender: Codable {
    case m // for male
    case f // for female
}

enum Goal: Codable {
    case lose
    case gain
    case maintain
    
    var title: String {
            switch self {
            case .lose: return "Lose Weight"
            case .maintain: return "Maintain Weight"
            case .gain: return "Gain Weight"
            }
        }
        
        var emoji: String {
            switch self {
            case .lose: return "🥗"
            case .maintain: return "🍽️"
            case .gain: return "🍗"
            }
        }
}

enum DietRestriction: String, CaseIterable, Hashable, Codable {
    case lactoseIntolerant = "🥛 Lactose intolerant"
    case glutenFree = "🌾 Gluten-free"
    case dairyFree = "🧀 Dairy-free"
    case eggAllergy = "🥚 Egg allergy"
}

struct SelectedMeals: Codable, Hashable {
    var breakfast: MealObject?
    var lunch: MealObject?
    var dinner: MealObject?
}



struct User: Identifiable, Codable {
    var id = UUID()
    var gender: Gender?
    var goal: Goal?
    var height: Int?
    var weight: Int?
    var age: Int?
    
    var targetWeight: Int?
    var dietRestrictions: Set<DietRestriction> = []
    var isSetUp: Bool = false
    
    var dailyTargetCalories: Int = 0
    var targetDate: Date?
    
    var selectedMealsForToday: SelectedMeals = SelectedMeals()
}


enum PickerType: Identifiable {
    case height, weight, age, targetWeight
    var id: Self { self }
}
