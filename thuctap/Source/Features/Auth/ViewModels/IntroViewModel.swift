import SwiftUI
class IntroViewModel: ObservableObject {
    private var authCoordinator: AuthCoordinator
    
    init(authCoordinator: AuthCoordinator) {
        self.authCoordinator = authCoordinator
    }
    
    func goToLogin() {
        authCoordinator.navigateToLogin()
    }
}
