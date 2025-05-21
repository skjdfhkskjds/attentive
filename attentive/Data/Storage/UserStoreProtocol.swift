//
//  UserStoreProtocol.swift
//  attentive
//
//  Created by Colin Chu on 2025-05-21.
//

import Foundation

protocol UserStore {
    func getUser() async throws -> User
    func updateUser(_ user: User) async throws
}
