import SwiftUI

struct PopularCardView: View {
    
    let product: Product
    
    var formattedPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        //formatter.maximumFractionDigits = 0
        //formatter.groupingSeparator = "."
        return formatter.string(from: NSNumber(value: product.price)) ?? "\(product.price)"
    }
    
    var body: some View {
        VStack(spacing: 8) {
            
            Image(product.nameImage)
                .resizable()
                .scaledToFit()
                .frame(height: 120)
                .padding(.top, 10)
            
           
            Text(product.nameProduct)
                .font(.headline.bold())
                .foregroundColor(.black)
            
            RatingView(rating: product.rating)

            Text("\(formattedPrice)$")
                .font(.title3.bold())
                .foregroundColor(Color(red: 0.9, green: 0.2, blue: 0.2))
            
            Spacer()

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
                .padding([.horizontal, .bottom], 12)
            }
        }
        .frame(height: 300)
        .background(Color.white)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
        )
        .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
    }
}

struct PopularContentSection: View {
    let popularData: [Product]
    let gridLayout: [GridItem]
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                Text("Popular ")
                    .font(.title2.bold())
                Spacer()
                NavigationLink(destination: ProductTypeListView(products: popularData)) {
                    Text("See All")
                        .foregroundColor(.blue)
                }
            }
            .padding(.horizontal)
            LazyVGrid(columns: gridLayout, spacing: 20) {
                ForEach(popularData.prefix(2)) { item in
                    PopularCardView(product: item)
                }
            }
            .padding(.horizontal)
        }
    }
}
