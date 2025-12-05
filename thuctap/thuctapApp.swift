

import SwiftUI

@main
struct thuctapApp: App {
    @StateObject var appState = AppState()
    @StateObject var languageSettings = LanguageSettings()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(appState)
                .environmentObject(languageSettings)
                .environment(\.locale, languageSettings.currentLanguage)
        }
    }
}
struct RootView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        Group {
            if appState.isLoggedIn {
                MainFlowView()
            } else {
                AuthFlowView()
            }
        }
    }
}
class AppState: ObservableObject {
    @Published var currentScreen: AppScreen = .intro
    @Published var isLoggedIn: Bool = false
}
struct AuthFlowView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        NavigationStack {
            switch appState.currentScreen {
            case .intro:
                IntroView()
            case .login:
                LoginView()
            case .register:
                RegisterView()
            default:
                IntroView()
            }
        }
    }
}
enum AppScreen {
    case intro
    case login
    case register
    case mainscreen
}
struct MainFlowView: View {
    var body: some View {
        NavigationStack {
            MainScreenView()
        }
    }
}
