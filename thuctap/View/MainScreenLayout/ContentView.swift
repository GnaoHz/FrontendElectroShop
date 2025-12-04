

import SwiftUI

struct ContentView: View {
    @Binding var selectedTab: Tab
    var body: some View {
        switch selectedTab {
        case .home:
            AddressView()
        case .person:
            ProfileView()
        case .favorite:
            FavoriteView()
        case .cart:
            CartView()
        case .category:
            CategoryView()
        }
    }
}

#Preview {
    ContentView(selectedTab: .constant(.home))
}
