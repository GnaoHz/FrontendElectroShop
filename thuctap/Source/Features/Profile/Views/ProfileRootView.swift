import SwiftUI

struct ProfileRootView: View {
    @ObservedObject var mainCoordinator: MainCoordinator
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
                            destination: EmptyAddressView()
                        )
                        ProfileRow(
                            icon: "scope",
                            title: "Order Tracking",
                            color: .black,
                            destination: OrderTrackingRootView()
                        )
                        ProfileRow(
                            icon: "globe",
                            title: "Language",
                            color: .blue,
                            destination: LanguageSettingRootView()
                        )
                        ProfileRow(
                            icon: "lock.circle",
                            title: "Change password",
                            color: .green,
                            destination: ChangePasswordView()
                        )
                        ProfileRow(
                            icon: "bell.circle",
                            title: "Notification",
                            color: .orange,
                            destination: NotificationRootView()
                        )
                        Button(action:{
                            mainCoordinator.didLogout()
                        }){
                            HStack {
                                Image(systemName: "rectangle.portrait.and.arrow.right")
                                    .font(.system(size: 22))
                                    .foregroundColor(.blue)
                                
                                Text("Logout")
                                    .font(.system(size: 17))
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .font(.system(size: 16))
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(14)
                        .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 4)
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
    ProfileRootView(mainCoordinator: MainCoordinator(appCoordinator: AppCoordinator(isLoggedIn: false)))
}
