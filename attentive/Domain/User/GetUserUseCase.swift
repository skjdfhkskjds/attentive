//
//  UpdateUserUseCase.swift
//  attentive
//
//  Created by Colin Chu on 2025-05-21.
//

import Foundation

struct GetUserUseCase {
    private let repository: UserRepository

    init(repository: UserRepository) {
        self.repository = repository
    }

    func execute() async throws -> User {
        return try await repository.getCurrentUser()
    }
}
