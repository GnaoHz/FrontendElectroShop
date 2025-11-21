import Foundation

enum UserRole: String, Codable {
    case admin = "Admin"
    case customer = "Customer"
}

enum UserStatus: String, Codable {
    case active = "Active"
    case inactive = "Inactive"
    case banned = "Banned"
}

struct User: Codable, Identifiable {
    let id: Int              // map từ UserId
    let uuid: String         // map từ UserUUID
    var email: String
    
    var role: UserRole
    var status: UserStatus
    let createdAt: Date
    let updatedAt: Date
}

