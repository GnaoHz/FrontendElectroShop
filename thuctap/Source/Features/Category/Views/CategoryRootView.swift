import SwiftUI

struct CategoryRootView: View {
    @State private var searchText = ""
    
    private let gridLayout = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15),
        
    ]
    
    let categories: [ProductType] = ProductType.allCases

    var body: some View {
        ZStack(alignment: .top) {
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    Spacer()
                        .frame(height: 70)

                    Text("Categories")
                        .font(.title2.bold())
                        .padding(.horizontal)
                    
                    LazyVGrid(columns: gridLayout, spacing: 15) {
                        ForEach(categories, id: \.self) { type in
                            let imageName = type.rawValue.lowercased()
                            CategoryCardView(type: type, imageName: imageName)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                }
            }
            
            VStack(spacing: 0) {
                
                HStack {
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
                .padding(.top)
                .padding(.bottom, 8)
                
            }
            .background(.white)
            //.ignoresSafeArea(.container, edges: .top)
        }
    }
}


struct CategoryCardView: View {
    
    let type: ProductType
    
    let imageName: String

    var body: some View {
        VStack(spacing: 15) {
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            Text(type.rawValue.capitalized)
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(.black)
        }
        .frame(height: 150)
        .frame(maxWidth: .infinity)
        .padding(10)
        .background(type.categoryColor)
        .cornerRadius(15)
        .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 3)
    }
}

