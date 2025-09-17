

import SwiftUI

enum Tab {
    case home, category, cart, favorite, person
}

struct NavigationBarView: View {
    @Binding var selectedTab: Tab
    
    var body: some View {
        HStack {
            Spacer()
            NavigationItem(
                isSelected: selectedTab == .home,
                nameIcon: "house.fill",
                nameFunction: "Home"
            )
            .onTapGesture { selectedTab = .home }
            Spacer()
            NavigationItem(
                isSelected: selectedTab == .category,
                nameIcon: "command.square.fill",
                nameFunction: "Category"
            )
            .onTapGesture { selectedTab = .category }
            Spacer()
            NavigationItem(
                isCenter: true,
                isSelected: selectedTab == .cart,
                nameIcon: "cart.fill",
                nameFunction: "Cart"
            )
            .onTapGesture { selectedTab = .cart }
            Spacer()
            NavigationItem(
                isSelected: selectedTab == .favorite,
                nameIcon: "heart.fill",
                nameFunction: "Favorite"
            )
            .onTapGesture { selectedTab = .favorite }
            Spacer()
            NavigationItem(
                isSelected: selectedTab == .person,
                nameIcon: "person.fill",
                nameFunction: "Person"
            )
            .onTapGesture { selectedTab = .person }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(
            Rectangle()
                .fill(.white)
                .shadow(radius: 5)
        )
    }
}

struct NavigationItem: View {
    var isCenter: Bool = false
    var isSelected: Bool = false
    let nameIcon: String
    let nameFunction: String
    
    var body: some View {
        ZStack {
            if isCenter {
                Circle()
                    .shadow(radius: 5)
                    .frame(width: 70, height: 70)
                Circle()
                    .foregroundStyle(.white)
                    .frame(width: 70, height: 70)
            }
            
            VStack(spacing: 2) {
                Image(systemName: nameIcon)
                    .font(.system(size: 28))
                Text(nameFunction)
                    .font(.system(size: 14))
            }
            
        }
        .foregroundStyle(isSelected ? Color.red : Color.black)
        .offset(y: isCenter ? -10 : 0)
    }
}

#Preview {
    NavigationBarView(selectedTab: .constant(.home))
}
