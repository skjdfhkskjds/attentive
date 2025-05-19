//
//  PomodoroState.swift
//  attentive
//
//  Created by Colin Chu on 2025-05-19.
//

import Foundation

enum PomodoroMode: String, CaseIterable, Identifiable {
    case focus, shortBreak, longBreak
    var id: String { rawValue }
    var theme: PomodoroTheme {
        return PomodoroTheme(mode: self)
    }
}

struct PomodoroConfig {
    var focusDuration: TimeInterval = 25 * 60
    var shortBreakDuration: TimeInterval = 5 * 60
    var longBreakDuration: TimeInterval = 15 * 60
    var cyclesBeforeLongBreak: Int = 4
}
