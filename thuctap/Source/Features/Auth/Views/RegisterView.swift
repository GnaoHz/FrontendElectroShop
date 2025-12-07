

import SwiftUI

struct RegisterView: View {
    @ob
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var isEmailFailed: Bool = false
    @State private var isPasswordFailed: Bool = false
    @State private var isConfirmPassword: Bool = false
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "arrowshape.turn.up.backward.fill")
                Text("Back")
            }
            .foregroundStyle(.blue)
            .padding(.leading,10)
            .onTapGesture {
                self.appState.currentScreen = .login
            }
            
            TitleFontView(titleName:  "Sign up")
            
            InputField(title: "Email", placeholder: "Email", text: $email)
            InputField(title: "Password", placeholder: "Password", text: $password, isSecure: false)
            InputField(title: "ConfirmPassword", placeholder: "ConfirmPassword", text: $confirmPassword, isSecure: false)
            
            if isEmailFailed {
                Text("The username or password you entered is incorrect.")
                    .font(.system(size: 15,weight: .regular))
                    .foregroundStyle(.red)
                    .padding(.leading,22)
            }
            
            Button(action: {
                self.appState.currentScreen = .mainscreen
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
    RegisterView().environmentObject(AppState())
}

