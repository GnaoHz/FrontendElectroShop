
import SwiftUI

struct CategoryView: View {
    @EnvironmentObject var productViewModel: ProductViewModel
    @State var searchText: String = ""
    @State var selectedType: ProductType? = nil
    var body: some View {
        ZStack {
            //Color.green.ignoresSafeArea(edges: .top)
            VStack(spacing:0){
                SearchBarView(searchText: $searchText)
                ScrollView(showsIndicators: false){
                    HStack{
                        CategoryCard(nameCategory: "Phone", nameImage: "ip")
                            .onTapGesture { selectedType = .iphone }

                        CategoryCard(nameCategory: "Tablet", nameImage: "ipad", widthImage: 105, heightImage: 105)
                            .onTapGesture { selectedType = .tablet }
                    }

                    HStack{
                        CategoryCard(nameCategory: "Laptop", nameImage: "mac", widthImage: 170, heightImage: 150)
                            .onTapGesture { selectedType = .laptop }

                        CategoryCard(nameCategory: "PC", nameImage: "pc", widthImage: 170, heightImage: 150)
                            .onTapGesture { selectedType = .pc }
                    }

                    HStack{
                        CategoryCard(nameCategory: "Audio", nameImage: "audio", widthImage: 140, heightImage: 150)
                            .onTapGesture { selectedType = .audio }

                        CategoryCard(nameCategory: "Smartwatch", nameImage: "applewatch", widthImage: 110, heightImage: 110)
                            .onTapGesture { selectedType = .smartwatch }
                    }

                    HStack{
                        CategoryCard(nameCategory: "Gaming", nameImage: "xbox", widthImage: 120, heightImage: 120)
                            .onTapGesture { selectedType = .gaming }

                        CategoryCard(nameCategory: "Accessory", nameImage: "hub", widthImage: 100, heightImage: 100)
                            .onTapGesture { selectedType = .accessory }
                    }
                }
                .frame(maxWidth: .infinity)
                .background(.white)
                .navigationDestination(item:$selectedType){selectedType in
                    ProductTypeView(products:
                            productViewModel.products.filter({$0.type == selectedType})
                    )
                }
            }
            .background(.white)
            .padding(.top,1)
        }
    }
}

#Preview {
    CategoryView()
}
