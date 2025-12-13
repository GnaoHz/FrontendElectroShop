import SwiftUI

@main
struct thuctapApp: App {
    
    @StateObject var appCoordinator: AppCoordinator

    init() {
        
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
