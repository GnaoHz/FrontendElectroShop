import SwiftUI

struct ProductDetailView: View {
    let product: Product
    @State private var isFavorite = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                productHeader
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Information")
                        .font(.title3)
                        .bold()
                    Text(product.information)
                        .font(.body)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                
                configurationSection
                    .padding(.horizontal)
                
                Spacer(minLength: 40)
            }
        }
        .navigationTitle(product.nameProduct)
        .navigationBarTitleDisplayMode(.inline)
    }
}
extension ProductDetailView {
    
    private var productHeader: some View {
        VStack(spacing: 12) {
            
            Image(product.nameImage)
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .cornerRadius(16)

            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text(product.nameProduct)
                        .font(.title3)
                        .bold()
                    
                    HStack(spacing: 2) {
                        ForEach(0..<5) { _ in
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                                .font(.system(size: 14))
                        }
                    }
                    
                    Text("\(product.price) $")
                        .font(.title3)
                        .foregroundColor(.black)
                        .bold()
                }
                
                Spacer()
                
                Button(action: {
                    isFavorite.toggle()
                }) {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .foregroundColor(.red)
                        .font(.system(size: 26))
                }
            }
            
            Button(action: {}) {
                HStack {
                    Image(systemName: "cart.fill")
                    Text("Add to cart")
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.orange)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.1), radius: 10, y: 4)
        .padding(.horizontal)
    }
}
extension ProductDetailView {
    
    private var configurationSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            Text("Configuration")
                .font(.title3)
                .bold()
            
            configItem(title: "CPU", value: product.configuration.cpu)
            configItem(title: "RAM", value: product.configuration.ram)
            configItem(title: "SSD", value: product.configuration.ssd)
            configItem(title: "VGA", value: product.configuration.vga)
            configItem(title: "Battery", value: product.configuration.battery)
            configItem(title: "Dimensions", value: product.configuration.dimensions)
            configItem(title: "Weight", value: product.configuration.weight)
            configItem(title: "Hz", value: product.configuration.hz)
            configItem(title: "Security", value: product.configuration.security)
            configItem(title: "Bluetooth", value: product.configuration.bluetooth)
            configItem(title: "OS", value: product.configuration.operatingSystem)
            configItem(title: "Webcam", value: product.configuration.webcam)
            configItem(title: "Brand", value: product.configuration.brand)
            configItem(title: "WiFi", value: product.configuration.wifi)
            configItem(title: "Warranty", value: product.configuration.warranty)
        }
    }
    
    private func configItem(title: String, value: String) -> some View {
        HStack(alignment: .top) {
            Text(title)
                .font(.headline)
                .frame(width: 110, alignment: .leading)
            
            Text(value)
                .font(.body)
                .foregroundColor(.gray)
            
            Spacer()
        }
    }
}
