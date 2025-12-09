import SwiftUI


struct DashboardView: View {
    @State private var searchText = ""
    
    private let gridLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 10) {
                
                HeaderView(searchText: $searchText)
                
                AdBannerView(items: adData)
                
                CategoriesSection(categories: categories)
                
                PopularContentSection(popularData: popularProducts, gridLayout: gridLayout)
                
            }
            .padding(.top)
            .padding(.bottom, 100)
        }
    }
}





struct HeaderView: View {
    @Binding var searchText: String
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                Text("Welcome")
                    .font(.largeTitle.bold())
                Spacer()
                Image(systemName: "bell")
                    .font(.title2)
            }
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Search...", text: $searchText)
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            .background(Color(.systemGray6))
            .cornerRadius(10)
        }
        .padding(.horizontal)
    }
}



struct CategoriesSection: View {
    let categories: [String]
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Category")
                .font(.title2.bold())
                .padding(.horizontal)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(categories, id: \.self) { category in
                        Text(category)
                            .font(.subheadline.bold())
                            .foregroundColor(.purple)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 8)
                            .background(Color.purple.opacity(0.15))
                            .clipShape(Capsule())
                    }
                }
                .padding(.horizontal)
                .padding(.bottom,8)
            }
        }
    }
}


#Preview{
   DashboardView()
}
