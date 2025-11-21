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

enum ProductType: String, Hashable {
    case iphone
    case laptop
    case tablet
    case pc
    case audio
    case smartwatch
    case gaming
    case accessory
}

