import Foundation

class UserViewModel: ObservableObject {
    @Published var user: User?
    @Published var errorMessage: String?

    func fetchUser(by uuid: String) {
        errorMessage = nil
        
        self.user = User(
            id: 1,
            uuid: uuid,
            email: "ht98vv@gmail.com",
            
            role: .customer,
            status: .active,
            createdAt: Date(),
            updatedAt: Date()
        )
    }
}
