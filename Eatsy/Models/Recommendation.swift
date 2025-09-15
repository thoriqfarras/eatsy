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
    var meals: [MealObject]
}
