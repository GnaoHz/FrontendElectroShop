import Foundation

enum Gender: String, Codable {
    case male = "Male"
    case female = "Female"
    case other = "Other"
}

struct UserProfile: Codable, Identifiable {
    let id: Int      
    let userId: Int
    var fullName: String
    var dateOfBirth: Date?
    var gender: Gender
    var address: String?
    var avatarUrl: String?
    var phoneNumber: String?
}

