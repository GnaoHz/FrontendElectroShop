import SwiftUI

struct ShippingAddressSection: View {
    let addressLines: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Shipping Address")
                .font(.headline)

            VStack(alignment: .leading, spacing: 5) {
                
                VStack(alignment: .leading, spacing: 3) {
                    
                    Text(addressLines.first ?? "")
                        .fontWeight(.bold)
                    
                    
                    ForEach(addressLines.dropFirst(), id: \.self) { line in
                        Text(line)
                    }
                }
                .frame(maxWidth: .infinity,alignment:.leading)
                .padding()
                .background(Color(.systemGray6)) 
                .cornerRadius(10)
            }
        }
    }
}
