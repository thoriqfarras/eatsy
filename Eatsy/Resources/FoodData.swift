//
//  FoodData.swift
//  Eatsy
//
//  Created by Mac on 14/09/25.
//

import Foundation

struct MealNew: Codable, Identifiable {
    let id: Int
    let mealType: MealType
    let menuName: String
    let portionSizeGram: Int
    let calories: Int
    let protein: Int
    let carbs: Int
    let fat: Int
    let description: String
    var imageName: String = ""
    let restrictions: [DietRestriction]
}

// Enum for meal types, making it easier to filter.
enum MealType: String, CaseIterable, Codable {
    case breakfast
    case lunch
    case dinner
}

// A helper struct to hold the data, separated by meal type
struct FoodData {
    static let breakfast: [MealNew] = [
        MealNew(id: 1, mealType: .breakfast, menuName: "Omelet Sayur", portionSizeGram: 250, calories: 300, protein: 10, carbs: 30, fat: 8, description: "Omelet Sayur dengan bahan segar dan bumbu khas.", restrictions: [.lactoseIntolerant]),
        MealNew(id: 2, mealType: .breakfast, menuName: "Nasi Uduk", portionSizeGram: 300, calories: 305, protein: 11, carbs: 31, fat: 9, description: "Nasi Uduk dengan bahan segar dan bumbu khas.", restrictions: [.glutenFree, .dairyFree]),
        MealNew(id: 3, mealType: .breakfast, menuName: "Bubur Ayam", portionSizeGram: 350, calories: 310, protein: 12, carbs: 32, fat: 10, description: "Bubur Ayam dengan bahan segar dan bumbu khas.", restrictions: [.dairyFree, .eggAllergy, .lactoseIntolerant]),
        MealNew(id: 4, mealType: .breakfast, menuName: "Oatmeal Buah", portionSizeGram: 400, calories: 315, protein: 13, carbs: 33, fat: 11, description: "Oatmeal Buah dengan bahan segar dan bumbu khas.", restrictions: [.eggAllergy]),
        MealNew(id: 5, mealType: .breakfast, menuName: "Roti Bakar Selai", portionSizeGram: 450, calories: 320, protein: 14, carbs: 34, fat: 12, description: "Roti Bakar Selai dengan bahan segar dan bumbu khas.", restrictions: [.lactoseIntolerant, .glutenFree]),
        MealNew(id: 6, mealType: .breakfast, menuName: "Smoothie Pisang", portionSizeGram: 250, calories: 325, protein: 15, carbs: 35, fat: 13, description: "Smoothie Pisang dengan bahan segar dan bumbu khas.", restrictions: [.glutenFree, .dairyFree, .eggAllergy]),
        MealNew(id: 7, mealType: .breakfast, menuName: "Pancake Madu", portionSizeGram: 300, calories: 330, protein: 16, carbs: 36, fat: 14, description: "Pancake Madu dengan bahan segar dan bumbu khas.", restrictions: [.dairyFree]),
        MealNew(id: 8, mealType: .breakfast, menuName: "Telur Rebus", portionSizeGram: 350, calories: 335, protein: 17, carbs: 37, fat: 15, description: "Telur Rebus dengan bahan segar dan bumbu khas.", restrictions: [.eggAllergy, .lactoseIntolerant]),
        MealNew(id: 9, mealType: .breakfast, menuName: "Sereal Susu", portionSizeGram: 400, calories: 340, protein: 18, carbs: 38, fat: 16, description: "Sereal Susu dengan bahan segar dan bumbu khas.", restrictions: [.lactoseIntolerant, .glutenFree, .dairyFree]),
        MealNew(id: 10, mealType: .breakfast, menuName: "Lontong Sayur", portionSizeGram: 450, calories: 345, protein: 19, carbs: 39, fat: 17, description: "Lontong Sayur dengan bahan segar dan bumbu khas.", restrictions: [.glutenFree]),
        MealNew(id: 11, mealType: .breakfast, menuName: "Omelet Sayur", portionSizeGram: 250, calories: 350, protein: 20, carbs: 40, fat: 18, description: "Omelet Sayur dengan bahan segar dan bumbu khas.", restrictions: [.dairyFree, .eggAllergy]),
        MealNew(id: 12, mealType: .breakfast, menuName: "Nasi Uduk", portionSizeGram: 300, calories: 355, protein: 21, carbs: 41, fat: 19, description: "Nasi Uduk dengan bahan segar dan bumbu khas.", restrictions: [.eggAllergy, .lactoseIntolerant, .glutenFree]),
        MealNew(id: 13, mealType: .breakfast, menuName: "Bubur Ayam", portionSizeGram: 350, calories: 360, protein: 22, carbs: 42, fat: 20, description: "Bubur Ayam dengan bahan segar dan bumbu khas.", restrictions: [.lactoseIntolerant]),
        MealNew(id: 14, mealType: .breakfast, menuName: "Oatmeal Buah", portionSizeGram: 400, calories: 365, protein: 23, carbs: 43, fat: 21, description: "Oatmeal Buah dengan bahan segar dan bumbu khas.", restrictions: [.glutenFree, .dairyFree]),
        MealNew(id: 15, mealType: .breakfast, menuName: "Roti Bakar Selai", portionSizeGram: 450, calories: 370, protein: 24, carbs: 44, fat: 22, description: "Roti Bakar Selai dengan bahan segar dan bumbu khas.", restrictions: [.dairyFree, .eggAllergy, .lactoseIntolerant]),
        MealNew(id: 16, mealType: .breakfast, menuName: "Smoothie Pisang", portionSizeGram: 250, calories: 375, protein: 25, carbs: 45, fat: 8, description: "Smoothie Pisang dengan bahan segar dan bumbu khas.", restrictions: [.eggAllergy]),
        MealNew(id: 17, mealType: .breakfast, menuName: "Pancake Madu", portionSizeGram: 300, calories: 380, protein: 26, carbs: 46, fat: 9, description: "Pancake Madu dengan bahan segar dan bumbu khas.", restrictions: [.lactoseIntolerant, .glutenFree]),
        MealNew(id: 18, mealType: .breakfast, menuName: "Telur Rebus", portionSizeGram: 350, calories: 385, protein: 27, carbs: 47, fat: 10, description: "Telur Rebus dengan bahan segar dan bumbu khas.", restrictions: [.glutenFree, .dairyFree, .eggAllergy]),
        MealNew(id: 19, mealType: .breakfast, menuName: "Sereal Susu", portionSizeGram: 400, calories: 390, protein: 28, carbs: 48, fat: 11, description: "Sereal Susu dengan bahan segar dan bumbu khas.", restrictions: [.dairyFree]),
        MealNew(id: 20, mealType: .breakfast, menuName: "Lontong Sayur", portionSizeGram: 450, calories: 395, protein: 29, carbs: 49, fat: 12, description: "Lontong Sayur dengan bahan segar dan bumbu khas.", restrictions: [.eggAllergy, .lactoseIntolerant]),
        MealNew(id: 21, mealType: .breakfast, menuName: "Omelet Sayur", portionSizeGram: 250, calories: 400, protein: 10, carbs: 50, fat: 13, description: "Omelet Sayur dengan bahan segar dan bumbu khas.", restrictions: [.lactoseIntolerant, .glutenFree, .dairyFree]),
        MealNew(id: 22, mealType: .breakfast, menuName: "Nasi Uduk", portionSizeGram: 300, calories: 405, protein: 11, carbs: 51, fat: 14, description: "Nasi Uduk dengan bahan segar dan bumbu khas.", restrictions: [.glutenFree]),
        MealNew(id: 23, mealType: .breakfast, menuName: "Bubur Ayam", portionSizeGram: 350, calories: 410, protein: 12, carbs: 52, fat: 15, description: "Bubur Ayam dengan bahan segar dan bumbu khas.", restrictions: [.dairyFree, .eggAllergy]),
        MealNew(id: 24, mealType: .breakfast, menuName: "Oatmeal Buah", portionSizeGram: 400, calories: 415, protein: 13, carbs: 53, fat: 16, description: "Oatmeal Buah dengan bahan segar dan bumbu khas.", restrictions: [.eggAllergy, .lactoseIntolerant, .glutenFree]),
        MealNew(id: 25, mealType: .breakfast, menuName: "Roti Bakar Selai", portionSizeGram: 450, calories: 420, protein: 14, carbs: 54, fat: 17, description: "Roti Bakar Selai dengan bahan segar dan bumbu khas.", restrictions: [.lactoseIntolerant]),
        MealNew(id: 26, mealType: .breakfast, menuName: "Smoothie Pisang", portionSizeGram: 250, calories: 425, protein: 15, carbs: 55, fat: 18, description: "Smoothie Pisang dengan bahan segar dan bumbu khas.", restrictions: [.glutenFree, .dairyFree]),
        MealNew(id: 27, mealType: .breakfast, menuName: "Pancake Madu", portionSizeGram: 300, calories: 430, protein: 16, carbs: 56, fat: 19, description: "Pancake Madu dengan bahan segar dan bumbu khas.", restrictions: [.dairyFree, .eggAllergy, .lactoseIntolerant]),
        MealNew(id: 28, mealType: .breakfast, menuName: "Telur Rebus", portionSizeGram: 350, calories: 435, protein: 17, carbs: 57, fat: 20, description: "Telur Rebus dengan bahan segar dan bumbu khas.", restrictions: [.eggAllergy]),
        MealNew(id: 29, mealType: .breakfast, menuName: "Sereal Susu", portionSizeGram: 400, calories: 440, protein: 18, carbs: 58, fat: 21, description: "Sereal Susu dengan bahan segar dan bumbu khas.", restrictions: [.lactoseIntolerant, .glutenFree]),
        MealNew(id: 30, mealType: .breakfast, menuName: "Lontong Sayur", portionSizeGram: 450, calories: 445, protein: 19, carbs: 59, fat: 22, description: "Lontong Sayur dengan bahan segar dan bumbu khas.", restrictions: [.glutenFree, .dairyFree, .eggAllergy]),
        MealNew(id: 31, mealType: .breakfast, menuName: "Omelet Sayur", portionSizeGram: 250, calories: 450, protein: 20, carbs: 60, fat: 8, description: "Omelet Sayur dengan bahan segar dan bumbu khas.", restrictions: [.dairyFree]),
        MealNew(id: 32, mealType: .breakfast, menuName: "Nasi Uduk", portionSizeGram: 300, calories: 455, protein: 21, carbs: 61, fat: 9, description: "Nasi Uduk dengan bahan segar dan bumbu khas.", restrictions: [.eggAllergy, .lactoseIntolerant]),
        MealNew(id: 33, mealType: .breakfast, menuName: "Bubur Ayam", portionSizeGram: 350, calories: 460, protein: 22, carbs: 62, fat: 10, description: "Bubur Ayam dengan bahan segar dan bumbu khas.", restrictions: [.lactoseIntolerant, .glutenFree, .dairyFree]),
        MealNew(id: 34, mealType: .breakfast, menuName: "Oatmeal Buah", portionSizeGram: 400, calories: 465, protein: 23, carbs: 63, fat: 11, description: "Oatmeal Buah dengan bahan segar dan bumbu khas.", restrictions: [.glutenFree]),
        MealNew(id: 35, mealType: .breakfast, menuName: "Roti Bakar Selai", portionSizeGram: 450, calories: 470, protein: 24, carbs: 64, fat: 12, description: "Roti Bakar Selai dengan bahan segar dan bumbu khas.", restrictions: [.dairyFree, .eggAllergy]),
        MealNew(id: 36, mealType: .breakfast, menuName: "Smoothie Pisang", portionSizeGram: 250, calories: 475, protein: 25, carbs: 65, fat: 13, description: "Smoothie Pisang dengan bahan segar dan bumbu khas.", restrictions: [.eggAllergy, .lactoseIntolerant, .glutenFree]),
        MealNew(id: 37, mealType: .breakfast, menuName: "Pancake Madu", portionSizeGram: 300, calories: 480, protein: 26, carbs: 66, fat: 14, description: "Pancake Madu dengan bahan segar dan bumbu khas.", restrictions: [.lactoseIntolerant]),
        MealNew(id: 38, mealType: .breakfast, menuName: "Telur Rebus", portionSizeGram: 350, calories: 485, protein: 27, carbs: 67, fat: 15, description: "Telur Rebus dengan bahan segar dan bumbu khas.", restrictions: [.glutenFree, .dairyFree]),
        MealNew(id: 39, mealType: .breakfast, menuName: "Sereal Susu", portionSizeGram: 400, calories: 490, protein: 28, carbs: 68, fat: 16, description: "Sereal Susu dengan bahan segar dan bumbu khas.", restrictions: [.dairyFree, .eggAllergy, .lactoseIntolerant]),
        MealNew(id: 40, mealType: .breakfast, menuName: "Lontong Sayur", portionSizeGram: 450, calories: 495, protein: 29, carbs: 69, fat: 17, description: "Lontong Sayur dengan bahan segar dan bumbu khas.", restrictions: [.eggAllergy]),
        MealNew(id: 41, mealType: .breakfast, menuName: "Omelet Sayur", portionSizeGram: 250, calories: 500, protein: 10, carbs: 70, fat: 18, description: "Omelet Sayur dengan bahan segar dan bumbu khas.", restrictions: [.lactoseIntolerant, .glutenFree]),
        MealNew(id: 42, mealType: .breakfast, menuName: "Nasi Uduk", portionSizeGram: 300, calories: 505, protein: 11, carbs: 71, fat: 19, description: "Nasi Uduk dengan bahan segar dan bumbu khas.", restrictions: [.glutenFree, .dairyFree, .eggAllergy]),
        MealNew(id: 43, mealType: .breakfast, menuName: "Bubur Ayam", portionSizeGram: 350, calories: 510, protein: 12, carbs: 72, fat: 20, description: "Bubur Ayam dengan bahan segar dan bumbu khas.", restrictions: [.dairyFree]),
        MealNew(id: 44, mealType: .breakfast, menuName: "Oatmeal Buah", portionSizeGram: 400, calories: 515, protein: 13, carbs: 73, fat: 21, description: "Oatmeal Buah dengan bahan segar dan bumbu khas.", restrictions: [.eggAllergy, .lactoseIntolerant]),
        MealNew(id: 45, mealType: .breakfast, menuName: "Roti Bakar Selai", portionSizeGram: 450, calories: 520, protein: 14, carbs: 74, fat: 22, description: "Roti Bakar Selai dengan bahan segar dan bumbu khas.", restrictions: [.lactoseIntolerant, .glutenFree, .dairyFree]),
        MealNew(id: 46, mealType: .breakfast, menuName: "Smoothie Pisang", portionSizeGram: 250, calories: 525, protein: 15, carbs: 75, fat: 8, description: "Smoothie Pisang dengan bahan segar dan bumbu khas.", restrictions: [.glutenFree]),
        MealNew(id: 47, mealType: .breakfast, menuName: "Pancake Madu", portionSizeGram: 300, calories: 530, protein: 16, carbs: 76, fat: 9, description: "Pancake Madu dengan bahan segar dan bumbu khas.", restrictions: [.dairyFree, .eggAllergy]),
        MealNew(id: 48, mealType: .breakfast, menuName: "Telur Rebus", portionSizeGram: 350, calories: 535, protein: 17, carbs: 77, fat: 10, description: "Telur Rebus dengan bahan segar dan bumbu khas.", restrictions: [.eggAllergy, .lactoseIntolerant, .glutenFree]),
        MealNew(id: 49, mealType: .breakfast, menuName: "Sereal Susu", portionSizeGram: 400, calories: 540, protein: 18, carbs: 78, fat: 11, description: "Sereal Susu dengan bahan segar dan bumbu khas.", restrictions: [.lactoseIntolerant]),
        MealNew(id: 50, mealType: .breakfast, menuName: "Lontong Sayur", portionSizeGram: 450, calories: 545, protein: 19, carbs: 79, fat: 12, description: "Lontong Sayur dengan bahan segar dan bumbu khas.", restrictions: [.glutenFree, .dairyFree])
    ]
    
