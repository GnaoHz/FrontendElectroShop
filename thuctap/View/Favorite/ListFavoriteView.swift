

import SwiftUI

struct ListFavoriteView: View {
    @State private var favorites = ["a","b","c","d"]
    
    var body: some View {
        ScrollView{
            VStack(spacing:15){
                ForEach(favorites, id: \.self){item in
                    FavoriteItemView(nameItem: item){
                        if let index = favorites.firstIndex(of: item){
                            favorites.remove(at: index)
                        }
                    }
                    .padding(.horizontal,15)
                }
            }
            .padding(.top,15)
        }
        .frame(maxWidth: .infinity)
        .background(
            UnevenRoundedRectangle(
                topLeadingRadius: 20,
                topTrailingRadius: 20
            )
            .fill(.white)
        )
    }
}
struct FavoriteItemView: View {
    var nameItem: String = "m3"
    var onDelete: () -> Void
    var body: some View {
        HStack(spacing:0){
            Image("gg")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .padding(.leading,5)
            Spacer()
            VStack(spacing:10){
                Text(nameItem)
                    .font(.system(size: 20,weight: .bold))
                TotalRatingView()
                Text("100.000"+"$")
                
            }
            Spacer()
            DeleteButton(onDelete: onDelete)
                .padding(.trailing,5)
        }
        .padding(5)
        .frame(maxWidth:.infinity)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .shadow(radius: 5)
        )
        
    }
}

#Preview {
    ListFavoriteView()
}
