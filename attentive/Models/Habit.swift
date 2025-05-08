import Foundation

enum Frequency {
    case daily
    case weekly
    case monthly
    case custom(days: [Int])
}

struct Habit {
    var id: UUID
    var name: String
    var description: String
    var frequency: Frequency
    var metricConfig: MetricConfiguration
    var reminderTime: Date?
    var created: Date
    
    // Metadata
    var tags: [String]
    var category: String?
    var isActive: Bool
}

struct HabitEntry {
    var id: UUID
    var habitId: UUID
    var timestamp: Date
    var value: MetricValue
    var notes: String?
}
