

import SwiftUI

struct MainScreenView: View {
    @State private var selectedTab: Tab = .category
   
    var body: some View {
        VStack(spacing:0){
            ContentView(selectedTab: $selectedTab)
                .frame(maxHeight: .infinity)
            
            NavigationBarView(selectedTab: $selectedTab)
            
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

#Preview {
    MainScreenView()
}
