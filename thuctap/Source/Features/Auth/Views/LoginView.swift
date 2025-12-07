

import SwiftUI

struct LoginView: View {
    @ObservedObject var loginViewModel: LoginViewModel
    
    
    var body: some View {
        VStack{
            VStack(alignment: .leading, spacing: 16) {
                TitleFontView(titleName: "Sign in")
                
                InputField(title: "Username", placeholder: "Username", text: $loginViewModel.username)
                InputField(title: "Password", placeholder: "Password", text: $loginViewModel.password, isSecure: true)
                
                if loginViewModel.isLoginFailed {
                    Text("The username or password you entered is incorrect.")
                        .font(.system(size: 15,weight: .regular))
                        .foregroundStyle(.red)
                        .padding(.leading,22)
                }
                
                Button(action: {
                    loginViewModel.checkLogin()
                }) {
                    Text("Login")
                        .font(.system(size: 20,weight: .bold))
                        .padding(20)
                        .foregroundStyle(Color.white)
                        .frame(maxWidth: .infinity)
                        .background(LinearGradient.mixRedOrange)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding([.leading,.trailing],20)
                }
                .padding(.top,20)
            }
            
            VStack(alignment: .center, spacing: 30) {
                HStack{
                    Button(action: {
                        
                    }){
                        Text("Forgot password?")
                            .font(.system(size: 18,weight: .regular))
                            .foregroundStyle(Color.black)
                    }
                    Spacer(minLength: 0)
                    Button(action: {
                        loginViewModel.navigateToRegister()
                    }){
                        Text("Sign up")
                    }
                }
                .padding(.horizontal,22)
                
                
                SocialLoginButton(imageName: "apple", text: "Continue with Apple",size: 40)
                SocialLoginButton(imageName: "fb", text: "Continue with Facebook",size: 40)
                SocialLoginButton(imageName: "gg", text: "Continue with Google",size: 35)
            }
            .padding(.top,20)
            Spacer()
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

struct SocialLoginButton: View {
    let imageName: String
    let text: String
    let size: CGFloat
    
    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: size, height: size)
            
            Text(text)
                .font(.system(size: 18, weight: .medium))
                .foregroundStyle(.black)
        }
        .padding(.horizontal)
        .frame(width: 300,height: 50) // chiều cao cố định
        .background(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black.opacity(0.5), lineWidth: 1)
        )
        .onTapGesture {
            print("123")
        }
    }
}

struct InputField: View {
    var title: String
    var placeholder: String
    @Binding var text: String
    var isSecure: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.system(size: 20,weight: .regular))
                .padding(.leading,20)
            
            Group {
                if isSecure {
                    SecureField(placeholder, text: $text)
                } else {
                    TextField(placeholder, text: $text)
                }
            }
            .font(.system(size: 20,weight: .regular))
            .padding([.horizontal,.vertical])
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.black.opacity(0.5), lineWidth: 1)
            )
            .padding([.leading,.trailing],20)
            .autocapitalization(.none)
        }
    }
}

#Preview {
    let appC=AppCoordinator(isLoggedIn: false)
    let authC=AuthCoordinator(appCoordinator: appC)
    LoginView(loginViewModel: LoginViewModel(authCoordinator: authC))
}
