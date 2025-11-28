import SwiftUI

struct MainScreenView: View {
    @StateObject var profileViewModel = ProfileViewModel()
    @StateObject var userViewModel = UserViewModel()
    @StateObject var productViewModel = ProductViewModel()
    @StateObject var cartViewModel = CartViewModel()
    @State private var selectedTab: Tab = .person
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                ContentView(selectedTab: $selectedTab)
                .frame(maxHeight: .infinity)
                
                NavigationBarView(selectedTab: $selectedTab)
            }
            .ignoresSafeArea(.all, edges: .bottom)
        }
        .environmentObject(profileViewModel)
        .environmentObject(userViewModel)
        .environmentObject(productViewModel)
        .environmentObject(cartViewModel)
    }
}

#Preview {
    @Previewable @StateObject var tempSettings = LanguageSettings()
    
   
    MainScreenView()
        .environmentObject(tempSettings)
      
        .environment(\.locale, tempSettings.currentLanguage)
}
