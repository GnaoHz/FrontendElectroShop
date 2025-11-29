

import SwiftUI


struct ProfileMenuView: View {
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var languageSettings: LanguageSettings
    
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                
                ProfileMenuItemView(
                    nameIcon: "person.fill",
                    colorIcon: .blue,
                    nameItem: local("personalInformation.title"),
                    destination: PersonalInformation()
                )
                
                ProfileMenuItemView(
                    nameIcon: "location.fill",
                    colorIcon: .red,
                    nameItem: local("address.title"),
                    destination: PersonalInformation()
                )
                
                ProfileMenuItemView(
                    nameIcon: "dot.scope",
                    colorIcon: .black,
                    nameItem: local("orderTracking.title"),
                    destination: PersonalInformation()
                )
                
                ProfileMenuItemView(
                    nameIcon: "envelope.fill",
                    colorIcon: .yellow,
                    nameItem: local("changeEmail.title"),
                    destination: PersonalInformation()
                )
                
                ProfileMenuItemView(
                    nameIcon: "lock.fill",
                    colorIcon: .green,
                    nameItem: local("changePassword.title"),
                    destination: ChangePassword()
                )
                
                ProfileMenuItemView(
                    nameIcon: "globe.fill",
                    colorIcon: .blue,
                    nameItem: local("profile.language.title"),
                    destination: Language()
                )
                
                ProfileMenuItemView(
                    nameIcon: "bell.fill",
                    colorIcon: .orange,
                    nameItem: local("notification.title"),
                    destination: NotificationView()
                )
                
                ProfileMenuItemView(
                    nameIcon: "door.left.hand.open",
                    colorIcon: .black,
                    nameItem: local("logout.title"),
                    destination: EmptyView()
                )
                .onTapGesture {
                    self.appState.currentScreen = .login
                }
            }
            .padding()
        }
    }
    
    private func local(_ key: String) -> String {
        LocalizableManager.localziedString(
            key: key,
            locale: languageSettings.currentLanguage
        )
    }
}

struct ProfileMenuItemView<Destination: View>: View {
    var nameIcon: String
    var colorIcon: Color = .black
    var nameItem: String
    var destination: Destination
    
    var body: some View {
        NavigationLink(destination: destination) {
            HStack(spacing:15){
                Image(systemName: nameIcon)
                    .foregroundStyle(colorIcon)
                    .frame(width: 30, height: 30)
                    .background(
                        Circle()
                            .fill(Color.white)
                            .stroke(Color.black, lineWidth: 1)
                    )
                
                Text(nameItem)
                    .font(.system(size: 20, weight: .regular))
                
                Spacer()
                Image(systemName: "chevron.right")
            }
            .padding(10)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .shadow(radius: 5)
            )
            .padding(.all,5)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ProfileMenuView()
        .environmentObject(AppState())
        .environmentObject(UserViewModel())
}
