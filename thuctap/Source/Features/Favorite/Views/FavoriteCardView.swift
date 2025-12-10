import SwiftUI
struct FavoriteItemRow: View {
    let product: Product
    
    
    func starCount(for rating: Double) -> Int {
        return Int(rating.rounded(.down))
    }

    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .top) {
                
                
                Image( product.nameImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .padding(.trailing, 10)
                
                VStack(alignment: .leading, spacing: 5) {
                    
                    Text(product.nameProduct)
                        .font(.headline)
                    
                    HStack(spacing: 2) {
                        ForEach(1..<6) { index in
                            Image(systemName: index <= starCount(for: product.rating) ? "star.fill" : (Double(index) <= product.rating ? "star.leadinghalf.fill" : "star"))
                                .foregroundColor(.yellow)
                                .font(.caption)
                        }
                    }
                    
                    Text("$\(product.price)")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(.top, 2)
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "trash.fill")
                        .foregroundColor(.red)
                        .padding(5)
                }
            }
            .padding([.horizontal, .top], 15)
            .padding(.bottom, 5)
            
           
            Button {
                
            } label: {
                HStack(spacing: 8) {
                    Image(systemName: "cart.fill")
                    Text("Add to cart")
                        .bold()
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
                .background(
                    LinearGradient(
                        colors: [Color(red: 1.0, green: 0.6, blue: 0.6), Color(red: 0.9, green: 0.3, blue: 0.3)],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .cornerRadius(12)
                .padding( 12)
            }
        }
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        .padding(.horizontal)
    }
}

