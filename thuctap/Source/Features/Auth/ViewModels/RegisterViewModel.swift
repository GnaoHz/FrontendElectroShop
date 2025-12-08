import SwiftUI

class RegisterViewModel:ObservableObject{
    @Published var email:String = ""
    @Published var password:String = ""
    @Published var confirmPassword:String = ""
    @Published var isEmailfailed:Bool = false
    @Published var isPasswordFailed:Bool = false
    @Published var isConfirmPasswordFailed:Bool = false
    
    private var authCoordinator:AuthCoordinator
    
    init(authCoordinator:AuthCoordinator){
        self.authCoordinator = authCoordinator
    }
    
    func checkField(){
        authCoordinator.navigateToMainFlow()
    }
    
    func backLogin(){
        authCoordinator.navigateToLogin()
    }
}

