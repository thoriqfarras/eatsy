//
//  MealsDTO.swift
//  Eatsy
//
//  Created by Mac on 11/09/25.
//

import Foundation

struct MealsRootDTO: Codable {
    let days: [DayDTO]
}

struct DayDTO: Codable {
    let title: String
    let sections: SectionsDTO
}

struct SectionsDTO: Codable {
    let breakfast: [MealItem]?
    let lunch:     [MealItem]?
    let dinner:    [MealItem]?
}
