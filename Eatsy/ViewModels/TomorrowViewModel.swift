//
//  TomorrowViewModel.swift
//  Eatsy
//
//  Created by Mac on 14/09/25.
//

import SwiftUI
import Foundation
import Combine

final class TomorrowViewModel: ObservableObject {
    @Published var meals: [TomorrowMeal] = []
    
    init() {
        loadMeals()
    }
    
    func loadMeals() {
        if let url = Bundle.main.url(forResource: "mock_meals_new", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decodedMeals = try JSONDecoder().decode([TomorrowMeal].self, from: data)
                self.meals = decodedMeals
            } catch {
                print("❌ Error decoding JSON: \(error)")
            }
        } else {
            print("❌ JSON file not found")
        }
    }
    
    /// Ambil rekomendasi 3 menu berdasarkan meal_type
    func recommendations(for type: String) -> [TomorrowMeal] {
        let filtered = meals.filter { $0.meal_type.lowercased() == type.lowercased() }
        return Array(filtered.prefix(3)) // cuma ambil 3 teratas
    }
}

