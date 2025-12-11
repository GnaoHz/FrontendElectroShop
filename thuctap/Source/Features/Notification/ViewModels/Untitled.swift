import SwiftUI

class NotificationViewModel: ObservableObject {
    @Published var notifications: [NotificationItem] = [
        NotificationItem(title: "Your order has been shipped",
                         message: "Order #1234 is on the way!",
                         time: "2 hours ago",
                         isRead: false,
                         type: .order),
        
        NotificationItem(title: "New promotion for you",
                         message: "Get 30% off on your next purchase.",
                         time: "1 day ago",
                         isRead: true,
                         type: .promo),
        
        NotificationItem(title: "System update",
                         message: "We have updated our privacy policy.",
                         time: "3 days ago",
                         isRead: true,
                         type: .system)
    ]
}

