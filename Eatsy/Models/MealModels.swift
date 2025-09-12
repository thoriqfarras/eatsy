import Foundation

struct Nutrient: Identifiable, Hashable, Codable {
    let id = UUID()
    let name: String
    let icon: String
    let value: String

    private enum CodingKeys: String, CodingKey { case name, icon, value }
}

struct MealItem: Identifiable, Hashable, Codable {
    let id = UUID()
    let title: String
    let emoji: String
    let nutrients: [Nutrient]

    private enum CodingKeys: String, CodingKey { case title, emoji, nutrients }
}

enum MealSection: String, CaseIterable, Identifiable, Codable {
    case breakfast = "Breakfast"
    case lunch     = "Lunch"
    case dinner    = "Dinner"
    var id: String { rawValue }

    /// Map key JSON -> enum (JSON pakai huruf kecil)
    init?(jsonKey: String) {
        switch jsonKey.lowercased() {
        case "breakfast": self = .breakfast
        case "lunch":     self = .lunch
        case "dinner":    self = .dinner
        default:          return nil
        }
    }
}


struct MealsRootDTO: Codable {
    let days: [DayDTO]
}

struct DayDTO: Codable {
    let title: String
    let sections: SectionsDTO
}

struct SectionsDTO: Codable {
    let breakfast: [MealItem]?
    let lunch:     [MealItem]?
    let dinner:    [MealItem]?
}
