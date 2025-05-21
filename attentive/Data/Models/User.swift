import Foundation

struct User: Identifiable, Hashable {
    var id: UUID
    var name: String
    var email: String
    var password: String
    var habits: [Habit]
    var tasks: [Task]
    var createdAt: Date
    var updatedAt: Date

    func getFirstName() -> String {
        return String(name.split(separator: " ")[0])
    }
}
