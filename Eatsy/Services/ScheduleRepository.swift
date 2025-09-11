import Foundation

// Abstraksi data source (API, lokal, CoreData, dsb)
protocol ScheduleRepository {
    func fetchDates() async throws -> [String]
    func fetchMeals(forDateIndex index: Int) async throws -> [MealSection: [MealItem]]
}
