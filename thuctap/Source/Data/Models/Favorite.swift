import Foundation


struct FavoriteItem: Identifiable{
    var id:  UUID { product.id }
    var product: Product
    
}

let favoriteItem : [FavoriteItem] = [
    FavoriteItem(product: Product(
        nameImage: "ip1",
        nameProduct: "iPhone 14",
        rating: 4.5,
        price: 999,
        information: "Màn hình 6.1 inch Liquid Retina XDR.",
        configuration: Configuration(
            ssd: "N/A", battery: "Lên đến 20 giờ", vga: "Apple GPU", cpu: "Apple A15 Bionic",
            dimensions: "146.7 x 71.5 x 7.8 mm", weight: "172g", hz: "60Hz", security: "Face ID",
            bluetooth: "5.3", operatingSystem: "iOS", webcam: "12MP", brand: "Apple",
            wifi: "Wi-Fi 6", warranty: "12 tháng", ram: "6GB"
        ),
        type: .iphone
    )),
    FavoriteItem(product: Product(
        nameImage: "ip2",
        nameProduct: "iPhone 14 Pro",
        rating: 4.0,
        price: 1199,
        information: "Màn hình 6.7 inch ProMotion, Dynamic Island.",
        configuration: Configuration(
            ssd: "N/A", battery: "Lên đến 23 giờ", vga: "Apple GPU (5-core)", cpu: "Apple A16 Bionic",
            dimensions: "160.7 x 77.6 x 7.85 mm", weight: "240g", hz: "120Hz", security: "Face ID",
            bluetooth: "5.3", operatingSystem: "iOS", webcam: "48MP", brand: "Apple",
            wifi: "Wi-Fi 6", warranty: "12 tháng", ram: "6GB"
        ),
        type: .iphone
    ))
]
