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
        await MainActor.run {
            isLoading = true
            errorMessage = nil
        }
        do {
            let fetched = try await repo.fetchDates()   // kerja background
            await MainActor.run {
                dates = fetched
                if selectedDateIndex >= fetched.count {
                    selectedDateIndex = max(0, fetched.count - 1)
                }
                isLoading = false
            }
        } catch {
            await MainActor.run {
                errorMessage = "Failed to load dates: \(error.localizedDescription)"
                isLoading = false
            }
        }
    }

    private func loadMeals() async {
        // ambil snapshot state di main thread
        let hasDates: Bool = await MainActor.run { !dates.isEmpty }
        guard hasDates else { return }

        let index: Int = await MainActor.run { selectedDateIndex }

        await MainActor.run {
            isLoading = true
            errorMessage = nil
        }
        do {
            let meals = try await repo.fetchMeals(forDateIndex: index) // background
            await MainActor.run {
                data = meals
                isLoading = false
            }
        } catch {
            await MainActor.run {
                errorMessage = "Failed to load meals: \(error.localizedDescription)"
                isLoading = false
            }
        }
    }

}
