

import SwiftUI

struct AddressView: View {
    @State private var searchText: String = ""
    var body: some View {
        ZStack {
            //Color.green.edgesIgnoringSafeArea(.all)
            ScrollView() {
                VStack(spacing:20){
                    AdBannerView()
                    SaleView()
                    PopularView()
                    RecommendView()
                }
            }
            //.background(.white)
            .padding(.top,70)
            SearchBarView(searchText: $searchText)
        }
    }
}
#Preview {
    AddressView()
}
