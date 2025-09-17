//
//  FoodData.swift
//  Eatsy
//
//  Created by Mac on 14/09/25.
//

import Foundation

// A helper struct to hold the data, separated by meal type
struct FoodData {
    static let breakfast: [MealObject] = [
        MealObject(id: 1, mealType: .breakfast, menuName: "Omelet Sayur", calories: 300, protein: 10, carbs: 30, fat: 8, imageName: "omelet_sayur", restrictions: [.lactoseIntolerant], isSelected: false),
        MealObject(id: 2, mealType: .breakfast, menuName: "Nasi Uduk", calories: 305, protein: 11, carbs: 31, fat: 9, imageName: "nasi_uduk", restrictions: [.glutenFree, .dairyFree], isSelected: false),
        MealObject(id: 3, mealType: .breakfast, menuName: "Bubur Ayam", calories: 310, protein: 12, carbs: 32, fat: 10, imageName: "bubur_ayam", restrictions: [.dairyFree, .eggAllergy, .lactoseIntolerant], isSelected: false),
        MealObject(id: 4, mealType: .breakfast, menuName: "Oatmeal Buah", calories: 315, protein: 13, carbs: 33, fat: 11, imageName: "oatmeal_buah", restrictions: [.eggAllergy], isSelected: false),
        MealObject(id: 5, mealType: .breakfast, menuName: "Roti Bakar Selai", calories: 320, protein: 14, carbs: 34, fat: 12, imageName: "roti_bakar_selai", restrictions: [.lactoseIntolerant, .glutenFree], isSelected: false),
        MealObject(id: 6, mealType: .breakfast, menuName: "Smoothie Pisang", calories: 325, protein: 15, carbs: 35, fat: 13, imageName: "smoothie_pisang", restrictions: [.glutenFree, .dairyFree, .eggAllergy], isSelected: false),
        MealObject(id: 7, mealType: .breakfast, menuName: "Pancake Madu", calories: 330, protein: 16, carbs: 36, fat: 14, imageName: "pancake_madu", restrictions: [.dairyFree], isSelected: false),
        MealObject(id: 8, mealType: .breakfast, menuName: "Telur Rebus", calories: 335, protein: 17, carbs: 37, fat: 15, imageName: "telur_rebus", restrictions: [.eggAllergy, .lactoseIntolerant], isSelected: false),
        MealObject(id: 9, mealType: .breakfast, menuName: "Sereal Susu", calories: 340, protein: 18, carbs: 38, fat: 16, imageName: "sereal_susu", restrictions: [.lactoseIntolerant, .glutenFree, .dairyFree], isSelected: false),
        MealObject(id: 10, mealType: .breakfast, menuName: "Lontong Sayur", calories: 345, protein: 19, carbs: 39, fat: 17, imageName: "lontong_sayur", restrictions: [.glutenFree], isSelected: false),
    ]
    
