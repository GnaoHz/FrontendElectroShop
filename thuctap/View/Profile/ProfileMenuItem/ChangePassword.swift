

import SwiftUI

struct ChangePassword: View {
    @State var currentPassword: String = ""
    @State var newPassword: String = ""
    @State var confirmPassword: String = ""
    var body: some View {
        VStack (spacing:15){
            InputField(
                title: "Current Password", placeholder: "", text: $currentPassword
            )
            InputField(
                title: "New Password", placeholder: "", text: $newPassword
            )
            InputField(
                title: "Confirm Password", placeholder: "", text: $confirmPassword
            )
            Button(action:{
                
            }){
                Text("Update")
            }
            Spacer()
        }
    }
}

#Preview {
    ChangePassword()
}
