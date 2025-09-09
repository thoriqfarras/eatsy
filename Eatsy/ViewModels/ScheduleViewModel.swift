import Foundation
import Combine

final class ScheduleViewModel: ObservableObject {
    // Input dari View
    @Published var selectedDateIndex: Int = 0 {
        didSet { Task { await loadMeals() } }
    }

    // Output ke View
    @Published private(set) var dates: [String] = []
    @Published private(set) var data: [MealSection: [MealItem]] = [:]
    @Published private(set) var isLoading: Bool = false
    @Published private(set) var errorMessage: String?

    private let repo: ScheduleRepository
    private var cancellables = Set<AnyCancellable>()

    init(repo: ScheduleRepository) {
        self.repo = repo
    }

    func onAppear() {
        // load awal
        Task {
            await loadDates()
            await loadMeals()
        }
    }

    func items(for section: MealSection) -> [MealItem] {
        data[section] ?? []
    }

    private func loadDates() async {
        isLoading = true
        errorMessage = nil
        do {
            let fetched = try await repo.fetchDates()
            dates = fetched
            if selectedDateIndex >= fetched.count {
                selectedDateIndex = max(0, fetched.count - 1)
            }
        } catch {
            errorMessage = "Failed to load dates: \(error.localizedDescription)"
        }
        isLoading = false
    }

    private func loadMeals() async {
        guard !dates.isEmpty else { return }
        isLoading = true
        errorMessage = nil
        do {
            let meals = try await repo.fetchMeals(forDateIndex: selectedDateIndex)
            data = meals
        } catch {
            errorMessage = "Failed to load meals: \(error.localizedDescription)"
        }
        isLoading = false
    }
}
