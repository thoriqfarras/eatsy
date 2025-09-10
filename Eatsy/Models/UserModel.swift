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

enum DietRestriction {
    case lactoreIntolerant
    case glutenFree
    // ...TODO
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
