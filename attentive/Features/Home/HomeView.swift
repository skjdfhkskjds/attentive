import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var profileVM: ProfileViewModel

    var body: some View {
        VStack {
            Text("Home")
        }
        .task { await profileVM.loadUser() }
    }
}
