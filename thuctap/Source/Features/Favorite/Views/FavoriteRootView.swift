import SwiftUI

struct FavoriteRootView: View {
    @State private var favoriteItems: [FavoriteItem] = favoriteItem

    var body: some View {
        ZStack(alignment: .top) {
            Color(
                red: 0.9,
                green: 0.3,
                blue: 0.3
            ).ignoresSafeArea(.container,edges: .all)

            VStack(spacing: 0) {
                Text("Favarite")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    //.padding(.top, 50)
                    .padding(.bottom, 15)

            }
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(favoriteItems) { item in
                        FavoriteItemRow(product: item.product)
                    }
                    
                }
                .padding(.top, 20)
                .padding(.bottom,20)

            }
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(.systemGray5))
            )
            .padding(.top, 50)
            .ignoresSafeArea(.container,edges:.bottom)
        }
    }
}
