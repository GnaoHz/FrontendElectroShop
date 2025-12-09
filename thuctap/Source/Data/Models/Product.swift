import Foundation

struct Product : Identifiable, Hashable{
    var id: UUID = UUID()
    let nameImage: String
    let nameProduct: String
    let rating: Double
    let price: Int
    let information: String
    let configuration: Configuration
    var isfavorite: Bool = false
    let type: ProductType
}

struct Configuration: Hashable {
    let ssd: String
    let battery: String
    let vga: String
    let cpu: String
    let dimensions: String
    let weight: String
    let hz: String
    let security: String
    let bluetooth: String
    let operatingSystem: String
    let webcam: String
    let brand: String
    let wifi: String
    let warranty: String
    let ram: String
}

enum ProductType: String, Hashable, CaseIterable {
    case iphone
    case laptop
    case tablet
    case pc
    case audio
    case smartwatch
    case gaming
    case accessory
}

extension ProductType {
    var displayName: String {
        switch self {
        case .iphone: return "Phone"
        case .tablet: return "Tablet"
        case .laptop: return "Laptop"
        case .pc: return "PC"
        case .audio: return "Audio"
        case .smartwatch: return "Smartwatch"
        case .gaming: return "Gaming"
        case .accessory: return "Accessory"
        }
    }
}



let popularProducts: [Product] = [
    Product(
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
    ),
    Product(
        nameImage: "ip1",
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
    )
]

