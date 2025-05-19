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
        VStack(spacing: 32) {
            HStack {
                Button(action: { showOptions = true }) {
                    Image(systemName: "ellipsis.circle")
                        .font(.title)
                }
                .sheet(isPresented: $showOptions) {
                    Text("Options go here")
                        .padding()
                }
                Spacer()
            }
            .padding(.horizontal)

            ZStack {
                ArcProgressBar(progress: progress, segment: viewModel.currentSegment)
                    .frame(width: 220, height: 220)
                VStack {
                    Text(viewModel.currentSegment == .focus ? "Focus" : (viewModel.currentSegment == .shortBreak ? "Short Break" : "Long Break"))
                        .font(.title2)
                        .bold()
                    Text(timeString)
                        .font(.system(size: 48, weight: .bold, design: .monospaced))
                        .padding(.top, 8)
                }
            }

            HStack(spacing: 32) {
                Button(action: { viewModel.startPauseTimer() }) {
                    Image(systemName: viewModel.isRunning ? "pause.circle.fill" : "play.circle.fill")
                        .resizable()
                        .frame(width: 64, height: 64)
                        .foregroundColor(.accentColor)
                }
                Button(action: { viewModel.moveToNextSegment() }) {
                    Image(systemName: "forward.end.fill")
                        .resizable()
                        .frame(width: 48, height: 48)
                        .foregroundColor(.accentColor)
                }
            }
        }
        .padding()
    }

    private var progress: Double {
        let total: TimeInterval
        switch viewModel.currentSegment {
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
    var segment: PomodoroSegmentType

    public var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.2), lineWidth: 16)
            Circle()
                .trim(from: 0, to: progress)
                .stroke(segmentColor, style: StrokeStyle(lineWidth: 16, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .animation(.linear, value: progress)
        }
    }

    private var segmentColor: Color {
        switch segment {
        case .focus: return .blue
        case .shortBreak: return .green
        case .longBreak: return .orange
        }
    }
}

#Preview {
    PomodoroView()
}
