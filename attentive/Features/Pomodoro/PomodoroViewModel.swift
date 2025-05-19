//
//  PomodoroViewModel.swift
//  attentive
//
//  Created by Colin Chu on 2025-05-19.
//

import Foundation
import Combine

enum PomodoroSegmentType: String, CaseIterable, Identifiable {
    case focus, shortBreak, longBreak
    var id: String { rawValue }
}

struct PomodoroConfig {
    var focusDuration: TimeInterval = 25 * 60
    var shortBreakDuration: TimeInterval = 5 * 60
    var longBreakDuration: TimeInterval = 15 * 60
    var cyclesBeforeLongBreak: Int = 4
}

class PomodoroViewModel: ObservableObject {
    @Published var config: PomodoroConfig
    @Published var currentSegment: PomodoroSegmentType = .focus
    @Published var timeRemaining: TimeInterval
    @Published var isRunning: Bool = false
    @Published var cycleCount: Int = 0

    private var timer: Timer?
    private var cancellables = Set<AnyCancellable>()

    init(config: PomodoroConfig = PomodoroConfig()) {
        self.config = config
        self.timeRemaining = config.focusDuration
    }

    func startPauseTimer() {
        isRunning.toggle()
        if isRunning {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
                self?.tick()
            }
        } else {
            timer?.invalidate()
        }
    }

    func tick() {
        guard timeRemaining > 0 else {
            timer?.invalidate()
            moveToNextSegment()
            return
        }
        timeRemaining -= 1
    }

    func moveToNextSegment() {
        switch currentSegment {
        case .focus:
            cycleCount += 1
            if cycleCount % config.cyclesBeforeLongBreak == 0 {
                currentSegment = .longBreak
                timeRemaining = config.longBreakDuration
            } else {
                currentSegment = .shortBreak
                timeRemaining = config.shortBreakDuration
            }
        case .shortBreak:
            currentSegment = .focus
            timeRemaining = config.focusDuration
        case .longBreak:
            currentSegment = .focus
            timeRemaining = config.focusDuration
            cycleCount = 0
        }
        isRunning = false
    }

    func reset() {
        timer?.invalidate()
        currentSegment = .focus
        timeRemaining = config.focusDuration
        isRunning = false
        cycleCount = 0
    }
}
