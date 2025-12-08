import SwiftUI

struct AuthFlowView2: View {
    @ObservedObject var authCoordinator: AuthCoordinator
    var body: some View {

        switch authCoordinator.currentScreen {
        case .intro:
            IntroView(
                introViewModel: IntroViewModel(authCoordinator: authCoordinator)
            )

        case .login:
            LoginView(
                loginViewModel: LoginViewModel(authCoordinator: authCoordinator)
            )

        case .register:
            RegisterView(
                registerViewModel: RegisterViewModel(authCoordinator: authCoordinator)
            )
        }
    }

}
