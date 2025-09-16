//
//  Recommendation.swift
//  Eatsy
//
//  Created by Mac on 15/09/25.
//

import Foundation

struct Recommendation: Identifiable {
    var id = UUID()
    var date: Date
    var breakfasts: [MealObject] = []
    var lunches: [MealObject] = []
    var dinners: [MealObject] = []
    var avgBreakfastsCalorie: Int = 0
    var avgLunchesCalorie: Int = 0
    var avgDinnerLCalorie: Int = 0
}
