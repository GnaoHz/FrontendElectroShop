

import SwiftUI

struct PopularView: View {
    var body: some View {
        VStack {
            Title(nameTitle: "Popular")
            PopularProductList()
        }
        .padding([.horizontal],15)
    }
}
struct Title: View {
    var nameTitle:String=""
    var body: some View {
        HStack{
            Text(nameTitle)
                .font(.system(size: 25, weight: .bold, design: .default))
            Spacer()
            Button(action:{
                    
            }){
                Text("Move")
                Image(systemName: "chevron.right")
            }
            .foregroundStyle(.black)
        }
        .padding(.horizontal)
    }
}
struct PopularProductList:View {
    @EnvironmentObject var cartViewModel:CartViewModel
    @EnvironmentObject var productViewModel:ProductViewModel
    let spacing:CGFloat = UIScreen.main.bounds.width-(UIScreen.screenWidth+25)*2
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            HStack (spacing:spacing){
                ForEach(productViewModel.populars,id:\.id){product in
                    PopularProductCard(
                        imageName: product.nameImage,
                        name: product.nameProduct,
                        discountedPrice: product.price
                    ){
                        cartViewModel.add(product: product)
                    }
                }
            }
            
        }
    }
}

struct PopularProductCard: View {
    var imageName: String = "m3"
    var name: String = "Mac 1"
    var discountedPrice: Int = 1000
    var rating: Double = 4.5
    var onTap: (() -> Void)
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(
                    width: UIScreen.screenWidth,
                    height: UIScreen.screenWidth / 4 * 3
                )
                //.background(.green)
                .padding(.horizontal, 5)
            
            Text(name)
            TotalRatingView(totalRating: rating)
                .font(.system(size:15))
            HStack {
                VStack(alignment: .leading) {
                    Text("\(discountedPrice)$")
                        .bold()
                        .foregroundStyle(.red)
                   
                }
                
            }
            .padding(.horizontal, 15)
            
            AddToCartButton {
                onTap()
            }
        }
        .padding(.vertical, 10)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray.opacity(0.1))
                .stroke(.black, lineWidth: 2)
        )
        .frame(height: 350)
    }
}
#Preview {
    PopularView()
}
