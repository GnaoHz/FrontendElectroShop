import SwiftUI
struct PaymentMethodSection: View {
    
    @Binding var selectedPaymentMethod: String
    
    let methods = ["Credit Card", "PayPal", "Apple Pay", "Google Pay"]

    func getIconName(for method: String) -> String {
        switch method {
        case "Credit Card": return "creditcard"
        case "PayPal": return "p.circle.fill"
        case "Apple Pay": return "apple.logo"
        case "Google Pay": return "g.circle.fill"
        default: return ""
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Payment Method")
                .font(.headline)
            
            ForEach(methods, id: \.self) { method in
                HStack {
                 
                    Image(systemName: getIconName(for: method))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                        .foregroundColor(method == "Apple Pay" ? .black : .blue)
                    
                    Text(method)
                        .font(.body)
                    
                    Spacer()
                    
                   
                    Image(systemName: selectedPaymentMethod == method ? "checkmark.circle.fill" : "circle")
                        .foregroundColor(selectedPaymentMethod == method ? .blue : .gray)
                }
                .padding(.vertical, 8)
                .contentShape(Rectangle()) 
                .onTapGesture {
                    selectedPaymentMethod = method
                }
            }
        }
    }
}

