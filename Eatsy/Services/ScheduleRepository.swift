import Foundation

// Abstraksi data source (API, lokal, CoreData, dsb)
protocol ScheduleRepository {
    func fetchDates() async throws -> [String]
    func fetchMeals(forDateIndex index: Int) async throws -> [MealSection: [MealItem]]
}

/// Implementasi yang membaca dari Resources/mock_meals/mock_meals.json
final class LocalScheduleRepository: ScheduleRepository {

    private let root: MealsRootDTO
    private let userViewModel: UserViewModel = UserViewModel()

    /// subdirectory = "mock_meals" karena file ada di Resources/mock_meals/mock_meals.json
    init(bundle: Bundle = .main) {
        self.root = bundle.decode("mock_meals", in: "mock_meals")
    }

    func fetchDates() async throws -> [String] {
        // Skip item pertama (Today)
        let days = Array(root.days.dropFirst())
        return days.map { $0.title }
    }

    func fetchMeals(forDateIndex index: Int) async throws -> [MealSection: [MealItem]] {
        if !userViewModel.user.isSetUp { return [:] }

        let days = Array(root.days.dropFirst()) // buang "Today"
        guard index >= 0 && index < days.count else { return [:] }

        let day = days[index]
        var result: [MealSection: [MealItem]] = [:]
        if let b = day.sections.breakfast, !b.isEmpty { result[.breakfast] = b }
        if let l = day.sections.lunch,     !l.isEmpty { result[.lunch]     = l }
        if let d = day.sections.dinner,    !d.isEmpty { result[.dinner]    = d }
        return result
    }
}
