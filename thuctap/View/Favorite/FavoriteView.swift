
import SwiftUI

struct FavoriteView: View {
    var body: some View {
        ZStack(alignment: .top) {
            Color
                .green
                .ignoresSafeArea()
            
            VStack(spacing:20){
                TitleFontView(titleName: "Favorite",color: .white)
                ListFavoriteView()
            }
        }
    }
}

#Preview {
    FavoriteView()
}
