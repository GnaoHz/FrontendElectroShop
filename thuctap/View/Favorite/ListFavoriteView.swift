import SwiftUI

struct ListFavoriteView: View {
    @EnvironmentObject var productViewModel: ProductViewModel
    @State private var selectedProduct: Product? = nil
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: 15) {
                    ForEach(productViewModel.favorites, id: \.nameProduct) { product in
                        FavoriteItemView(product: product) {
                            productViewModel.toggleFavorite(for: product)
                        }
                        .onTapGesture {
                            selectedProduct = product
                        }
                        .padding(.horizontal, 15)
                    }
                }
                .padding(.top, 15)
            }
            .navigationDestination(item: $selectedProduct) { product in
                if let index = productViewModel.products.firstIndex(where: { $0.id == product.id }) {
                    
                    DetailProductView(product: $productViewModel.products[index])
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
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
    let product: Product
    var onDelete: () -> Void
    
    var body: some View {
        HStack(spacing: 0) {
            Image(product.nameImage)
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding(.leading, 5)
            
            Spacer()
            
            VStack(spacing: 10) {
                Text(product.nameProduct)
                    .font(.system(size: 20, weight: .bold))
                
                TotalRatingView(totalRating: product.rating)
                
                Text("\(product.price) $")
            }
            Spacer()
            CustomButton(onTap: onDelete)
                .padding(.trailing, 5)
        }
        .padding(5)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .shadow(radius: 5)
        )
    }
}

#Preview {
    NavigationStack {
        ListFavoriteView()
            .environmentObject(ProductViewModel())
    }
}
