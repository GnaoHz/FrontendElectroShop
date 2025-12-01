import SwiftUI

struct MessageSupport: Identifiable, Equatable {
    let id = UUID()
    let content: String
    let timestamp: Date = Date()
    let isCustomer: Bool
}
