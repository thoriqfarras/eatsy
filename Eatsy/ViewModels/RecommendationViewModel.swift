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
    
    func generateRecommendation(TDEE: Int, date: Date) -> Recommendation {
        var dayRecommendation: Recommendation = Recommendation(date: date)
        
        // Define the acceptable calorie range
        let lowerBound = Double(TDEE) * 0.9
        let upperBound = Double(TDEE) * 1.1

        // Repeat the meal selection until the total calories are within the target range
        repeat {
            // Clear previous selection
            dayRecommendation.meals.removeAll()

            // Safely pick a random meal from each array
            guard let randomBreakfast = breakfast.randomElement(),
                  let randomLunch = lunch.randomElement(),
                  let randomDinner = dinner.randomElement() else {
                // Handle the unlikely case of an empty meal array
                fatalError("Meal data arrays must not be empty.")
            }

            // Add the selected meals to the recommendation array
            dayRecommendation.meals.append(randomBreakfast)
            dayRecommendation.meals.append(randomLunch)
            dayRecommendation.meals.append(randomDinner)
            
            // Calculate the total calories for the current selection
            let totalCalories = dayRecommendation.meals.reduce(0) { $0 + $1.calories }
            
            // Check if the total calories are within the acceptable range
            if Double(totalCalories) >= lowerBound && Double(totalCalories) <= upperBound {
                // Found a good combination, exit the loop
                break
            }
        } while true // Loop indefinitely until a valid combination is found
        
        self.recommendations.append(dayRecommendation)
        
        return dayRecommendation
    }
}
