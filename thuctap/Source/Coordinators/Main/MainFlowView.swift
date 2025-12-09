import SwiftUI

struct MainFlowVỉew: View {
    @ObservedObject var mainCoordinator: MainCoordinator
    @State private var selectedTab: MainScreen = .category
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

                
                ProfileRootView(coordinator: mainCoordinator)
                    .tabItem {
                        Label("Profile", systemImage: "person.fill")
                    }
                    .tag(MainScreen.person)
            }
            
            .onChange(of: selectedTab) { newTab in
                mainCoordinator.navigateTo(screen: newTab)
            }
        }
}
#Preview{
    let appC=AppCoordinator(isLoggedIn: false)
    let mainC=MainCoordinator(appCoordinator: appC)
    MainFlowVỉew(mainCoordinator: mainC )
}



struct HomeRootView: View {
    // Nếu Home cần điều hướng sâu hơn, nó sẽ có HomeCoordinator
    @ObservedObject var coordinator: MainCoordinator
    
    var body: some View {
        // Mỗi Tab nên có NavigationStack riêng (nếu muốn push/pop nội bộ)
        NavigationStack {
            VStack {
                Text("Home Screen (Main Tab)")
                // Ví dụ: Nút chuyển sang Tab khác
                Button("Go to Cart") {
                    coordinator.navigateTo(screen: .cart)
                }
            }
            .navigationTitle("Trang Chủ")
        }
    }
}

// Các View giả lập khác (CategoryRootView, CartRootView, FavoriteRootView)

struct CartRootView: View { var body: some View { Text("Cart Screen") } }
struct FavoriteRootView: View { var body: some View { Text("Favorite Screen") } }

// Giả lập Profile Root View (Nơi có nút Logout)
struct ProfileRootView: View {
    @ObservedObject var coordinator: MainCoordinator
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Profile Screen")
                Button("Logout") {
                    coordinator.didLogout() // Gọi hàm Logout của Coordinator
                }
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            .navigationTitle("Cá Nhân")
        }
    }
}
