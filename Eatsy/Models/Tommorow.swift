//
//  Tommorow.swift
//  Eatsy
//
//  Created by Mac on 14/09/25.
//

import Foundation

struct TommorowMeal: Identifiable, Codable {
    let id: Int
    let meal_type: String
    let menu_name: String
    let portion_size: String
    let calories: Int
    let protein: Int
    let carbs: Int
    let fat: Int
    let description: String
    let tags: [String]
    let restrictions: [String]
}
