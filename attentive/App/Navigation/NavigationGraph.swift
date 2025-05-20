//
//  NavigationGraph.swift
//  attentive
//
//  Created by Colin Chu on 2025-05-19.
//

import Foundation
import SwiftUI

enum NavigationDestination: Hashable {
    case home
    case pomodoro
    case calendar
}

struct NavigationGraph: View {
    @State private var path: [NavigationDestination] = []
    @State private var selectedTab: NavigationDestination = .home

    var body: some View {
        NavigationStack(path: $path) {
            HomeView()
                .navigationDestination(for: NavigationDestination.self) { destination in
                    switch destination {
                    case .home:
                        HomeView()
                    case .pomodoro:
                        PomodoroView()
                    case .calendar:
                        CalendarView()
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        HStack {
                            Button(action: { path.append(.home) }) {
                                Image(systemName: "house")
                            }
                            Button(action: { path.append(.pomodoro) }) {
                                Image(systemName: "timer")
                            }
                            Button(action: { path.append(.calendar) }) {
                                Image(systemName: "calendar")
                            }
                        }
                    }
                }
        }
    }
}

#Preview {
    NavigationGraph()
}
