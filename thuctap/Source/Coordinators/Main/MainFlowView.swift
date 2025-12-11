import SwiftUI

struct MainFlowVỉew: View {
    @ObservedObject var mainCoordinator: MainCoordinator
    @State private var selectedTab: MainScreen = .home
    var body: some View {
            
            TabView(selection: $selectedTab) {

                DashboardView()
                    .tabItem {
                        Label("Home", systemImage: "house.fill")
                    }
                    .tag(MainScreen.home)
                
                CategoryRootView()
                    .tabItem {
                        Label("Category", systemImage: "square.grid.2x2.fill")
                    }
                    .tag(MainScreen.category)
                
                CartRootView()
                    .tabItem {
                        Label("Cart", systemImage: "cart.fill")
                    }
                    .tag(MainScreen.cart)
                    
                
                FavoriteRootView()
                    .tabItem {
                        Label("Favorite", systemImage: "heart.fill")
                    }
                    .tag(MainScreen.favorite)

                
                NavigationStack {
                    ProfileRootView(mainCoordinator: mainCoordinator)
                }
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
                .tag(MainScreen.person)
            }
            
            .onChange(of: selectedTab) { _, newTab in
                mainCoordinator.navigateTo(screen: newTab)
            }
        }
}
#Preview{
    let appC=AppCoordinator(isLoggedIn: false)
    let mainC=MainCoordinator(appCoordinator: appC)
    MainFlowVỉew(mainCoordinator: mainC )
}



