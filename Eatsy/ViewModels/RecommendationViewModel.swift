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
        
        print(userViewModel.user)
        
        if let savedData = UserDefaults.standard.data(forKey: "userRecommendations"),
           let decodedRecommendations = try? JSONDecoder().decode([Recommendation].self, from: savedData) {
            self.recommendations = decodedRecommendations
            print("Recommendations data successfully fetched.")
        } else {
            print("No existing Recommendations data found.")
            return
        }
        
        let calendar = Calendar.current
        let firstRecommendationDate = calendar.startOfDay(for: recommendations[0].date)
        let todaysDate = calendar.startOfDay(for: Date())
        if firstRecommendationDate < todaysDate {
            print("Updating recommendations...")
            recommendations.removeFirst()
            generateRecommendation(dailyTargetCalories: dailyTargetCalories, date: Calendar.current.startOfDay(for: Date()))
            print("Updated recommendations.")
        }
    }
    
    func saveData() {
        do {
            // Encode the provided User struct into Data.
            let encodedData = try JSONEncoder().encode(self.recommendations)
            // Save the encoded data to UserDefaults using the designated key.
            UserDefaults.standard.set(encodedData, forKey: "userRecommendations")
            print("Recommendation data successfully saved.")
        } catch {
            // Log any errors that occur during encoding.
            print("Error saving recommendation data: \(error.localizedDescription)")
        }
    }
    
    func generateRecommendation(dailyTargetCalories: Int, date: Date) -> Void {
        
        guard dailyTargetCalories > 0 else {
                print("⚠️ dailyTargetCalories = 0, skip recommendation.")
                return
            }
        
        var dayRecommendation: Recommendation = Recommendation(date: date)
        
        // Define the acceptable calorie range
        let lowerBound = Double(dailyTargetCalories) * 0.9
        let upperBound = Double(dailyTargetCalories) * 1.1
        
        var attempts = 0
        let maxAttempts = 1000

        // Repeat the meal selection until the total calories are within the target range
        repeat {
            attempts += 1
            
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
            dayRecommendation.avgDinnersCalorie = avgDinnerCalories
            
            let totalAvgCalories = avgBreakfastCalories + avgLunchCalories + avgDinnerCalories
            
            if Double(totalAvgCalories) >= lowerBound && Double(totalAvgCalories) <= upperBound {
                print("✅ Found a valid combination: \(totalAvgCalories)")
                break
            }
            
        } while attempts < maxAttempts
        
        if attempts >= maxAttempts {
            print("⚠️ Could not find valid combination after \(maxAttempts) tries.")
        }
        
        self.recommendations.append(dayRecommendation)
        self.saveData()
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
