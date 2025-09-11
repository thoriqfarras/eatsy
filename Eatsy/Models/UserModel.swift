//
//  UserModel.swift
//  Eatsy
//
//  Created by Mac on 09/09/25.
//

import Foundation

enum Gender {
    case m // for male
    case f // for female
}

enum Goal {
    case lose
    case gain
    case maintain
}

enum DietRestriction: String, CaseIterable, Hashable {
    case noRestriction = "😋 No diet restriction"
    case lactoseIntolerant = "🥛 Lactose intolerant"
    case glutenFree = "🌾 Gluten-free"
    case DiaryFree = "🧀 Dairy-free"
    case Egg = "🥚 Egg allergy"
    
    // Tambah lainnya di sini
}

struct User: Identifiable {
    let id = UUID()
    let gender: Gender
    let goal: Goal
    let height: Int
    let weight: Int
    let age: Int
    let targetWeight: Int
    let dietRestrictions: DietRestriction?
}

enum PickerType {
    case height, weight, age
}
