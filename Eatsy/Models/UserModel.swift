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

//<<<<<<< Updated upstream
//enum DietRestriction: String, CaseIterable, Hashable {
//    case noRestriction = "😋 No diet restriction"
//=======
enum DietRestriction: String, CaseIterable, Hashable, Codable {
//>>>>>>> Stashed changes
    case lactoseIntolerant = "🥛 Lactose intolerant"
    case glutenFree = "🌾 Gluten-free"
    case DiaryFree = "🧀 Dairy-free"
    case Egg = "🥚 Egg allergy"
    
    // Tambah lainnya di sini
}


struct User: Identifiable, Codable {
    var id = UUID()
    var gender: Gender?
    var goal: Goal?
    var height: Int = 160
    var weight: Int = 60
    var age: Int = 21
    var targetWeight: Int = 75
    var dietRestrictions: Set<DietRestriction> = []
    var isSetUp: Bool = false
}

enum PickerType: Identifiable {
    case height, weight, age
    var id: Self { self }
}
