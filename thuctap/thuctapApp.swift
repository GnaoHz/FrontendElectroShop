import SwiftUI

@main
struct thuctapApp: App {
    // AppCoordinator là nguồn duy nhất quản lý các Flows
    @StateObject var appCoordinator: AppCoordinator

    init() {
        // Giả sử kiểm tra trạng thái đăng nhập ban đầu
        let isLoggedInInitialState = UserDefaults.standard.bool(forKey: "user_logged_in")
        
        _appCoordinator = StateObject(wrappedValue: AppCoordinator(
            isLoggedIn: isLoggedInInitialState
        ))
    }

    var body: some Scene {
        WindowGroup {
            // Chỉ cần gọi start() của AppCoordinator
            appCoordinator.start()
                // Truyền AppCoordinator là EnvironmentObject
                .environmentObject(appCoordinator)
                // ⚠️ BỎ LanguageSettings
        }
    }
}
