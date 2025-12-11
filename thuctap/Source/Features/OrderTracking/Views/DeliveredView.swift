import SwiftUI

struct DeliveredView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image("order")
                .resizable()
                .scaledToFit()
                .frame(width: 180)
            
            Text("You have no delivered orders")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.black)
            
            Text("Your delivered orders will appear here once they are completed.")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .frame(maxWidth: 260)
        }
    }
}

