import SwiftUI

struct ProfileRootView: View {
    var body: some View {
        ZStack {
            Color(red: 81 / 255, green: 77 / 255, blue: 163 / 255)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 20) {

                VStack {
                    Text("Profile")
                        .font(.title)
                        .bold()
                        .foregroundStyle(.white)

                    HStack(spacing: 16) {
                        Image("avt")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 70, height: 70)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.black, lineWidth: 1))

                        VStack(alignment: .center, spacing: 4) {
                            Text("Nguyen Viet Hoang")
                                .font(.headline)
                                .foregroundColor(.black)

                            Text("No Email")
                                .font(.subheadline)
                                .foregroundColor(.black)
                        }
                    }
                    .padding(20)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.white)

                    )
                }

                ScrollView {
                    VStack(spacing: 16) {

                        ProfileRow(
                            icon: "person.circle",
                            title: "Personal Information",
                            color: .blue,
                            destination: PersonalInfoView()
                        )
                        ProfileRow(
                            icon: "location.circle",
                            title: "Address",
                            color: .red,
                            destination: PersonalInfoView()
                        )
                        ProfileRow(
                            icon: "scope",
                            title: "Order Tracking",
                            color: .black,
                            destination: PersonalInfoView()
                        )
                        ProfileRow(
                            icon: "envelope.circle",
                            title: "Change email",
                            color: .yellow,
                            destination: PersonalInfoView()
                        )
                        ProfileRow(
                            icon: "lock.circle",
                            title: "Change password",
                            color: .green,
                            destination: PersonalInfoView()
                        )
                        ProfileRow(
                            icon: "bell.circle",
                            title: "Notification",
                            color: .orange,
                            destination: PersonalInfoView()
                        )
                        ProfileRow(
                            icon: "rectangle.portrait.and.arrow.right",
                            title: "Logout",
                            color: .blue,
                            destination: PersonalInfoView()
                        )
                    }
                    .padding()
                }
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.white)
                )
                .ignoresSafeArea(edges: .bottom)
            }

        }
    }
}

#Preview {
    ProfileRootView()
}
