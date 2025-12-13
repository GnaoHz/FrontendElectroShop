import SwiftUI

struct ProductTypeListView: View {

    let products: [Product] 

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(products) { product in
                        ProductRowView(product: product,destination: ProductDetailView(product: product))
                            .padding(.horizontal)
                    }
                }
            }
            
        }
        .navigationTitle("Product")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ProductRowView<Destination: View>: View {
    let product: Product
    let destination: Destination
    var body: some View {
        NavigationLink(destination: destination) {
            HStack(spacing: 16) {
                Image(product.nameImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90, height: 90)
                    .cornerRadius(12)
                
                VStack(alignment: .leading, spacing: 6) {
                    
                    Text(product.nameProduct)
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    HStack(spacing: 2) {
                        ForEach(0..<5) { index in
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                                .font(.system(size: 14))
                        }
                    }
                    
                    Text("\(product.price) $")
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            .padding()
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 4)
        }
    }
}

#Preview {
    ProductTypeListView(products: productIphone)
}
