
import SwiftUI

struct ProductOverviewView: View {
    @EnvironmentObject var productViewModel: ProductViewModel
    @EnvironmentObject var cartViewModel: CartViewModel
    @Binding var product: Product
    
    var body: some View {
        HStack(spacing:0){
            Image(product.nameImage)
                .resizable()
                .scaledToFit()
                .frame(width: 100,height: 100)
                .padding(.leading,5)
            
            Spacer()
            
            VStack(spacing: 10){
                Text(product.nameProduct)
                    .font(.system(size: 20, weight: .bold))
                
                TotalRatingView(totalRating: product.rating)
                
                Text("\(product.price) $")
                    .font(.system(size: 15, weight: .regular))
                
                AddToCartButton{
                    cartViewModel.add(product: product)
                }
                .offset(x: 0,y:-10)
            }
            
            Spacer()
            
            CustomButton(
                nameIcon: productViewModel.isFavorite(product) ? "heart.fill" : "heart",
                onTap: {
                    productViewModel.toggleFavorite(for: product)
                }
            )
            .padding(.trailing, 5)
        }
        .frame(maxWidth: .infinity)
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .padding(5)
                .shadow(radius: 5)
        )
        .padding(.horizontal)
    }
}


