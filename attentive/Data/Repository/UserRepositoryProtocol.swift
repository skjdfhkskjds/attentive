//
//  UserRepositoryProtocol.swift
//  attentive
//
//  Created by Colin Chu on 2025-05-21.
//

import Foundation

protocol UserRepository {
    func getCurrentUser() async throws -> User
    func updateUser(_ user: User) async throws
}
