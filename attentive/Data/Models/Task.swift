import Foundation

struct Task: Identifiable, Hashable {
    let id: Int
    let title: String
    let description: String
    let dueDate: Date
    let isCompleted: Bool
    let createdAt: Date
    let updatedAt: Date
}

extension Task: Dated {
    var date: Date {
        return dueDate
    }
}
