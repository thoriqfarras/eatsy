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
    case noRestriction = "😋 No diet restriction"
    case Lactose = "🥛 Lactose intolerant"
    case Gluten = "🌾 Gluten-free"
    case Diary = "🧀 Dairy-free"
    case Egg = "🥚 Egg allergy"
    case Shellfish = "🦐 Shellfish allergy"
    
}


struct User: Identifiable, Codable {
    var id = UUID()
    var gender: Gender?
    var goal: Goal?
    var height: Int?
    var weight: Int?
    var age: Int?
    
    var targetWeight: Int? = nil
    var dietRestrictions: Set<DietRestriction> = []
    var isSetUp: Bool = false
}


enum PickerType: Identifiable {
    case height, weight, age
    var id: Self { self }
}
