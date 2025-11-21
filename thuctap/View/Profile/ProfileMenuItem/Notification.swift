

import SwiftUI

struct NotificationCard: View {
    let icon: String
    let title: String
    let message: String
    let date: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(.blue)
                .frame(width: 40, height: 40)
                .background(Color.blue.opacity(0.1))
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(title)
                        .font(.headline)
                    Spacer()
                    Text(date)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Text(message)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
    }
}

struct NotificationView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                NotificationCard(
                    icon: "cart.fill",
                    title: "Order Shipped",
                    message: "Your order #12345 has been shipped.",
                    date: "Today, 10:15"
                )
                
                NotificationCard(
                    icon: "tag.fill",
                    title: "Flash Sale",
                    message: "Up to 50% off on selected laptops!",
                    date: "Today, 08:00"
                )
                
                NotificationCard(
                    icon: "creditcard.fill",
                    title: "Payment Successful",
                    message: "Your payment of $999.00 was successful.",
                    date: "Yesterday"
                )
                
                NotificationCard(
                    icon: "exclamationmark.triangle.fill",
                    title: "System Maintenance",
                    message: "Our system will be under maintenance at 2 AM.",
                    date: "2 days ago"
                )
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
       
    }
}

#Preview {
    NotificationView()
}
