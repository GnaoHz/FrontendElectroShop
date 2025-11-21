import Foundation

class ProfileViewModel: ObservableObject {
    @Published var profile: UserProfile
    @Published var errorMessage: String?
    
    init() {
        
        self.profile = UserProfile(
            id: 0,
            userId: 0,
            fullName: "Nguyen Viet Hoang",
            dateOfBirth: Date(),
            gender: .male,
            address: "",
            avatarUrl: "",
            phoneNumber: ""
        )
    }
    
    func fetchProfile(for userId: Int) {
        errorMessage = nil
        
        self.profile = UserProfile(
            id: 101,
            userId: userId,
            fullName: "Nguyen Viet Hoang",
            dateOfBirth: Calendar.current.date(from: DateComponents(year: 2000, month: 8, day: 14))!,
            gender: .male,
            address: "Ha Noi",
            avatarUrl: "",
            phoneNumber: "+84345540868"
        )
    }
}
