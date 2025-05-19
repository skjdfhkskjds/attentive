//
//  PomodoroView.swift
//  attentive
//
//  Created by Colin Chu on 2025-05-19.
//

import SwiftUI

let progressIndicatorSize: CGFloat = 330
let progressIndicatorInnerSize: CGFloat = 280
let progressIndicatorLineWidth: CGFloat = 18

public struct PomodoroView: View {
    @StateObject private var viewModel = PomodoroViewModel()
    @State private var showOptions = false

    public var body: some View {
        ZStack {
            viewModel.mode.theme.background
                .ignoresSafeArea()
            VStack(spacing: 48) {
                ZStack {
                    ArcProgressBar(progress: progress, mode: viewModel.mode)
                    VStack {
                        Text(timeString)
                            .font(.system(size: 70, weight: .bold, design: .default))
                            .foregroundColor(viewModel.mode.theme.accentOnSurface)
                    }
                }

                HStack(spacing: 16) {
                    Button(action: { showOptions = true }) {
                        Image(systemName: "ellipsis")
                    }
                        .frame(width: 50, height: 50)
                        .foregroundColor(viewModel.mode.theme.accentOnSurface)
                        .background(viewModel.mode.theme.onSurface)
                        .cornerRadius(12)
                    .sheet(isPresented: $showOptions) {
                        Text("Options go here")
                            .padding()
                    }
                    Button(action: { viewModel.startPauseTimer() }) {
                        Image(systemName: viewModel.isRunning ? "pause.fill" : "play.fill")
                    }
                        .frame(width: 80, height: 50)
                        .foregroundColor(viewModel.mode.theme.onSurface)
                        .background(viewModel.mode.theme.accentOnSurface)
                        .cornerRadius(12)
                    Button(action: { viewModel.moveToNextSegment() }) {
                        Image(systemName: "forward.end.fill")
                    }
                        .frame(width: 50, height: 50)
                        .foregroundColor(viewModel.mode.theme.accentOnSurface)
                        .background(viewModel.mode.theme.onSurface)
                        .cornerRadius(12)
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
            Circle()
                .fill(mode.theme.lightOnSurface)
                .frame(
                    width: progressIndicatorSize,
                    height: progressIndicatorSize
                )
            // Background arc (track)
            Circle()
                .stroke(mode.theme.onSurface, style: StrokeStyle(
                    lineWidth: progressIndicatorLineWidth,
                    lineCap: .round
                ))
                .rotationEffect(.degrees(-90))
                .frame(
                    width: progressIndicatorInnerSize,
                    height: progressIndicatorInnerSize
                )
            // Foreground arc (progress)
            Circle()
                .trim(from: 0, to: progress)
                .stroke(mode.theme.lightAccentOnSurface, style: StrokeStyle(
                    lineWidth: progressIndicatorLineWidth,
                    lineCap: .round
                ))
                .rotationEffect(.degrees(-90))
                .animation(.linear, value: progress)
                .frame(
                    width: progressIndicatorInnerSize,
                    height: progressIndicatorInnerSize
                )
        }
    }
}

#Preview {
    PomodoroView()
}
