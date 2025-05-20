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

extension TimeInterval {
    func minutes() -> Int {
        return Int(self) / 60
    }

    func seconds() -> Int {
        return Int(self) % 60
    }

    mutating func set(minutes: Int) {
        self = TimeInterval(minutes * 60)
    }
}

struct PomodoroConfig {
    var focusDuration: TimeInterval = 25 * 60
    var shortBreakDuration: TimeInterval = 5 * 60
    var longBreakDuration: TimeInterval = 15 * 60
    var cyclesBeforeLongBreak: Int = 4

    func duration(for mode: PomodoroMode) -> TimeInterval {
        switch mode {
        case .focus: return focusDuration
        case .shortBreak: return shortBreakDuration
        case .longBreak: return longBreakDuration
        }
    }

    static func == (lhs: PomodoroConfig, rhs: PomodoroConfig) -> Bool {
        return lhs.focusDuration == rhs.focusDuration &&
            lhs.shortBreakDuration == rhs.shortBreakDuration &&
            lhs.longBreakDuration == rhs.longBreakDuration &&
            lhs.cyclesBeforeLongBreak == rhs.cyclesBeforeLongBreak
    }
}

struct PomodoroState {
    var config: PomodoroConfig
    var mode: PomodoroMode
    var timeElapsed: TimeInterval
    var isRunning: Bool
    var cycleCount: Int

    func timeRemaining() -> TimeInterval {
        return config.duration(for: mode) - timeElapsed
    }

    mutating func reset() {
        timeElapsed = 0
        isRunning = false
    }
}
