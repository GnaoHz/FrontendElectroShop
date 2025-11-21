

import SwiftUI

struct HomeView: View {
    @State private var searchText: String = ""
    var body: some View {
        ZStack {
            //Color.green.edgesIgnoringSafeArea(.all)
            ScrollView() {
                VStack(spacing:20){
                    SearchBarView(searchText: $searchText)
                    AdBannerView()
                    SaleView()
                    PopularView()
                    RecommendView()
                }
            }
            
            .background(.white)
            .padding(.top,1)
        }
    }
}
#Preview {
    HomeView()
}
