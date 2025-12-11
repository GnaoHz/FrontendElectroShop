import SwiftUI
struct ProcessingView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image("order")
                .resizable()
                .scaledToFit()
                .frame(width: 180)
            
            Text("You have no processing orders")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.black)
            
            Text("Your processing orders will appear here once you place an order.")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .frame(maxWidth: 260)
        }
    }
}

