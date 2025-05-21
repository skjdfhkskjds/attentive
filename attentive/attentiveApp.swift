//
//  attentiveApp.swift
//  attentive
//
//  Created by Colin Chu on 2025-05-03.
//

import SwiftUI

@main
struct attentiveApp: App {
    @StateObject private var profileVM = ProfileViewModel(
        getUser: GetUserUseCase(
            repository: DefaultUserRepository(
                store: Database()
            )
        )
    )

    var body: some Scene {
        WindowGroup {
            ProfileView()
                .environmentObject(profileVM)
        }
    }
}
