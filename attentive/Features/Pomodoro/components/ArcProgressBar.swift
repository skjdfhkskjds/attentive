import SwiftUI

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
