import SwiftUI

public struct HomeView: View {
    public init() {}
    public var body: some View {
        VStack {
            Image(systemName: "house")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(.blue)
            Text("Home Screen")
                .font(.largeTitle)
        }
    }
}

#Preview {
    HomeView()
} 