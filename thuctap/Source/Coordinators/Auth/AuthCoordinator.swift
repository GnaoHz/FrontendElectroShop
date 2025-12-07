
import SwiftUI

enum AuthScreen{
    case intro
    case login
    case register
}

final class AuthCoordinator: Coordinator {
    @Published var currentScreen: AuthScreen = .intro
    
    private var appCoordinator : AppCoordinator
    
    init(appCoordinator: AppCoordinator){
        self.appCoordinator = appCoordinator
    }
    
    @ViewBuilder
    func start() -> some View {
        NavigationStack {
            AuthFlowView2(authCoordinator: self)
        }
    }
    
    func navigateToLogin(){
        currentScreen = .login
    }
    func navigateToRegister(){
        currentScreen = .register
    }
    func navigateToMainFlow(){
        appCoordinator.didLoggedIn()
    }
}
