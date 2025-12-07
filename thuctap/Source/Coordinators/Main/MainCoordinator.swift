

import SwiftUI

enum MainScreen{
    case home, category, cart, favorite, person
}

final class MainCoordinator: ObservableObject {
    @Published var currrentScreen: MainScreen = .home
    
    private var appCoordinator: AppCoordinator
    
    init(appCoordinator: AppCoordinator){
        self.appCoordinator = appCoordinator
    }
    
    @ViewBuilder
    func start() -> some View {
        
    }
    
    
}
