import SwiftUI



struct CheckoutView: View {
    @Binding var showCheckout : Bool
    
    @State var cartItems: [CartItem] = cartItemsData
    
    var calculatedTotal: Double {
        return cartItems.reduce(0) { $0 + $1.lineTotal }
    }
    
    @State private var selectedPaymentMethod: String = "Credit Card"
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 30) {
                    
                    OrderSummarySection(items: $cartItems, total: calculatedTotal)
                    
                    ShippingAddressSection(addressLines: ["John Doe", "123 Main Street", "New York, NY 10001", "United States"])
                    
                    
                    PaymentMethodSection(selectedPaymentMethod: $selectedPaymentMethod)
                    
                    HStack {
                        Spacer()
                        Button(action:{
                            
                        }){
                            Text("Place Order")
                                
                        }
                        .foregroundStyle(Color.white)
                        .padding(10)
                        .padding(.horizontal,80)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.green)
                        )
                        Spacer()
                    }
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Checkout")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        showCheckout.toggle()
                    }
                    .foregroundStyle(.blue)
                }
            }
        }
    }
}
