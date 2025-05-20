//
//  PomodoroViewModel.swift
//  attentive
//
//  Created by Colin Chu on 2025-05-19.
//

import Foundation
import Combine

class PomodoroViewModel: ObservableObject {
    @Published var state: PomodoroState
    @Published var modifiedConfig: PomodoroConfig

    private var timer: Timer?

    init(config: PomodoroConfig = PomodoroConfig()) {
        self.state = PomodoroState(
            config: config,
            mode: .focus,
            timeElapsed: 0,
            isRunning: false,
            cycleCount: 0
        )
        self.modifiedConfig = config
    }

    func startPauseTimer() {
        state.isRunning.toggle()
        if state.isRunning {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
                self?.tick()
            }
        } else {
            timer?.invalidate()
            timer = nil
        }
    }

    func tick() {
        guard state.timeRemaining() > 0 else {
            timer?.invalidate()
            timer = nil
            nextMode()
            return
        }
        state.timeElapsed += 1
    }

    func nextMode() {
        switch state.mode {
        case .focus:
            state.cycleCount += 1
            if state.cycleCount % state.config.cyclesBeforeLongBreak == 0 {
                state.mode = .longBreak
            } else {
                state.mode = .shortBreak
            }
        case .shortBreak:
            state.mode = .focus
        case .longBreak:
            state.mode = .focus
            state.cycleCount = 0
        }
        timer?.invalidate()
        state.reset()
    }

    func saveConfig() {
        if modifiedConfig == state.config { return }
        // TODO: save config to database
        state.config = modifiedConfig
    }
}
