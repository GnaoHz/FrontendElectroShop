import SwiftUI

struct DetailProductView: View {
    @EnvironmentObject var productViewModel: ProductViewModel
    @Binding var product: Product
    @State var quantity: Int = 1
    var onTap: () -> Void = {}
    
    var body: some View {
        VStack {
            ProductOverviewView(product: $product)
            ScrollView {
                VStack(spacing: 10) {
                    ProductInformationView(information: product.information)
                    ProductConfigurationView(configuration: product.configuration)
                }
            }
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
    }
}


