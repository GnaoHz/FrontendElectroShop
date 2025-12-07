import SwiftUI


enum AppFlow {
    case auth
    case main
}


protocol Coordinator: ObservableObject {
    associatedtype ContentView: View
    func start() -> ContentView
}

final class AppCoordinator: Coordinator {
    @Published var appFlow: AppFlow
    
    init(isLoggedIn:Bool) {
        self.appFlow = isLoggedIn ? .main : .auth
    }
    
    @ViewBuilder
    func start() -> some View {
        Group {
            switch appFlow {
            case .auth:
                AuthCoordinator(appCoordinator: self).start()
            case .main:
                MainCoordinator(appCoordinator: self).start()
            }
        }
    }
    
    func didLoggedIn(){
        appFlow = .main
    }
    func didLoggedOut(){
        appFlow = .auth
    }
}
