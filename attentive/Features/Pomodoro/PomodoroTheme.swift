//
//  PomodoroTheme.swift
//  attentive
//
//  Created by Colin Chu on 2025-05-19.
//

import SwiftUI

struct PomodoroTheme {
    var background: Color
    var accentOnSurface: Color
    var lightAccentOnSurface: Color
    var onSurface: Color
    var lightOnSurface: Color

    init(mode: PomodoroMode) {
        switch mode {
        case .focus:
            background = Color("Pomodoro/Focus/Background")
            accentOnSurface = Color("Pomodoro/Focus/AccentOnSurface")
            lightAccentOnSurface = Color("Pomodoro/Focus/LightAccentOnSurface")
            onSurface = Color("Pomodoro/Focus/OnSurface")
            lightOnSurface = Color("Pomodoro/Focus/LightOnSurface")
        case .shortBreak:
            background = Color("Pomodoro/ShortBreak/Background")
            accentOnSurface = Color("Pomodoro/ShortBreak/AccentOnSurface")
            lightAccentOnSurface = Color("Pomodoro/ShortBreak/LightAccentOnSurface")
            onSurface = Color("Pomodoro/ShortBreak/OnSurface")
            lightOnSurface = Color("Pomodoro/ShortBreak/LightOnSurface")
        case .longBreak:
            background = Color("Pomodoro/LongBreak/Background")
            accentOnSurface = Color("Pomodoro/LongBreak/AccentOnSurface")
            lightAccentOnSurface = Color("Pomodoro/LongBreak/LightAccentOnSurface")
            onSurface = Color("Pomodoro/LongBreak/OnSurface")
            lightOnSurface = Color("Pomodoro/LongBreak/LightOnSurface")
        }
    }
    
}
