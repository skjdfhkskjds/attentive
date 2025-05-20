//
//  PomodoroView.swift
//  attentive
//
//  Created by Colin Chu on 2025-05-19.
//

import SwiftUI

public struct PomodoroView: View {
    @StateObject private var viewModel = PomodoroViewModel()
    @State private var showOptions = false

    public var body: some View {
        ZStack {
            viewModel.mode.theme.background
                .ignoresSafeArea()
            VStack(spacing: PomodoroTheme.vSpace) {
                ZStack {
                    ArcProgressBar(progress: progress, mode: viewModel.mode)
                    VStack {
                        Text(timeString)
                            .font(PomodoroTheme.timeFont)
                            .foregroundColor(viewModel.mode.theme.accentOnSurface)
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
                        .foregroundColor(viewModel.mode.theme.accentOnSurface)
                        .background(viewModel.mode.theme.onSurface)
                        .cornerRadius(PomodoroTheme.buttonCornerRadius)
                    .sheet(isPresented: $showOptions) {
                        Text("Options go here")
                            .padding()
                    }
                    // Start/pause button
                    Button(action: { viewModel.startPauseTimer() }) {
                        PomodoroTheme.startPauseButtonIcon(viewModel.isRunning)
                    }
                        .frame(
                            width: PomodoroTheme.buttonWideSize,
                            height: PomodoroTheme.buttonSize
                        )
                        .foregroundColor(viewModel.mode.theme.onSurface)
                        .background(viewModel.mode.theme.accentOnSurface)
                        .cornerRadius(PomodoroTheme.buttonCornerRadius)
                    // Next button
                    Button(action: { viewModel.moveToNextSegment() }) {
                        PomodoroTheme.nextButtonIcon
                    }
                        .frame(
                            width: PomodoroTheme.buttonSize,
                            height: PomodoroTheme.buttonSize
                        )
                        .foregroundColor(viewModel.mode.theme.accentOnSurface)
                        .background(viewModel.mode.theme.onSurface)
                        .cornerRadius(PomodoroTheme.buttonCornerRadius)
                }
            }
            .padding()
        }
    }

    private var progress: Double {
        let total: TimeInterval
        switch viewModel.mode {
        case .focus: total = viewModel.config.focusDuration
        case .shortBreak: total = viewModel.config.shortBreakDuration
        case .longBreak: total = viewModel.config.longBreakDuration
        }
        return 1 - (viewModel.timeRemaining / total)
    }

    private var timeString: String {
        let minutes = Int(viewModel.timeRemaining) / 60
        let seconds = Int(viewModel.timeRemaining) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

public struct ArcProgressBar: View {
    var progress: Double
    var mode: PomodoroMode

    public var body: some View {
        ZStack {
            // Background circle
            Circle()
                .fill(mode.theme.lightOnSurface)
                .frame(
                    width: PomodoroTheme.progressIndicatorSize,
                    height: PomodoroTheme.progressIndicatorSize
                )
            // Background arc (track)
            Circle()
                .stroke(mode.theme.onSurface, style: StrokeStyle(
                    lineWidth: PomodoroTheme.progressIndicatorLineWidth,
                    lineCap: .round
                ))
                .frame(
                    width: PomodoroTheme.progressIndicatorInnerSize,
                    height: PomodoroTheme.progressIndicatorInnerSize
                )
            // Foreground arc (progress)
            Circle()
                .trim(from: 0, to: progress)
                .stroke(mode.theme.lightAccentOnSurface, style: StrokeStyle(
                    lineWidth: PomodoroTheme.progressIndicatorLineWidth,
                    lineCap: .round
                ))
                .rotationEffect(.degrees(-90))
                .animation(.linear, value: progress)
                .frame(
                    width: PomodoroTheme.progressIndicatorInnerSize,
                    height: PomodoroTheme.progressIndicatorInnerSize
                )
        }
    }
}

#Preview {
    PomodoroView()
}
