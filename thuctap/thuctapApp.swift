

import SwiftUI

@main
struct thuctapApp: App {
    @StateObject var appState = AppState()
    var body: some Scene {
        WindowGroup {
            RootView().environmentObject(appState)
        }
    }
}
enum AppScreen {
    case intro
    case login
    case register
    case mainscreen
}

class AppState: ObservableObject {
    @Published var currentScreen: AppScreen = .mainscreen
}

struct RootView: View {
    @EnvironmentObject var appState: AppState
    var body: some View {
        switch appState.currentScreen {
        case .intro:
            IntroView()
        case .login:
            LoginView()
        case .register :
            RegisterView()
        case .mainscreen:
            MainScreenView()
        }
        
    }
}
