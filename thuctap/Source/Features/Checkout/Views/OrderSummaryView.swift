import SwiftUI


struct OrderSummarySection: View {
    @Binding var items: [CartItem]
    let total: Double

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Order Summary")
                .font(.headline)
                .padding(.bottom, 5)


            ForEach(items, id: \.self) { item in
                HStack {
                    
                    Text("\(item.quantity)x \(item.product.nameProduct)")
                        .foregroundColor(.gray)
                    Spacer()
                    Text("$\(item.lineTotal, specifier: "%.2f")")
                }
            }

            // Tổng cộng
            Divider()
            HStack {
                Text("Total")
                    .font(.title3)
                    .fontWeight(.bold)
                Spacer()
                Text("$\(total, specifier: "%.2f")")
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
    }
}
