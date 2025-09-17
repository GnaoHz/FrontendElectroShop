

import SwiftUI

struct ContentView: View {
    @Binding var selectedTab: Tab
    var body: some View {
        switch selectedTab {
        case .home:
            HomeView()
        case .person:
            ProfileView()
        case .favorite:
            FavoriteView()
        case .cart:
            CartView()
        default :
            HomeView()
        }
    }
}

#Preview {
    ContentView(selectedTab: .constant(.home))
}
