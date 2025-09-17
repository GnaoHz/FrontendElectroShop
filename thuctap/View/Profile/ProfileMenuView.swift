

import SwiftUI

struct ProfileMenuView: View {
    var body: some View {
        ScrollView{
            VStack(spacing: 15){
                ProfileMenuItemView(
                    nameIcon:"person.fill",
                    colorIcon:Color.blue,
                    nameItem: "Personal Information"
                )
                ProfileMenuItemView(
                    nameIcon:"location.fill",
                    colorIcon:Color.red,
                    nameItem: "Address"
                )
                ProfileMenuItemView(
                    nameIcon:"dot.scope",
                    colorIcon:Color.black,
                    nameItem: "Oder Tracking"
                )
                ProfileMenuItemView(
                    nameIcon:"envelope.fill",
                    colorIcon:Color.yellow,
                    nameItem: "Change email"
                )
                ProfileMenuItemView(
                    nameIcon:"lock.fill",
                    colorIcon:Color.green,
                    nameItem: "Change password"
                )
                ProfileMenuItemView(
                    nameIcon:"bell.fill",
                    colorIcon:Color.orange,
                    nameItem: "Notification"
                )
                ProfileMenuItemView(
                    nameIcon:"door.left.hand.open",
                    colorIcon:Color.black,
                    nameItem: "Logout"
                )
            }
        }
        .padding(.all)
        .background(
            UnevenRoundedRectangle(
                topLeadingRadius: 20,
                topTrailingRadius: 20
            )
            .fill(Color.white)
        )
        .padding(.top,10)
    }
}

struct ProfileMenuItemView:View {
    var nameIcon:String
    var colorIcon = Color.black
    var nameItem:String
    var body: some View {
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
}

#Preview {
    ProfileMenuView()
}
