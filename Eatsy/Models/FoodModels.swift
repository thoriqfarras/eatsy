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

struct Food: Identifiable {
    var id = UUID()
    var name: String
    var imageName: String
    var calories: Int
    var nutritions: [NutritionInfo]
    var isSelected: Bool = false
}
