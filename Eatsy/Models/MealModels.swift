import Foundation

struct Nutrient: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let icon: String      // SF Symbol
    let value: String
}

struct MealItem: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let emoji: String     // pakai emoji 🍳 biar mirip
    let nutrients: [Nutrient]
}

enum MealSection: String, CaseIterable, Identifiable {
    case breakfast = "Breakfast"
    case lunch     = "Lunch"
    var id: String { rawValue }
}
