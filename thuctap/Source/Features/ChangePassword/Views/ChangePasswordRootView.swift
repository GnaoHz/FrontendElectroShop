import SwiftUI

struct ChangePasswordView: View {

    @State private var currentPassword = ""
    @State private var newPassword = ""
    @State private var confirmPassword = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 30) {

            infoField(
                title: "Current Password",
                text: $currentPassword,
                icon: "lock"
            )

            infoField(
                title: "New Password",
                text: $newPassword,
                icon: "key"
            )

            infoField(
                title: "Confirm New Password",
                text: $confirmPassword,
                icon: "checkmark.shield"
            )

            Button(action: {

            }) {
                Text("Save Changes")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(12)
            }
            .padding(.top, 10)
            
            Spacer()

        }
        .padding()
        .frame(maxHeight: .infinity)
        .background(Color(UIColor.systemGroupedBackground))
        .navigationTitle("Change Password")
    }
}

#Preview {
    ChangePasswordView()
}
