import SwiftUI

struct CancelledView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image("order")
                .resizable()
                .scaledToFit()
                .frame(width: 180)
            
            Text("You have no cancelled orders")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.black)
            
            Text("Your cancelled orders will appear here if any order is cancelled.")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .frame(maxWidth: 260)
        }
    }
}

