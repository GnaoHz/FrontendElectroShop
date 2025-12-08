

import SwiftUI

struct RegisterView: View {
    @ObservedObject var registerViewModel: RegisterViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "arrowshape.turn.up.backward.fill")
                Text("Back")
            }
            .foregroundStyle(.blue)
            .padding(.leading,10)
            .onTapGesture {
                    registerViewModel.backLogin()
            }
            
            TitleFontView(titleName:  "Sign up")
            
            InputField(title: "Username", placeholder: "Username", text: $registerViewModel.email)
            InputField(title: "Password", placeholder: "Password", text: $registerViewModel.password, isSecure: false)
            InputField(title: "ConfirmPassword", placeholder: "ConfirmPassword", text: $registerViewModel.confirmPassword, isSecure: false)
            
            if registerViewModel.isEmailfailed {
                Text("The username or password you entered is incorrect.")
                    .font(.system(size: 15,weight: .regular))
                    .foregroundStyle(.red)
                    .padding(.leading,22)
            }
            
            Button(action: {
                registerViewModel.checkField()
            }) {
                Text("Register")
                    .font(.system(size: 20,weight: .bold))
                    .padding(20)
                    .foregroundStyle(Color.white)
                    .frame(maxWidth: .infinity)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(red: 251/255, green: 128/255, blue: 128/255), Color(red: 253/255, green: 193/255, blue: 104/255)]), startPoint: .leading, endPoint: .trailing))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding([.leading,.trailing],20)
            }
            .padding(.top,20)
            Spacer()
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

#Preview {
    let appC=AppCoordinator(isLoggedIn: false)
    let authC=AuthCoordinator(appCoordinator: appC)
    RegisterView(registerViewModel: RegisterViewModel(authCoordinator: authC))
}

