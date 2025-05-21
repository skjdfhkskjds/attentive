//
//  UpdateUserUseCase.swift
//  attentive
//
//  Created by Colin Chu on 2025-05-21.
//

import Foundation

struct UpdateUserUseCase {
    private let repository: UserRepository

    init(repository: UserRepository) {
        self.repository = repository
    }
    
    func execute(user: User) async throws {
        try await repository.updateUser(user)
    }
}
