

import SwiftUI

struct ProfileMenuView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
            ScrollView {
                VStack(spacing: 15) {
                    ProfileMenuItemView(
                        nameIcon:"person.fill",
                        colorIcon:Color.blue,
                        nameItem: NSLocalizedString("personalInformation.title",comment:""),
                        destination: PersonalInformation()
                    )
                    
                    ProfileMenuItemView(
                        nameIcon:"location.fill",
                        colorIcon:Color.red,
                        nameItem: NSLocalizedString("address.title",comment:""),
                        destination: PersonalInformation()
                    )
                    
                    ProfileMenuItemView(
                        nameIcon:"dot.scope",
                        colorIcon:Color.black,
                        nameItem: NSLocalizedString("orderTracking.title",comment:""),
                        destination: PersonalInformation()
                    )
                    
                    ProfileMenuItemView(
                        nameIcon:"envelope.fill",
                        colorIcon:Color.yellow,
                        nameItem: NSLocalizedString("changeEmail.title",comment:""),
                        destination: PersonalInformation()
                    )
                    
                    ProfileMenuItemView(
                        nameIcon:"lock.fill",
                        colorIcon:Color.green,
                        nameItem: NSLocalizedString("changePassword.title",comment:""),
                        destination: ChangePassword()
                    )
                    ProfileMenuItemView(
                        nameIcon:"globe.fill",
                        colorIcon:Color.blue,
                        nameItem: NSLocalizedString("profile.language.title",comment:""),
                        destination: Language()
                    )
                    
                    ProfileMenuItemView(
                        nameIcon:"bell.fill",
                        colorIcon:Color.orange,
                        nameItem: NSLocalizedString("notification.title",comment:""),
                        destination: NotificationView()
                    )
                    
                   
                    ProfileMenuItemView(
                        nameIcon:"door.left.hand.open",
                        colorIcon:Color.black,
                        nameItem: NSLocalizedString("logout.title",comment:""),
                        destination: EmptyView()
                    )
                    .onTapGesture {
                        self.appState.currentScreen = .login
                    }
                }
                .padding(.all)
            }
            
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
