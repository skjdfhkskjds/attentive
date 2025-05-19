//
//  PomodoroViewModel.swift
//  attentive
//
//  Created by Colin Chu on 2025-05-19.
//

import Foundation
import Combine

class PomodoroViewModel: ObservableObject {
    @Published var config: PomodoroConfig
    @Published var mode: PomodoroMode = .focus
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
            timer = nil
        }
    }

    func tick() {
        guard timeRemaining > 0 else {
            timer?.invalidate()
            timer = nil
            moveToNextSegment()
            return
        }
        timeRemaining -= 1
    }

    func moveToNextSegment() {
        switch mode {
        case .focus:
            cycleCount += 1
            if cycleCount % config.cyclesBeforeLongBreak == 0 {
                mode = .longBreak
            } else {
                mode = .shortBreak
            }
        case .shortBreak:
            mode = .focus
        case .longBreak:
            mode = .focus
            cycleCount = 0
        }
        reset()
    }

    func reset() {
        timer?.invalidate()
        switch mode {
        case .focus:
            timeRemaining = config.focusDuration
        case .shortBreak:
            timeRemaining = config.shortBreakDuration
        case .longBreak:
            timeRemaining = config.longBreakDuration
        }
        isRunning = false
    }
}
