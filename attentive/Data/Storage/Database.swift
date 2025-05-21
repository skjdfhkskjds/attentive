import Foundation

struct Database {
    // TODO: implement db config
}

extension Database : UserStore {
    func getUser() async throws -> User {
        return defaultUser
    }

    func updateUser(_ user: User) async throws {
        defaultUser = user
    }
}
