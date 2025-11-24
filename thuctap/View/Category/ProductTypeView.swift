import SwiftUI

struct ProductTypeView: View {
    @EnvironmentObject var productViewModel: ProductViewModel
    @State private var selectedProduct: Product? = nil
    let products: [Product]
    var body: some View {
        ScrollView {
            VStack {
                ForEach(products, id: \.id) { product in
                    ProductTypeItemView(product: product)
                        .onTapGesture {
                            selectedProduct = product
                        }
                }
            }
        }
        .padding(.horizontal)
        .navigationDestination(item: $selectedProduct) { selectedProduct in
            if let index = productViewModel.products.firstIndex(where: {
                $0.id == selectedProduct.id
            }) {
                DetailProductView(product: $productViewModel.products[index])
                    
            }
        }
        
    }
}

struct ProductTypeItemView: View {
    let product: Product

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
        }
        .padding(5)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .shadow(radius: 5)
        )
        .padding(5)
        //.navigationBarBackButtonHidden(true)
    }
}
