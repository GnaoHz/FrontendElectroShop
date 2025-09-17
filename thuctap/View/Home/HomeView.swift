

import SwiftUI

struct HomeView: View {
    @State private var searchText: String = ""
    var body: some View {
        ScrollView() {
            VStack(spacing:20){
                SearchBarView(searchText: $searchText)
                SaleView()
                PopularView()
                RecommendView()
            }
        }
    }
}
#Preview {
    HomeView()
}
