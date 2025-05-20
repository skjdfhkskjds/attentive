//
//  PomodoroTheme.swift
//  attentive
//
//  Created by Colin Chu on 2025-05-19.
//

import SwiftUI

struct PomodoroTheme {
    // ================================================
    //                     Colors
    // ================================================
    let background: Color
    let accentOnSurface: Color
    let lightAccentOnSurface: Color
    let onSurface: Color
    let lightOnSurface: Color

    // ================================================
    //                     Spacing
    // ================================================
    static let vSpace: CGFloat = 48

    // ================================================
    //                  Button Spacing
    // ================================================
    static let buttonRowHSpace: CGFloat = 16
    static let buttonSize: CGFloat = 50
    static let buttonWideSize: CGFloat = 80
    static let buttonCornerRadius: CGFloat = 12

    // ================================================
    //                Progress Indicator
    // ================================================
    static let progressIndicatorSize: CGFloat = 330
    static let progressIndicatorInnerSize: CGFloat = 280
    static let progressIndicatorLineWidth: CGFloat = 18

    // ================================================
    //                      Text
    // ================================================
    static let timeFont: Font = .system(size: 70, weight: .bold, design: .default)

    // ================================================
    //                      Icons
    // ================================================
    static let optionsButtonIcon: Image = Image(systemName: "ellipsis")
    static let startPauseButtonIcon: (Bool) -> Image = { isRunning in
        return Image(systemName: isRunning ? "pause.fill" : "play.fill")
    }
    static let nextButtonIcon: Image = Image(systemName: "forward.end.fill")

    init(mode: PomodoroMode) {
        switch mode {
        case .focus:
            background = Color(.Pomodoro.Focus.background)
            accentOnSurface = Color(.Pomodoro.Focus.accentOnSurface)
            lightAccentOnSurface = Color(.Pomodoro.Focus.lightAccentOnSurface)
            onSurface = Color(.Pomodoro.Focus.onSurface)
            lightOnSurface = Color(.Pomodoro.Focus.lightOnSurface)
        case .shortBreak:
            background = Color(.Pomodoro.ShortBreak.background)
            accentOnSurface = Color(.Pomodoro.ShortBreak.accentOnSurface)
            lightAccentOnSurface = Color(.Pomodoro.ShortBreak.lightAccentOnSurface)
            onSurface = Color(.Pomodoro.ShortBreak.onSurface)
            lightOnSurface = Color(.Pomodoro.ShortBreak.lightOnSurface)
        case .longBreak:
            background = Color(.Pomodoro.LongBreak.background)
            accentOnSurface = Color(.Pomodoro.LongBreak.accentOnSurface)
            lightAccentOnSurface = Color(.Pomodoro.LongBreak.lightAccentOnSurface)
            onSurface = Color(.Pomodoro.LongBreak.onSurface)
            lightOnSurface = Color(.Pomodoro.LongBreak.lightOnSurface)
        }
    }
}