    static let lunch: [MealObject] = [
        MealObject(id: 11, mealType: .lunch, menuName: "Nasi Goreng Ayam", calories: 300, protein: 10, carbs: 30, fat: 8, imageName: "nasi_goreng_ayam", restrictions: [.lactoseIntolerant], isSelected: false),
        MealObject(id: 12, mealType: .lunch, menuName: "Soto Ayam", calories: 305, protein: 11, carbs: 31, fat: 9, imageName: "soto_ayam", restrictions: [.glutenFree, .dairyFree], isSelected: false),
        MealObject(id: 13, mealType: .lunch, menuName: "Gado-Gado", calories: 310, protein: 12, carbs: 32, fat: 10, imageName: "gado_gado", restrictions: [.dairyFree, .eggAllergy, .lactoseIntolerant], isSelected: false),
        MealObject(id: 14, mealType: .lunch, menuName: "Ayam Bakar", calories: 315, protein: 13, carbs: 33, fat: 11, imageName: "ayam_bakar", restrictions: [.eggAllergy], isSelected: false),
        MealObject(id: 15, mealType: .lunch, menuName: "Pecel Lele", calories: 320, protein: 14, carbs: 34, fat: 12, imageName: "pecel_lele", restrictions: [.lactoseIntolerant, .glutenFree], isSelected: false),
        MealObject(id: 16, mealType: .lunch, menuName: "Rawon", calories: 325, protein: 15, carbs: 35, fat: 13, imageName: "rawon", restrictions: [.glutenFree, .dairyFree, .eggAllergy], isSelected: false),
        MealObject(id: 17, mealType: .lunch, menuName: "Bakso", calories: 330, protein: 16, carbs: 36, fat: 14, imageName: "bakso", restrictions: [.dairyFree], isSelected: false),
        MealObject(id: 18, mealType: .lunch, menuName: "Rendang", calories: 335, protein: 17, carbs: 37, fat: 15, imageName: "rendang", restrictions: [.eggAllergy, .lactoseIntolerant], isSelected: false),
        MealObject(id: 19, mealType: .lunch, menuName: "Nasi Padang", calories: 340, protein: 18, carbs: 38, fat: 16, imageName: "nasi_padang", restrictions: [.lactoseIntolerant, .glutenFree, .dairyFree], isSelected: false),
        MealObject(id: 20, mealType: .lunch, menuName: "Capcay Kuah", calories: 345, protein: 19, carbs: 39, fat: 17, imageName: "capcay_kuah", restrictions: [.glutenFree], isSelected: false),
    ]
    
    static let dinner: [MealObject] = [
        MealObject(id: 21, mealType: .dinner, menuName: "Sup Ikan", calories: 300, protein: 10, carbs: 30, fat: 8, imageName: "sup_ikan", restrictions: [.lactoseIntolerant], isSelected: false),
        MealObject(id: 22, mealType: .dinner, menuName: "Salad Sayur", calories: 305, protein: 11, carbs: 31, fat: 9, imageName: "salad_sayur", restrictions: [.glutenFree, .dairyFree], isSelected: false),
        MealObject(id: 23, mealType: .dinner, menuName: "Tahu Kuah", calories: 310, protein: 12, carbs: 32, fat: 10, imageName: "tahu_kuah", restrictions: [.dairyFree, .eggAllergy, .lactoseIntolerant], isSelected: false),
        MealObject(id: 24, mealType: .dinner, menuName: "Tumis Brokoli", calories: 315, protein: 13, carbs: 33, fat: 11, imageName: "tumis_brokoli", restrictions: [.eggAllergy], isSelected: false),
        MealObject(id: 25, mealType: .dinner, menuName: "Ikan Bakar", calories: 320, protein: 14, carbs: 34, fat: 12, imageName: "ikan_bakar", restrictions: [.lactoseIntolerant, .glutenFree], isSelected: false),
        MealObject(id: 26, mealType: .dinner, menuName: "Sup Jagung", calories: 325, protein: 15, carbs: 35, fat: 13, imageName: "sup_jagung", restrictions: [.glutenFree, .dairyFree, .eggAllergy], isSelected: false),
        MealObject(id: 27, mealType: .dinner, menuName: "Sayur Asem", calories: 330, protein: 16, carbs: 36, fat: 14, imageName: "sayur_asem", restrictions: [.dairyFree], isSelected: false),
        MealObject(id: 28, mealType: .dinner, menuName: "Sop Buntut", calories: 335, protein: 17, carbs: 37, fat: 15, imageName: "sop_buntut", restrictions: [.eggAllergy, .lactoseIntolerant], isSelected: false),
        MealObject(id: 29, mealType: .dinner, menuName: "Cah Kangkung", calories: 340, protein: 18, carbs: 38, fat: 16, imageName: "cah_kangkung", restrictions: [.lactoseIntolerant, .glutenFree, .dairyFree], isSelected: false),
        MealObject(id: 30, mealType: .dinner, menuName: "Tempe Bacem", calories: 345, protein: 19, carbs: 39, fat: 17, imageName: "tempe_bacem", restrictions: [.glutenFree], isSelected: false),
    ]
}
