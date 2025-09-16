//
//  RecommendationViewModel.swift
//  Eatsy
//
//  Created by Mac on 15/09/25.
//

import Foundation
import SwiftUI

class RecommendationViewModel: ObservableObject {
    @Published var recommendations: [Recommendation] = []
    @Published var breakfast: [MealObject] = FoodData.breakfast
    @Published var lunch: [MealObject] = FoodData.lunch
    @Published var dinner: [MealObject] = FoodData.dinner
    
    var userViewModel: UserViewModel
    
    init(userViewModel: UserViewModel) {
        self.userViewModel = userViewModel
        let dailyTargetCalories = userViewModel.user.dailyTargetCalories
        if dailyTargetCalories == 0 && recommendations.isEmpty {
            print("User not yet set up.")
            return
        }
        
        let calendar = Calendar.current
        if calendar.isDate(recommendations[0].date, equalTo: Date(), toGranularity: .day) {
            recommendations.removeFirst()
            generateRecommendation(dailyTargetCalories: dailyTargetCalories, date: Calendar.current.startOfDay(for: Date()))
            print("Updated recommendations.")
        }
    }
    
    func generateRecommendation(dailyTargetCalories: Int, date: Date) -> Void {
        var dayRecommendation: Recommendation = Recommendation(date: date)
        
        // Define the acceptable calorie range
        let lowerBound = Double(dailyTargetCalories) * 0.9
        let upperBound = Double(dailyTargetCalories) * 1.1

        // Repeat the meal selection until the total calories are within the target range
        repeat {
            // Clear previous selection
            dayRecommendation.breakfasts.removeAll()
            dayRecommendation.lunches.removeAll()
            dayRecommendation.dinners.removeAll()
        
            var selectedBreakfasts = Set<MealObject>()
            while selectedBreakfasts.count < 3 {
                guard let randomBreakfast = breakfast.randomElement() else {
                    // Handle the unlikely case of an empty meal array
                    fatalError("Meal data arrays must not be empty.")
                }
                selectedBreakfasts.insert(randomBreakfast)
            }
            dayRecommendation.breakfasts = Array(selectedBreakfasts)
            
            var selectedLunches = Set<MealObject>()
            while selectedLunches.count < 3 {
                guard let randomLunch = lunch.randomElement() else {
                    // Handle the unlikely case of an empty meal array
                    fatalError("Meal data arrays must not be empty.")
                }
                selectedLunches.insert(randomLunch)
            }
            dayRecommendation.lunches = Array(selectedLunches)
            
            var selectedDinners = Set<MealObject>()
            while selectedDinners.count < 3 {
                guard let randomDinner = dinner.randomElement() else {
                    // Handle the unlikely case of an empty meal array
                    fatalError("Meal data arrays must not be empty.")
                }
                selectedDinners.insert(randomDinner)
            }
            dayRecommendation.dinners = Array(selectedDinners)
            
            let avgBreakfastCalories = dayRecommendation.breakfasts.reduce(0) { $0 + $1.calories } / dayRecommendation.breakfasts.count
            let avgLunchCalories = dayRecommendation.lunches.reduce(0) { $0 + $1.calories } / dayRecommendation.lunches.count
            let avgDinnerCalories = dayRecommendation.dinners.reduce(0) { $0 + $1.calories } / dayRecommendation.dinners.count
            
            dayRecommendation.avgBreakfastsCalorie = avgBreakfastCalories
            dayRecommendation.avgLunchesCalorie = avgLunchCalories
            dayRecommendation.avgDinnerLCalorie = avgDinnerCalories
            
            let totalAvgCalories = avgBreakfastCalories + avgLunchCalories + avgDinnerCalories
            
            if Double(totalAvgCalories) >= lowerBound && Double(totalAvgCalories) <= upperBound {
                // Found a good combination, exit the loop
                print("Found a valid combination")
                break
            }
            print("Combination invalid: \(totalAvgCalories)")
        } while true // Loop indefinitely until a valid combination is found
        
        self.recommendations.append(dayRecommendation)
    }
}

//
//func generateRecommendation(TDEE: Int, allMeals: [MealObject]) -> Recommendation {
//    var recommendation: Recommendation! // Use a non-optional variable and initialize it in the loop
//    
//    // A do-while loop guarantees the recommendation is created at least once
//    repeat {
//        // Create an empty recommendation object
//        var newRecommendation = Recommendation(date: Date(), breakfasts: [], lunches: [], dinners: [])
//        
//        
//        
//        recommendation = newRecommendation
//    } while sumCalorie(recommendation.breakfasts + recommendation.lunches + recommendation.dinners) > Double(TDEE) * 1.1 || sumCalorie(recommendation.breakfasts + recommendation.lunches + recommendation.dinners) < Double(TDEE) * 0.9
//    
//    return recommendation
//}

// Assumes the following helper functions exist:
// func pickRandomFrom(_ meals: [MealObject], category: String) -> MealObject { ... }
// func sumCalorie(_ meals: [MealObject]) -> Double { ... }
