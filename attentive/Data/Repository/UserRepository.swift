struct DefaultUserRepository: UserRepository {
    private var cachedUser: User?
    private let store: UserStore

    init(store: UserStore) {
        self.store = store
    }
    
    func getCurrentUser() async throws -> User {
        if let cached = cachedUser { return cached }
        let user = try await store.getUser()
        // cachedUser = user
        return user
    }

    func updateUser(_ user: User) async throws {
        try await store.updateUser(user)
        // cachedUser = user
    }
}
