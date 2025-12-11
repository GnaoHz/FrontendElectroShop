import Foundation

struct NotificationItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let time: String
    let isRead: Bool
    let type: NotificationType
}

enum NotificationType {
    case order
    case promo
    case system
}
