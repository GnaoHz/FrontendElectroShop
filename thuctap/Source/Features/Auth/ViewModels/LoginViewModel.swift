import SwiftUI

class LoginViewModel: ObservableObject {
    private var authCoordinator: AuthCoordinator
    
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var isLoginFailed: Bool = false
    init(authCoordinator: AuthCoordinator) {
        self.authCoordinator = authCoordinator
    }
    func checkLogin() {
        if username == "user" && password == "password" {
            isLoginFailed=false
            authCoordinator.navigateToMainFlow()
        }else{
            isLoginFailed=true
        }
    }
    
    func navigateToRegister() {
        authCoordinator.navigateToRegister()
    }
}

