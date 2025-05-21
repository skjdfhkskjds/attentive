import Foundation

struct Habit: Identifiable, Hashable {
    var id: Int
    var name: String
    var description: String
    var metrics: [Metric]
    var createdAt: Date
    var updatedAt: Date
}
