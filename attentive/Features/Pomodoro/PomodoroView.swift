//
//  PomodoroView.swift
//  attentive
//
//  Created by Colin Chu on 2025-05-19.
//

import SwiftUI

public struct PomodoroView: View {
    @StateObject private var viewModel = PomodoroViewModel()
    @State private var showTasks: Bool = false
    @State private var showOptions = false

    public var body: some View {
        ZStack {
            viewModel.state.mode.theme.background
                .ignoresSafeArea()
            VStack(spacing: PomodoroTheme.vSpace) {
                ZStack {
                    ArcProgressBar(progress: progress, mode: viewModel.state.mode)
                    VStack {
                        Text(timeString)
                            .font(PomodoroTheme.headingFont)
                            .foregroundColor(viewModel.state.mode.theme.accentOnSurface)
                    }
                }

                HStack(spacing: PomodoroTheme.buttonRowHSpace) {
                    // Options button
                    Button(action: { showOptions = true }) {
                        PomodoroTheme.optionsButtonIcon
                    }
                        .frame(
                            width: PomodoroTheme.buttonSize,
                            height: PomodoroTheme.buttonSize
                        )
                        .foregroundColor(viewModel.state.mode.theme.accentOnSurface)
                        .background(viewModel.state.mode.theme.onSurface)
                        .cornerRadius(PomodoroTheme.buttonCornerRadius)
                        .sheet(isPresented: $showOptions) {
                            PomodoroOptionsSheet(
                                mode: viewModel.state.mode,
                                mutableConfig: $viewModel.state.config,
                                onSave: { showOptions = false }
                            )
                        }
                    // Start/pause button
                    Button(action: { viewModel.startPauseTimer() }) {
                        PomodoroTheme.startPauseButtonIcon(viewModel.state.isRunning)
                    }
                        .frame(
                            width: PomodoroTheme.buttonWideSize,
                            height: PomodoroTheme.buttonSize
                        )
                        .foregroundColor(viewModel.state.mode.theme.onSurface)
                        .background(viewModel.state.mode.theme.accentOnSurface)
                        .cornerRadius(PomodoroTheme.buttonCornerRadius)
                    // Next button
                    Button(action: { viewModel.nextMode() }) {
                        PomodoroTheme.nextButtonIcon
                    }
                        .frame(
                            width: PomodoroTheme.buttonSize,
                            height: PomodoroTheme.buttonSize
                        )
                        .foregroundColor(viewModel.state.mode.theme.accentOnSurface)
                        .background(viewModel.state.mode.theme.onSurface)
                        .cornerRadius(PomodoroTheme.buttonCornerRadius)
                }
            }
            .padding()
        }
    }

    private var progress: Double {
        let total: TimeInterval
        switch viewModel.state.mode {
        case .focus: total = viewModel.state.config.focusDuration
        case .shortBreak: total = viewModel.state.config.shortBreakDuration
        case .longBreak: total = viewModel.state.config.longBreakDuration
        }
        return 1 - (viewModel.state.timeRemaining() / total)
    }

    private var timeString: String {
        let minutes = Int(viewModel.state.timeRemaining()) / 60
        let seconds = Int(viewModel.state.timeRemaining()) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

#Preview {
    PomodoroView()
}
