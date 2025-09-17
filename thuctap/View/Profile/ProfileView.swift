
import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack(alignment: .top){
            Color
                .green
                .ignoresSafeArea()
            
            VStack(spacing:10){
                TitleFontView(titleName: "Profile",color: .white)
                ProfileHeaderView()
                ProfileMenuView()
                
            }
        }
    }
}

#Preview {
    ProfileView()
}


