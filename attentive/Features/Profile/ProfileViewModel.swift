import SwiftUI

final class ProfileViewModel: ObservableObject {
    @Published private(set) var user: User?
    private let getUser: GetUserUseCase
    
    init(getUser: GetUserUseCase) {
        self.getUser = getUser
    }
    
    func loadUser() async {
        user = try? await getUser.execute()
    }
}
