import SwiftUI

struct PersonalInfoView: View {
    @State private var fullName: String = "Nguyen Viet Hoang"
    @State private var phoneNumber: String = "0123456789"
    @State private var email: String = "example@gmail.com"
    var body: some View {
        VStack {
            VStack {
                Image("avt")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 110, height: 110)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.gray.opacity(0.4), lineWidth: 1)
                    )

                Button("Change Avatar") {
                    
                }
                .font(.subheadline)
                .foregroundColor(.blue)
            }
            .padding(.top, 20)

            VStack(spacing: 16) {

                infoField(title: "Full Name", text: $fullName, icon: "person")

                infoField(
                    title: "Phone Number",
                    text: $phoneNumber,
                    icon: "phone"
                )

                infoField(title: "Email", text: $email, icon: "envelope")
            }
            .padding(.horizontal)

            Spacer()

            Button(action: {
                print("Saved!")
            }) {
                Text("Save Changes")
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding(.horizontal)
            .padding(.bottom, 30)
        }
        .navigationTitle("Personal Info")
        .navigationBarTitleDisplayMode(.inline)
    }
}

@ViewBuilder
func infoField(title: String, text: Binding<String>, icon: String) -> some View
{
    VStack(alignment: .leading, spacing: 6) {
        Text(title)
            .font(.subheadline)
            .foregroundColor(.gray)

        HStack {
            Image(systemName: icon)
                .foregroundColor(.blue)

            TextField(title, text: text)
                .padding(.vertical, 8)
        }
        .padding(.horizontal)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
    }
}
