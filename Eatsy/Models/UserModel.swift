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

enum PickerType: Identifiable {
    case height, weight, age
    var id: Self { self }
}
