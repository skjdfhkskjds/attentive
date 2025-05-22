import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var profileVM: ProfileViewModel

    var body: some View {
        ZStack {
            Color(ProfileTheme.background)
                .ignoresSafeArea()
            VStack(spacing: 0) {
                Spacer().frame(height: 60)
                // Header
                VStack(alignment: .leading, spacing: -10) {
                    // TODO: greeting based on time of day
                    Text("Good morning,")
                        .font(Font.poppinsBold(16))
                        .bold()
                        .foregroundColor(ProfileTheme.accentOnSurface)
                    Text(profileVM.user?.getFirstName() ?? "")
                        .font(Font.poppinsBold(64))
                        .bold()
                        .foregroundColor(ProfileTheme.accentOnSurface)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 43)
                .padding(.top, 36)
                .padding(.bottom, 24)
                // // Todo List
                // VStack(alignment: .leading, spacing: 8) {
                //     HStack {
                //         Text("Today")
                //             .font(.custom("Poppins-Bold", size: 12))
                //             .foregroundColor(Color(hex: "#437D9E"))
                //         Spacer()
                //         Text("05/21/2025")
                //             .font(.custom("Poppins-Bold", size: 8))
                //             .foregroundColor(Color(hex: "#437D9E"))
                //     }
                //     .padding(.horizontal, 8)
                //     TodoRowView(text: "buy shelf organizers")
                //     TodoRowView(text: "set up accounts")
                //     TodoRowView(text: "call the bank")
                // }
                // .padding(.top, 32)
                // .padding(.horizontal, 42)
                // Spacer()
                // Habit Cards Carousel
                HabitCarouselView(habits: profileVM.user?.habits ?? [])
                // Bottom Nav Bar
//                HStack(spacing: 48) {
//                    NavBarItem(iconName: "house.fill")
//                    NavBarItem(iconName: "star")
//                    NavBarItem(iconName: "plus.circle")
//                    NavBarItem(iconName: "bell")
//                    NavBarItem(iconName: "person.fill")
//                }
//                .frame(height: 32)
//                .padding(.bottom, 24)
            }
        }
        .task { await profileVM.loadUser() }
    }
}

struct NavBarItem: View {
    let iconName: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.7))
                .frame(width: 32, height: 32)
            Image(systemName: iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundColor(Color(hex: "#437D9E"))
        }
    }
}

// Helper for hex colors
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

#Preview {
    ProfileView()
}
