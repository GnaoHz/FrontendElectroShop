import SwiftUI

struct ProfileRootView: View {
    var body: some View {
        ZStack {
            Color(red: 81 / 255, green: 77 / 255, blue: 163 / 255)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 0) {

                VStack {
                    Text("Profile")
                        .font(.title)
                        .bold()
                        .foregroundStyle(.white)

                    HStack(spacing: 16) {
                        Image("avatar")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 70, height: 70)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 2))

                        VStack(alignment: .leading, spacing: 4) {
                            Text("Nguyen Viet Hoang")
                                .font(.headline)
                                .foregroundColor(.white)

                            Text("No Email")
                                .font(.subheadline)
                                .foregroundColor(.white.opacity(0.8))
                        }

                    }
                    .padding(20)
                    .background()

                    Spacer().frame(height: 25)
                }
                

                ScrollView {
                    VStack(spacing: 16) {

                        ProfileRow(
                            icon: "person.circle",
                            title: "Personal Information"
                        )
                        ProfileRow(icon: "location.circle", title: "Address")
                        ProfileRow(icon: "scope", title: "Order Tracking")
                        ProfileRow(
                            icon: "envelope.circle",
                            title: "Change email"
                        )
                        ProfileRow(
                            icon: "lock.circle",
                            title: "Change password"
                        )
                        ProfileRow(icon: "bell.circle", title: "Notification")
                        ProfileRow(
                            icon: "rectangle.portrait.and.arrow.right",
                            title: "Logout"
                        )
                    }
                    .padding()
                }
            }
        }
    }
}

struct ProfileRow: View {
    let icon: String
    let title: String

    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.system(size: 22))
                .foregroundColor(.black)

            Text(title)
                .font(.system(size: 17))
                .foregroundColor(.black)

            Spacer()

            Image(systemName: "chevron.right")
                .font(.system(size: 16))
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(14)
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 4)
    }
}

#Preview {
    ProfileRootView()
}
