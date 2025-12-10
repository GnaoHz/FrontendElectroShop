import SwiftUI

struct CartProductCardView: View {
    @State var item: CartItem 
    var formattedPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        formatter.groupingSeparator = "."
        return formatter.string(from: NSNumber(value: item.product.price)) ?? "\(item.product.price)"
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            
            Image(item.product.nameImage)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .padding(.trailing, 5)
            
            VStack(alignment: .leading, spacing: 5) {
                
                Text(item.product.nameProduct)
                    .font(.headline.bold())
                    .foregroundColor(.black)
                
                RatingView(rating: item.product.rating)
                
                Text("\(formattedPrice) $")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                HStack(spacing: 15) {
                    Button { if item.quantity > 1 { item.quantity -= 1 } } label: {
                        Text("—")
                            .font(.subheadline)
                    }
                    Text("\(item.quantity)")
                        .font(.headline)
                    Button { item.quantity += 1 } label: {
                        Text("+")
                            .font(.subheadline)
                    }
                }
                .foregroundColor(.blue)
                .padding(.top, 5)
            }
            
            Spacer()
            
            
            Button {
                
            } label: {
                Image(systemName: "trash.fill")
                    .foregroundColor(.red)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 3)
        .padding(.horizontal)
    }
}

