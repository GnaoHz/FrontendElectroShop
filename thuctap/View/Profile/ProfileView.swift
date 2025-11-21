
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
                    .padding(.bottom,10)
                NavigationStack{
                    ProfileMenuView()
                }
                .background(Color.white)
                .clipShape(
                    UnevenRoundedRectangle(
                        topLeadingRadius: 20,
                        
                        topTrailingRadius: 20
                    )
                )
            }
        }
        
    }
}

#Preview {
    ProfileView()
        .environmentObject(ProfileViewModel())
        .environmentObject(UserViewModel())
}


