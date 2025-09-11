import Foundation

// Abstraksi data source (API, lokal, CoreData, dsb)
protocol ScheduleRepository {
    func fetchDates() async throws -> [String]
    func fetchMeals(forDateIndex index: Int) async throws -> [MealSection: [MealItem]]
}

// Implementasi mock (gampang diganti ke API sungguhan)
final class MockScheduleRepository: ScheduleRepository {
    
    let userSet: Int = 1
    
    func fetchDates() async throws -> [String] {
        // contoh: besok + dua hari setelahnya
        return ["Tomorrow", "18 Aug", "19 Aug"]
    }

    func fetchMeals(forDateIndex index: Int) async throws -> [MealSection: [MealItem]] {
            // kalau userSet = 0, langsung return kosong
            if userSet == 0 {
                return [:]
            }
            
            let nutrients = [
                Nutrient(name: "Fat",    icon: "drop",       value: "50g"),
                Nutrient(name: "Carbs",  icon: "leaf",       value: "50g"),
                Nutrient(name: "Protein",icon: "bolt.heart", value: "50g")
            ]
            let item = MealItem(title: "Boiled Egg", emoji: "🍳", nutrients: nutrients)
            return [
                .breakfast: Array(repeating: item, count: 3),
                .lunch:     Array(repeating: item, count: 3),
                .dinner:     Array(repeating: item, count: 3)
            ]
        }
}
