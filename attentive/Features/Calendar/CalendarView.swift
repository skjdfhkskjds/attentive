import SwiftUI

public struct CalendarView: View {
    public init() {}
    public var body: some View {
        VStack {
            Image(systemName: "calendar")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(.green)
            Text("Calendar Screen")
                .font(.largeTitle)
        }
    }
}

#Preview {
    CalendarView()
} 