import SwiftUI

public struct PomodoroOptionsSheet: View {
    var mode: PomodoroMode
    @Binding var mutableConfig: PomodoroConfig
    var onSave: () -> Void

    public var body: some View {
        ZStack {
            mode.theme.background
                .ignoresSafeArea()
            VStack(spacing: PomodoroTheme.vSpace) {
                Text("Settings")
                    .font(PomodoroTheme.headingFont)
                    .foregroundColor(mode.theme.accentOnSurface)
                formFields
                Spacer()
                Button(action: { onSave() }) {
                    Image(systemName: "checkmark")
                        .foregroundColor(mode.theme.onSurface)
                        .frame(width: PomodoroTheme.buttonSize, height: PomodoroTheme.buttonSize)
                        .background(mode.theme.accentOnSurface)
                        .cornerRadius(PomodoroTheme.buttonCornerRadius)
                }
                .padding(.bottom, 32)
            }
            .padding(32)
        }
    }

    @ViewBuilder
    private var formFields: some View {
        VStack(alignment: .leading, spacing: 24) {
            PomodoroOptionsTextField(
                label: "Focus Duration",
                value: Binding<Int>(
                    get: { mutableConfig.focusDuration.minutes() },
                    set: { mutableConfig.focusDuration.set(minutes: $0) }
                )
            )
            PomodoroOptionsTextField(
                label: "Short Break Duration",
                value: Binding<Int>(
                    get: { mutableConfig.shortBreakDuration.minutes() },
                    set: { mutableConfig.shortBreakDuration.set(minutes: $0) }
                )
            )
            PomodoroOptionsTextField(
                label: "Long Break Duration",
                value: Binding<Int>(
                    get: { mutableConfig.longBreakDuration.minutes() },
                    set: { mutableConfig.longBreakDuration.set(minutes: $0) }
                )
            )
            PomodoroOptionsTextField(
                label: "Cycles Before Long Break",
                value: $mutableConfig.cyclesBeforeLongBreak
            )
        }
    }

    @ViewBuilder
    private func PomodoroOptionsTextField(
        label: String,
        value: Binding<Int>
    ) -> some View {
        HStack {
            Text(label)
                .foregroundColor(mode.theme.accentOnSurface)
            Spacer()
            TextField("", value: value, formatter: NumberFormatter())
                .keyboardType(.numberPad)
                .frame(width: 60)
                .padding(8)
                .background(mode.theme.onSurface)
                .cornerRadius(8)
                .foregroundColor(mode.theme.accentOnSurface)
                .font(PomodoroTheme.textFont)
        }
    }
}