    static let lunch: [MealNew] = [
        MealNew(id: 51, mealType: .lunch, menuName: "Nasi Goreng Ayam", portionSizeGram: 250, calories: 300, protein: 10, carbs: 30, fat: 8, description: "Nasi Goreng Ayam dengan bahan segar dan bumbu khas.", restrictions: [.lactoseIntolerant]),
        MealNew(id: 52, mealType: .lunch, menuName: "Soto Ayam", portionSizeGram: 300, calories: 305, protein: 11, carbs: 31, fat: 9, description: "Soto Ayam dengan bahan segar dan bumbu khas.", restrictions: [.glutenFree, .dairyFree]),
        MealNew(id: 53, mealType: .lunch, menuName: "Gado-Gado", portionSizeGram: 350, calories: 310, protein: 12, carbs: 32, fat: 10, description: "Gado-Gado dengan bahan segar dan bumbu khas.", restrictions: [.dairyFree, .eggAllergy, .lactoseIntolerant]),
        MealNew(id: 54, mealType: .lunch, menuName: "Ayam Bakar", portionSizeGram: 400, calories: 315, protein: 13, carbs: 33, fat: 11, description: "Ayam Bakar dengan bahan segar dan bumbu khas.", restrictions: [.eggAllergy]),
        MealNew(id: 55, mealType: .lunch, menuName: "Pecel Lele", portionSizeGram: 450, calories: 320, protein: 14, carbs: 34, fat: 12, description: "Pecel Lele dengan bahan segar dan bumbu khas.", restrictions: [.lactoseIntolerant, .glutenFree]),
        MealNew(id: 56, mealType: .lunch, menuName: "Rawon", portionSizeGram: 250, calories: 325, protein: 15, carbs: 35, fat: 13, description: "Rawon dengan bahan segar dan bumbu khas.", restrictions: [.glutenFree, .dairyFree, .eggAllergy]),
        MealNew(id: 57, mealType: .lunch, menuName: "Bakso", portionSizeGram: 300, calories: 330, protein: 16, carbs: 36, fat: 14, description: "Bakso dengan bahan segar dan bumbu khas.", restrictions: [.dairyFree]),
        MealNew(id: 58, mealType: .lunch, menuName: "Rendang", portionSizeGram: 350, calories: 335, protein: 17, carbs: 37, fat: 15, description: "Rendang dengan bahan segar dan bumbu khas.", restrictions: [.eggAllergy, .lactoseIntolerant]),
        MealNew(id: 59, mealType: .lunch, menuName: "Nasi Padang", portionSizeGram: 400, calories: 340, protein: 18, carbs: 38, fat: 16, description: "Nasi Padang dengan bahan segar dan bumbu khas.", restrictions: [.lactoseIntolerant, .glutenFree, .dairyFree]),
        MealNew(id: 60, mealType: .lunch, menuName: "Capcay Kuah", portionSizeGram: 450, calories: 345, protein: 19, carbs: 39, fat: 17, description: "Capcay Kuah dengan bahan segar dan bumbu khas.", restrictions: [.glutenFree]),
        MealNew(id: 61, mealType: .lunch, menuName: "Nasi Goreng Ayam", portionSizeGram: 250, calories: 350, protein: 20, carbs: 40, fat: 18, description: "Nasi Goreng Ayam dengan bahan segar dan bumbu khas.", restrictions: [.dairyFree, .eggAllergy]),
        MealNew(id: 62, mealType: .lunch, menuName: "Soto Ayam", portionSizeGram: 300, calories: 355, protein: 21, carbs: 41, fat: 19, description: "Soto Ayam dengan bahan segar dan bumbu khas.", restrictions: [.eggAllergy, .lactoseIntolerant, .glutenFree]),
        MealNew(id: 63, mealType: .lunch, menuName: "Gado-Gado", portionSizeGram: 350, calories: 360, protein: 22, carbs: 42, fat: 20, description: "Gado-Gado dengan bahan segar dan bumbu khas.", restrictions: [.lactoseIntolerant]),
        MealNew(id: 64, mealType: .lunch, menuName: "Ayam Bakar", portionSizeGram: 400, calories: 365, protein: 23, carbs: 43, fat: 21, description: "Ayam Bakar dengan bahan segar dan bumbu khas.", restrictions: [.glutenFree, .dairyFree]),
        MealNew(id: 65, mealType: .lunch, menuName: "Pecel Lele", portionSizeGram: 450, calories: 370, protein: 24, carbs: 44, fat: 22, description: "Pecel Lele dengan bahan segar dan bumbu khas.", restrictions: [.dairyFree, .eggAllergy, .lactoseIntolerant]),
        MealNew(id: 66, mealType: .lunch, menuName: "Rawon", portionSizeGram: 250, calories: 375, protein: 25, carbs: 45, fat: 8, description: "Rawon dengan bahan segar dan bumbu khas.", restrictions: [.eggAllergy]),
        MealNew(id: 67, mealType: .lunch, menuName: "Bakso", portionSizeGram: 300, calories: 380, protein: 26, carbs: 46, fat: 9, description: "Bakso dengan bahan segar dan bumbu khas.", restrictions: [.lactoseIntolerant, .glutenFree]),
        MealNew(id: 68, mealType: .lunch, menuName: "Rendang", portionSizeGram: 350, calories: 385, protein: 27, carbs: 47, fat: 10, description: "Rendang dengan bahan segar dan bumbu khas.", restrictions: [.glutenFree, .dairyFree, .eggAllergy]),
        MealNew(id: 69, mealType: .lunch, menuName: "Nasi Padang", portionSizeGram: 400, calories: 390, protein: 28, carbs: 48, fat: 11, description: "Nasi Padang dengan bahan segar dan bumbu khas.", restrictions: [.dairyFree]),
        MealNew(id: 70, mealType: .lunch, menuName: "Capcay Kuah", portionSizeGram: 450, calories: 395, protein: 29, carbs: 49, fat: 12, description: "Capcay Kuah dengan bahan segar dan bumbu khas.", restrictions: [.eggAllergy, .lactoseIntolerant]),
        MealNew(id: 71, mealType: .lunch, menuName: "Nasi Goreng Ayam", portionSizeGram: 250, calories: 400, protein: 10, carbs: 50, fat: 13, description: "Nasi Goreng Ayam dengan bahan segar dan bumbu khas.", restrictions: [.lactoseIntolerant, .glutenFree, .dairyFree]),
        MealNew(id: 72, mealType: .lunch, menuName: "Soto Ayam", portionSizeGram: 300, calories: 405, protein: 11, carbs: 51, fat: 14, description: "Soto Ayam dengan bahan segar dan bumbu khas.", restrictions: [.glutenFree]),
        MealNew(id: 73, mealType: .lunch, menuName: "Gado-Gado", portionSizeGram: 350, calories: 410, protein: 12, carbs: 52, fat: 15, description: "Gado-Gado dengan bahan segar dan bumbu khas.", restrictions: [.dairyFree, .eggAllergy]),
        MealNew(id: 74, mealType: .lunch, menuName: "Ayam Bakar", portionSizeGram: 400, calories: 415, protein: 13, carbs: 53, fat: 16, description: "Ayam Bakar dengan bahan segar dan bumbu khas.", restrictions: [.eggAllergy, .lactoseIntolerant, .glutenFree]),
        MealNew(id: 75, mealType: .lunch, menuName: "Pecel Lele", portionSizeGram: 450, calories: 420, protein: 14, carbs: 54, fat: 17, description: "Pecel Lele dengan bahan segar dan bumbu khas.", restrictions: [.lactoseIntolerant]),
        MealNew(id: 76, mealType: .lunch, menuName: "Rawon", portionSizeGram: 250, calories: 425, protein: 15, carbs: 55, fat: 18, description: "Rawon dengan bahan segar dan bumbu khas.", restrictions: [.glutenFree, .dairyFree]),
        MealNew(id: 77, mealType: .lunch, menuName: "Bakso", portionSizeGram: 300, calories: 430, protein: 16, carbs: 56, fat: 19, description: "Bakso dengan bahan segar dan bumbu khas.", restrictions: [.dairyFree, .eggAllergy, .lactoseIntolerant]),
        MealNew(id: 78, mealType: .lunch, menuName: "Rendang", portionSizeGram: 350, calories: 435, protein: 17, carbs: 57, fat: 20, description: "Rendang dengan bahan segar dan bumbu khas.", restrictions: [.eggAllergy]),
        MealNew(id: 79, mealType: .lunch, menuName: "Nasi Padang", portionSizeGram: 400, calories: 440, protein: 18, carbs: 58, fat: 21, description: "Nasi Padang dengan bahan segar dan bumbu khas.", restrictions: [.lactoseIntolerant, .glutenFree]),
        MealNew(id: 80, mealType: .lunch, menuName: "Capcay Kuah", portionSizeGram: 450, calories: 445, protein: 19, carbs: 59, fat: 22, description: "Capcay Kuah dengan bahan segar dan bumbu khas.", restrictions: [.glutenFree, .dairyFree, .eggAllergy]),
        MealNew(id: 81, mealType: .lunch, menuName: "Nasi Goreng Ayam", portionSizeGram: 250, calories: 450, protein: 20, carbs: 60, fat: 8, description: "Nasi Goreng Ayam dengan bahan segar dan bumbu khas.", restrictions: [.dairyFree]),
        MealNew(id: 82, mealType: .lunch, menuName: "Soto Ayam", portionSizeGram: 300, calories: 455, protein: 21, carbs: 61, fat: 9, description: "Soto Ayam dengan bahan segar dan bumbu khas.", restrictions: [.eggAllergy, .lactoseIntolerant]),
        MealNew(id: 83, mealType: .lunch, menuName: "Gado-Gado", portionSizeGram: 350, calories: 460, protein: 22, carbs: 62, fat: 10, description: "Gado-Gado dengan bahan segar dan bumbu khas.", restrictions: [.lactoseIntolerant, .glutenFree, .dairyFree]),
        MealNew(id: 84, mealType: .lunch, menuName: "Ayam Bakar", portionSizeGram: 400, calories: 465, protein: 23, carbs: 63, fat: 11, description: "Ayam Bakar dengan bahan segar dan bumbu khas.", restrictions: [.glutenFree]),
        MealNew(id: 85, mealType: .lunch, menuName: "Pecel Lele", portionSizeGram: 450, calories: 470, protein: 24, carbs: 64, fat: 12, description: "Pecel Lele dengan bahan segar dan bumbu khas.", restrictions: [.dairyFree, .eggAllergy]),
        MealNew(id: 86, mealType: .lunch, menuName: "Rawon", portionSizeGram: 250, calories: 475, protein: 25, carbs: 65, fat: 13, description: "Rawon dengan bahan segar dan bumbu khas.", restrictions: [.eggAllergy, .lactoseIntolerant, .glutenFree]),
        MealNew(id: 87, mealType: .lunch, menuName: "Bakso", portionSizeGram: 300, calories: 480, protein: 26, carbs: 66, fat: 14, description: "Bakso dengan bahan segar dan bumbu khas.", restrictions: [.lactoseIntolerant]),
        MealNew(id: 88, mealType: .lunch, menuName: "Rendang", portionSizeGram: 350, calories: 485, protein: 27, carbs: 67, fat: 15, description: "Rendang dengan bahan segar dan bumbu khas.", restrictions: [.glutenFree, .dairyFree]),
        MealNew(id: 89, mealType: .lunch, menuName: "Nasi Padang", portionSizeGram: 400, calories: 490, protein: 28, carbs: 68, fat: 16, description: "Nasi Padang dengan bahan segar dan bumbu khas.", restrictions: [.dairyFree, .eggAllergy, .lactoseIntolerant]),
        MealNew(id: 90, mealType: .lunch, menuName: "Capcay Kuah", portionSizeGram: 450, calories: 495, protein: 29, carbs: 69, fat: 17, description: "Capcay Kuah dengan bahan segar dan bumbu khas.", restrictions: [.eggAllergy]),
        MealNew(id: 91, mealType: .lunch, menuName: "Nasi Goreng Ayam", portionSizeGram: 250, calories: 500, protein: 10, carbs: 70, fat: 18, description: "Nasi Goreng Ayam dengan bahan segar dan bumbu khas.", restrictions: [.lactoseIntolerant, .glutenFree]),
        MealNew(id: 92, mealType: .lunch, menuName: "Soto Ayam", portionSizeGram: 300, calories: 505, protein: 11, carbs: 71, fat: 19, description: "Soto Ayam dengan bahan segar dan bumbu khas.", restrictions: [.glutenFree, .dairyFree, .eggAllergy]),
        MealNew(id: 93, mealType: .lunch, menuName: "Gado-Gado", portionSizeGram: 350, calories: 510, protein: 12, carbs: 72, fat: 20, description: "Gado-Gado dengan bahan segar dan bumbu khas.", restrictions: [.dairyFree]),
        MealNew(id: 94, mealType: .lunch, menuName: "Ayam Bakar", portionSizeGram: 400, calories: 515, protein: 13, carbs: 73, fat: 21, description: "Ayam Bakar dengan bahan segar dan bumbu khas.", restrictions: [.eggAllergy, .lactoseIntolerant]),
        MealNew(id: 95, mealType: .lunch, menuName: "Pecel Lele", portionSizeGram: 450, calories: 520, protein: 14, carbs: 74, fat: 22, description: "Pecel Lele dengan bahan segar dan bumbu khas.", restrictions: [.lactoseIntolerant, .glutenFree, .dairyFree]),
        MealNew(id: 96, mealType: .lunch, menuName: "Rawon", portionSizeGram: 250, calories: 525, protein: 15, carbs: 75, fat: 8, description: "Rawon dengan bahan segar dan bumbu khas.", restrictions: [.glutenFree]),
        MealNew(id: 97, mealType: .lunch, menuName: "Bakso", portionSizeGram: 300, calories: 530, protein: 16, carbs: 76, fat: 9, description: "Bakso dengan bahan segar dan bumbu khas.", restrictions: [.dairyFree, .eggAllergy]),
        MealNew(id: 98, mealType: .lunch, menuName: "Rendang", portionSizeGram: 350, calories: 535, protein: 17, carbs: 77, fat: 10, description: "Rendang dengan bahan segar dan bumbu khas.", restrictions: [.eggAllergy, .lactoseIntolerant, .glutenFree]),
        MealNew(id: 99, mealType: .lunch, menuName: "Nasi Padang", portionSizeGram: 400, calories: 540, protein: 18, carbs: 78, fat: 11, description: "Nasi Padang dengan bahan segar dan bumbu khas.", restrictions: [.lactoseIntolerant]),
        MealNew(id: 100, mealType: .lunch, menuName: "Capcay Kuah", portionSizeGram: 450, calories: 545, protein: 19, carbs: 79, fat: 12, description: "Capcay Kuah dengan bahan segar dan bumbu khas.", restrictions: [.glutenFree, .dairyFree])
    ]
    
    static let dinner: [MealNew] = [
        MealNew(id: 101, mealType: .dinner, menuName: "Sup Ikan", portionSizeGram: 250, calories: 300, protein: 10, carbs: 30, fat: 8, description: "Sup Ikan dengan bahan segar dan bumbu khas.", restrictions: [.lactoseIntolerant]),
        MealNew(id: 102, mealType: .dinner, menuName: "Salad Sayur", portionSizeGram: 300, calories: 305, protein: 11, carbs: 31, fat: 9, description: "Salad Sayur dengan bahan segar dan bumbu khas.", restrictions: [.glutenFree, .dairyFree]),
        MealNew(id: 103, mealType: .dinner, menuName: "Nasi Merah + Ayam", portionSizeGram: 350, calories: 310, protein: 12, carbs: 32, fat: 10, description: "Nasi Merah + Ayam dengan bahan segar dan bumbu khas.", restrictions: [.dairyFree, .eggAllergy, .lactoseIntolerant]),
        MealNew(id: 104, mealType: .dinner, menuName: "Tumis Brokoli", portionSizeGram: 400, calories: 315, protein: 13, carbs: 33, fat: 11, description: "Tumis Brokoli dengan bahan segar dan bumbu khas.", restrictions: [.eggAllergy]),
        MealNew(id: 105, mealType: .dinner, menuName: "Ikan Bakar", portionSizeGram: 450, calories: 320, protein: 14, carbs: 34, fat: 12, description: "Ikan Bakar dengan bahan segar dan bumbu khas.", restrictions: [.lactoseIntolerant, .glutenFree]),
        MealNew(id: 106, mealType: .dinner, menuName: "Sup Jagung", portionSizeGram: 250, calories: 325, protein: 15, carbs: 35, fat: 13, description: "Sup Jagung dengan bahan segar dan bumbu khas.", restrictions: [.glutenFree, .dairyFree, .eggAllergy]),
        MealNew(id: 107, mealType: .dinner, menuName: "Sayur Asem", portionSizeGram: 300, calories: 330, protein: 16, carbs: 36, fat: 14, description: "Sayur Asem dengan bahan segar dan bumbu khas.", restrictions: [.dairyFree]),
        MealNew(id: 108, mealType: .dinner, menuName: "Sop Buntut", portionSizeGram: 350, calories: 335, protein: 17, carbs: 37, fat: 15, description: "Sop Buntut dengan bahan segar dan bumbu khas.", restrictions: [.eggAllergy, .lactoseIntolerant]),
        MealNew(id: 109, mealType: .dinner, menuName: "Cah Kangkung", portionSizeGram: 400, calories: 340, protein: 18, carbs: 38, fat: 16, description: "Cah Kangkung dengan bahan segar dan bumbu khas.", restrictions: [.lactoseIntolerant, .glutenFree, .dairyFree]),
        MealNew(id: 110, mealType: .dinner, menuName: "Tahu Tempe Bacem", portionSizeGram: 450, calories: 345, protein: 19, carbs: 39, fat: 17, description: "Tahu Tempe Bacem dengan bahan segar dan bumbu khas.", restrictions: [.glutenFree]),
        MealNew(id: 111, mealType: .dinner, menuName: "Sup Ikan", portionSizeGram: 250, calories: 350, protein: 20, carbs: 40, fat: 18, description: "Sup Ikan dengan bahan segar dan bumbu khas.", restrictions: [.dairyFree, .eggAllergy]),
        MealNew(id: 112, mealType: .dinner, menuName: "Salad Sayur", portionSizeGram: 300, calories: 355, protein: 21, carbs: 41, fat: 19, description: "Salad Sayur dengan bahan segar dan bumbu khas.", restrictions: [.eggAllergy, .lactoseIntolerant, .glutenFree]),
        MealNew(id: 113, mealType: .dinner, menuName: "Nasi Merah + Ayam", portionSizeGram: 350, calories: 360, protein: 22, carbs: 42, fat: 20, description: "Nasi Merah + Ayam dengan bahan segar dan bumbu khas.", restrictions: [.lactoseIntolerant]),
        MealNew(id: 114, mealType: .dinner, menuName: "Tumis Brokoli", portionSizeGram: 400, calories: 365, protein: 23, carbs: 43, fat: 21, description: "Tumis Brokoli dengan bahan segar dan bumbu khas.", restrictions: [.glutenFree, .dairyFree]),
        MealNew(id: 115, mealType: .dinner, menuName: "Ikan Bakar", portionSizeGram: 450, calories: 370, protein: 24, carbs: 44, fat: 22, description: "Ikan Bakar dengan bahan segar dan bumbu khas.", restrictions: [.dairyFree, .eggAllergy, .lactoseIntolerant]),
        MealNew(id: 116, mealType: .dinner, menuName: "Sup Jagung", portionSizeGram: 250, calories: 375, protein: 25, carbs: 45, fat: 8, description: "Sup Jagung dengan bahan segar dan bumbu khas.", restrictions: [.eggAllergy]),
        MealNew(id: 117, mealType: .dinner, menuName: "Sayur Asem", portionSizeGram: 300, calories: 380, protein: 26, carbs: 46, fat: 9, description: "Sayur Asem dengan bahan segar dan bumbu khas.", restrictions: [.lactoseIntolerant, .glutenFree]),
        MealNew(id: 118, mealType: .dinner, menuName: "Sop Buntut", portionSizeGram: 350, calories: 385, protein: 27, carbs: 47, fat: 10, description: "Sop Buntut dengan bahan segar dan bumbu khas.", restrictions: [.glutenFree, .dairyFree, .eggAllergy]),
        MealNew(id: 119, mealType: .dinner, menuName: "Cah Kangkung", portionSizeGram: 400, calories: 390, protein: 28, carbs: 48, fat: 11, description: "Cah Kangkung dengan bahan segar dan bumbu khas.", restrictions: [.dairyFree]),
        MealNew(id: 120, mealType: .dinner, menuName: "Tahu Tempe Bacem", portionSizeGram: 450, calories: 395, protein: 29, carbs: 49, fat: 12, description: "Tahu Tempe Bacem dengan bahan segar dan bumbu khas.", restrictions: [.eggAllergy, .lactoseIntolerant]),
        MealNew(id: 121, mealType: .dinner, menuName: "Sup Ikan", portionSizeGram: 250, calories: 400, protein: 10, carbs: 50, fat: 13, description: "Sup Ikan dengan bahan segar dan bumbu khas.", restrictions: [.lactoseIntolerant, .glutenFree, .dairyFree]),
        MealNew(id: 122, mealType: .dinner, menuName: "Salad Sayur", portionSizeGram: 300, calories: 405, protein: 11, carbs: 51, fat: 14, description: "Salad Sayur dengan bahan segar dan bumbu khas.", restrictions: [.glutenFree]),
        MealNew(id: 123, mealType: .dinner, menuName: "Nasi Merah + Ayam", portionSizeGram: 350, calories: 410, protein: 12, carbs: 52, fat: 15, description: "Nasi Merah + Ayam dengan bahan segar dan bumbu khas.", restrictions: [.dairyFree, .eggAllergy]),
        MealNew(id: 124, mealType: .dinner, menuName: "Tumis Brokoli", portionSizeGram: 400, calories: 415, protein: 13, carbs: 53, fat: 16, description: "Tumis Brokoli dengan bahan segar dan bumbu khas.", restrictions: [.eggAllergy, .lactoseIntolerant, .glutenFree]),
        MealNew(id: 125, mealType: .dinner, menuName: "Ikan Bakar", portionSizeGram: 450, calories: 420, protein: 14, carbs: 54, fat: 17, description: "Ikan Bakar dengan bahan segar dan bumbu khas.", restrictions: [.lactoseIntolerant]),
        MealNew(id: 126, mealType: .dinner, menuName: "Sup Jagung", portionSizeGram: 250, calories: 425, protein: 15, carbs: 55, fat: 18, description: "Sup Jagung dengan bahan segar dan bumbu khas.", restrictions: [.glutenFree, .dairyFree]),
        MealNew(id: 127, mealType: .dinner, menuName: "Sayur Asem", portionSizeGram: 300, calories: 430, protein: 16, carbs: 56, fat: 19, description: "Sayur Asem dengan bahan segar dan bumbu khas.", restrictions: [.dairyFree, .eggAllergy, .lactoseIntolerant]),
        MealNew(id: 128, mealType: .dinner, menuName: "Sop Buntut", portionSizeGram: 350, calories: 435, protein: 17, carbs: 57, fat: 20, description: "Sop Buntut dengan bahan segar dan bumbu khas.", restrictions: [.eggAllergy]),
        MealNew(id: 129, mealType: .dinner, menuName: "Cah Kangkung", portionSizeGram: 400, calories: 440, protein: 18, carbs: 58, fat: 21, description: "Cah Kangkung dengan bahan segar dan bumbu khas.", restrictions: [.lactoseIntolerant, .glutenFree]),
        MealNew(id: 130, mealType: .dinner, menuName: "Tahu Tempe Bacem", portionSizeGram: 450, calories: 445, protein: 19, carbs: 59, fat: 22, description: "Tahu Tempe Bacem dengan bahan segar dan bumbu khas.", restrictions: [.glutenFree, .dairyFree, .eggAllergy]),
        MealNew(id: 131, mealType: .dinner, menuName: "Sup Ikan", portionSizeGram: 250, calories: 450, protein: 20, carbs: 60, fat: 8, description: "Sup Ikan dengan bahan segar dan bumbu khas.", restrictions: [.dairyFree]),
        MealNew(id: 132, mealType: .dinner, menuName: "Salad Sayur", portionSizeGram: 300, calories: 455, protein: 21, carbs: 61, fat: 9, description: "Salad Sayur dengan bahan segar dan bumbu khas.", restrictions: [.eggAllergy, .lactoseIntolerant]),
        MealNew(id: 133, mealType: .dinner, menuName: "Nasi Merah + Ayam", portionSizeGram: 350, calories: 460, protein: 22, carbs: 62, fat: 10, description: "Nasi Merah + Ayam dengan bahan segar dan bumbu khas.", restrictions: [.lactoseIntolerant, .glutenFree, .dairyFree]),
        MealNew(id: 134, mealType: .dinner, menuName: "Tumis Brokoli", portionSizeGram: 400, calories: 465, protein: 23, carbs: 63, fat: 11, description: "Tumis Brokoli dengan bahan segar dan bumbu khas.", restrictions: [.glutenFree]),
        MealNew(id: 135, mealType: .dinner, menuName: "Ikan Bakar", portionSizeGram: 450, calories: 470, protein: 24, carbs: 64, fat: 12, description: "Ikan Bakar dengan bahan segar dan bumbu khas.", restrictions: [.dairyFree, .eggAllergy]),
        MealNew(id: 136, mealType: .dinner, menuName: "Sup Jagung", portionSizeGram: 250, calories: 475, protein: 25, carbs: 65, fat: 13, description: "Sup Jagung dengan bahan segar dan bumbu khas.", restrictions: [.eggAllergy, .lactoseIntolerant, .glutenFree]),
        MealNew(id: 137, mealType: .dinner, menuName: "Sayur Asem", portionSizeGram: 300, calories: 480, protein: 26, carbs: 66, fat: 14, description: "Sayur Asem dengan bahan segar dan bumbu khas.", restrictions: [.lactoseIntolerant]),
        MealNew(id: 138, mealType: .dinner, menuName: "Sop Buntut", portionSizeGram: 350, calories: 485, protein: 27, carbs: 67, fat: 15, description: "Sop Buntut dengan bahan segar dan bumbu khas.", restrictions: [.glutenFree, .dairyFree]),
        MealNew(id: 139, mealType: .dinner, menuName: "Cah Kangkung", portionSizeGram: 400, calories: 490, protein: 28, carbs: 68, fat: 16, description: "Cah Kangkung dengan bahan segar dan bumbu khas.", restrictions: [.dairyFree, .eggAllergy, .lactoseIntolerant]),
        MealNew(id: 140, mealType: .dinner, menuName: "Tahu Tempe Bacem", portionSizeGram: 450, calories: 495, protein: 29, carbs: 69, fat: 17, description: "Tahu Tempe Bacem dengan bahan segar dan bumbu khas.", restrictions: [.eggAllergy]),
        MealNew(id: 141, mealType: .dinner, menuName: "Sup Ikan", portionSizeGram: 250, calories: 500, protein: 10, carbs: 70, fat: 18, description: "Sup Ikan dengan bahan segar dan bumbu khas.", restrictions: [.lactoseIntolerant, .glutenFree]),
        MealNew(id: 142, mealType: .dinner, menuName: "Salad Sayur", portionSizeGram: 300, calories: 505, protein: 11, carbs: 71, fat: 19, description: "Salad Sayur dengan bahan segar dan bumbu khas.", restrictions: [.glutenFree, .dairyFree, .eggAllergy]),
        MealNew(id: 143, mealType: .dinner, menuName: "Nasi Merah + Ayam", portionSizeGram: 350, calories: 510, protein: 12, carbs: 72, fat: 20, description: "Nasi Merah + Ayam dengan bahan segar dan bumbu khas.", restrictions: [.dairyFree]),
        MealNew(id: 144, mealType: .dinner, menuName: "Tumis Brokoli", portionSizeGram: 400, calories: 515, protein: 13, carbs: 73, fat: 21, description: "Tumis Brokoli dengan bahan segar dan bumbu khas.", restrictions: [.eggAllergy, .lactoseIntolerant]),
        MealNew(id: 145, mealType: .dinner, menuName: "Ikan Bakar", portionSizeGram: 450, calories: 520, protein: 14, carbs: 74, fat: 22, description: "Ikan Bakar dengan bahan segar dan bumbu khas.", restrictions: [.lactoseIntolerant, .glutenFree, .dairyFree]),
        MealNew(id: 146, mealType: .dinner, menuName: "Sup Jagung", portionSizeGram: 250, calories: 525, protein: 15, carbs: 75, fat: 8, description: "Sup Jagung dengan bahan segar dan bumbu khas.", restrictions: [.glutenFree]),
        MealNew(id: 147, mealType: .dinner, menuName: "Sayur Asem", portionSizeGram: 300, calories: 530, protein: 16, carbs: 76, fat: 9, description: "Sayur Asem dengan bahan segar dan bumbu khas.", restrictions: [.dairyFree, .eggAllergy]),
        MealNew(id: 148, mealType: .dinner, menuName: "Sop Buntut", portionSizeGram: 350, calories: 535, protein: 17, carbs: 77, fat: 10, description: "Sop Buntut dengan bahan segar dan bumbu khas.", restrictions: [.eggAllergy, .lactoseIntolerant, .glutenFree]),
        MealNew(id: 149, mealType: .dinner, menuName: "Cah Kangkung", portionSizeGram: 400, calories: 540, protein: 18, carbs: 78, fat: 11, description: "Cah Kangkung dengan bahan segar dan bumbu khas.", restrictions: [.lactoseIntolerant]),
        MealNew(id: 150, mealType: .dinner, menuName: "Tahu Tempe Bacem", portionSizeGram: 450, calories: 545, protein: 19, carbs: 79, fat: 12, description: "Tahu Tempe Bacem dengan bahan segar dan bumbu khas.", restrictions: [.glutenFree, .dairyFree])
    ]
}
