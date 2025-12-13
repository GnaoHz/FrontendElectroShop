import Foundation
import SwiftUI

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
    
    var categoryColor: Color {
        switch self {
        case .iphone:
            return Color(red: 0.8, green: 0.5, blue: 0.8) // Hồng nhạt
        case .laptop:
            return Color(.blue.opacity(0.65)) // Xanh dương nhạt
        case .tablet:
            return Color(.yellow.opacity(0.7)) // Vàng chanh nhạt
        case .pc:
            return Color(red: 0.8, green: 0.7, blue: 0.95) // Tím nhạt
        case .audio:
            return Color(red: 0.95, green: 0.8, blue: 0.7) // Cam nhạt
        case .smartwatch:
            return Color(red: 0.7, green: 0.95, blue: 0.8) // Xanh ngọc nhạt
        case .gaming:
            return Color(.green.opacity(0.7))
        case .accessory:
            return Color(red: 0.9, green: 0.9, blue: 0.9) // Trắng xám
        }
    }
}

let productIphone: [Product] = [
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

    // -------------------------
    // iPhone 17
    // -------------------------
    Product(
        nameImage: "ip17",
        nameProduct: "iPhone 17",
        rating: 4.7,
        price: 1199,
        information: "Màn hình 6.1 inch OLED Super Retina XDR, chip A19 Bionic.",
        configuration: Configuration(
            ssd: "128GB – 512GB",
            battery: "Lên đến 24 giờ",
            vga: "Apple GPU 6 nhân",
            cpu: "Apple A19 Bionic",
            dimensions: "147 x 71 x 7.7 mm",
            weight: "175g",
            hz: "120Hz ProMotion",
            security: "Face ID",
            bluetooth: "5.4",
            operatingSystem: "iOS 18",
            webcam: "12MP TrueDepth, 48MP sau",
            brand: "Apple",
            wifi: "Wi-Fi 7",
            warranty: "12 tháng",
            ram: "8GB"
        ),
        type: .iphone
    ),

    // -------------------------
    // iPhone 17 Pro
    // -------------------------
    Product(
        nameImage: "ip17p",
        nameProduct: "iPhone 17 Pro",
        rating: 4.8,
        price: 1399,
        information: "Khung titan, màn hình 6.1 inch ProMotion 120Hz, chip A19 Pro.",
        configuration: Configuration(
            ssd: "256GB – 1TB",
            battery: "Lên đến 28 giờ",
            vga: "Apple GPU Pro 8 nhân",
            cpu: "Apple A19 Pro",
            dimensions: "146.6 x 70.9 x 7.6 mm",
            weight: "185g",
            hz: "120Hz ProMotion",
            security: "Face ID",
            bluetooth: "5.4",
            operatingSystem: "iOS 18",
            webcam: "12MP trước, 48MP + 48MP + 12MP sau",
            brand: "Apple",
            wifi: "Wi-Fi 7",
            warranty: "12 tháng",
            ram: "12GB"
        ),
        type: .iphone
    ),

    // -------------------------
    // iPhone 17 Pro Max
    // -------------------------
    Product(
        nameImage: "ip17pm",
        nameProduct: "iPhone 17 Pro Max",
        rating: 4.9,
        price: 1599,
        information: "Màn hình 6.7 inch ProMotion 120Hz, camera tiềm vọng, pin cực lâu.",
        configuration: Configuration(
            ssd: "256GB – 1TB",
            battery: "Lên đến 32 giờ",
            vga: "Apple GPU Pro 8 nhân",
            cpu: "Apple A19 Pro",
            dimensions: "160.7 x 77.6 x 7.8 mm",
            weight: "225g",
            hz: "120Hz ProMotion",
            security: "Face ID",
            bluetooth: "5.4",
            operatingSystem: "iOS 18",
            webcam: "12MP TrueDepth, 48MP + 48MP + 12MP tiềm vọng",
            brand: "Apple",
            wifi: "Wi-Fi 7",
            warranty: "12 tháng",
            ram: "12GB"
        ),
        type: .iphone
    )
]

let popularProducts: [Product] = [
    Product(
        nameImage: "ip17p",
        nameProduct: "iPhone 17 Pro",
        rating: 4.8,
        price: 1399,
        information: "Khung titan, màn hình 6.1 inch ProMotion 120Hz, chip A19 Pro.",
        configuration: Configuration(
            ssd: "256GB – 1TB",
            battery: "Lên đến 28 giờ",
            vga: "Apple GPU Pro 8 nhân",
            cpu: "Apple A19 Pro",
            dimensions: "146.6 x 70.9 x 7.6 mm",
            weight: "185g",
            hz: "120Hz ProMotion",
            security: "Face ID",
            bluetooth: "5.4",
            operatingSystem: "iOS 18",
            webcam: "12MP trước, 48MP + 48MP + 12MP sau",
            brand: "Apple",
            wifi: "Wi-Fi 7",
            warranty: "12 tháng",
            ram: "12GB"
        ),
        type: .iphone
    ),

    // -------------------------
    // iPhone 17 Pro Max
    // -------------------------
    Product(
        nameImage: "ip17pm",
        nameProduct: "iPhone 17 Pro Max",
        rating: 4.9,
        price: 1599,
        information: "Màn hình 6.7 inch ProMotion 120Hz, camera tiềm vọng, pin cực lâu.",
        configuration: Configuration(
            ssd: "256GB – 1TB",
            battery: "Lên đến 32 giờ",
            vga: "Apple GPU Pro 8 nhân",
            cpu: "Apple A19 Pro",
            dimensions: "160.7 x 77.6 x 7.8 mm",
            weight: "225g",
            hz: "120Hz ProMotion",
            security: "Face ID",
            bluetooth: "5.4",
            operatingSystem: "iOS 18",
            webcam: "12MP TrueDepth, 48MP + 48MP + 12MP tiềm vọng",
            brand: "Apple",
            wifi: "Wi-Fi 7",
            warranty: "12 tháng",
            ram: "12GB"
        ),
        type: .iphone
    )
]

let productLaptop: [Product] = [

    Product(
        nameImage: "gigabyte",
        nameProduct: "Gigabyte G5 15",
        rating: 4.4,
        price: 899,
        information: "Laptop gaming hiệu năng cao cho học tập và làm việc.",
        configuration: Configuration(
            ssd: "512GB NVMe SSD",
            battery: "48Wh",
            vga: "NVIDIA GeForce RTX 3050",
            cpu: "Intel Core i5-11400H (6 cores / 12 threads)",
            dimensions: "361 x 259 x 24.9 mm",
            weight: "2.1 kg",
            hz: "144Hz",
            security: "TPM 2.0",
            bluetooth: "5.2",
            operatingSystem: "Windows 11",
            webcam: "720p HD",
            brand: "Gigabyte",
            wifi: "Wi-Fi 6",
            warranty: "24 tháng",
            ram: "16GB DDR4 3200MHz"
        ),
        type: .laptop
    ),

    Product(
        nameImage: "hp15",
        nameProduct: "HP 15",
        rating: 4.2,
        price: 649,
        information: "Laptop mỏng nhẹ phù hợp học sinh, sinh viên và văn phòng.",
        configuration: Configuration(
            ssd: "256GB PCIe NVMe SSD",
            battery: "41Wh",
            vga: "Intel UHD Graphics",
            cpu: "Intel Core i3-1215U",
            dimensions: "358 x 242 x 18 mm",
            weight: "1.69 kg",
            hz: "60Hz",
            security: "Fingerprint sensor",
            bluetooth: "5.0",
            operatingSystem: "Windows 11 Home",
            webcam: "720p HD",
            brand: "HP",
            wifi: "Wi-Fi 5",
            warranty: "12 tháng",
            ram: "8GB DDR4 3200MHz"
        ),
        type: .laptop
    ),

    Product(
        nameImage: "dell16",
        nameProduct: "Dell Inspiron 16",
        rating: 4.6,
        price: 1099,
        information: "Laptop cao cấp màn hình lớn 16 inch, hiệu năng mạnh cho công việc.",
        configuration: Configuration(
            ssd: "512GB PCIe Gen4 SSD",
            battery: "54Wh",
            vga: "Intel Iris Xe Graphics",
            cpu: "Intel Core i7-1260P (12 cores / 16 threads)",
            dimensions: "356.7 x 251.9 x 18.3 mm",
            weight: "1.97 kg",
            hz: "60Hz",
            security: "Fingerprint reader",
            bluetooth: "5.2",
            operatingSystem: "Windows 11",
            webcam: "1080p FHD",
            brand: "Dell",
            wifi: "Wi-Fi 6",
            warranty: "24 tháng",
            ram: "16GB LPDDR5"
        ),
        type: .laptop
    )
]

let productTablet: [Product] = [

    Product(
        nameImage: "tabs9",
        nameProduct: "Samsung Galaxy Tab S9",
        rating: 4.7,
        price: 999,
        information: "Máy tính bảng cao cấp với màn Dynamic AMOLED 2X, hỗ trợ S-Pen.",
        configuration: Configuration(
            ssd: "256GB UFS 4.0",
            battery: "8400mAh",
            vga: "Adreno 740",
            cpu: "Snapdragon 8 Gen 2 for Galaxy",
            dimensions: "254.3 x 165.8 x 5.9 mm",
            weight: "498 g",
            hz: "120Hz AMOLED",
            security: "Samsung Knox, vân tay dưới màn",
            bluetooth: "5.3",
            operatingSystem: "Android 13",
            webcam: "12MP Ultra-wide",
            brand: "Samsung",
            wifi: "Wi-Fi 6E",
            warranty: "12 tháng",
            ram: "12GB LPDDR5X"
        ),
        type: .tablet
    ),

    Product(
        nameImage: "tabs10",
        nameProduct: "Samsung Galaxy Tab S10",
        rating: 4.8,
        price: 1199,
        information: "Hiệu năng hàng đầu, thích hợp giải trí và làm việc đa tác vụ.",
        configuration: Configuration(
            ssd: "512GB UFS 4.0",
            battery: "11200mAh",
            vga: "Adreno 750",
            cpu: "Snapdragon 8 Gen 3",
            dimensions: "285 x 185 x 5.8 mm",
            weight: "580 g",
            hz: "144Hz AMOLED",
            security: "Samsung Knox, vân tay dưới màn",
            bluetooth: "5.4",
            operatingSystem: "Android 14",
            webcam: "12MP Dual",
            brand: "Samsung",
            wifi: "Wi-Fi 7",
            warranty: "12 tháng",
            ram: "16GB LPDDR5X"
        ),
        type: .tablet
    ),


    Product(
        nameImage: "ipadm5",
        nameProduct: "iPad M5",
        rating: 4.9,
        price: 1299,
        information: "iPad thế hệ mới dùng chip Apple M5 cực mạnh, phù hợp sáng tạo nội dung.",
        configuration: Configuration(
            ssd: "256GB NVMe",
            battery: "10.9-inch 8600mAh",
            vga: "Apple 12-core GPU",
            cpu: "Apple M5",
            dimensions: "247.6 x 178.5 x 6.1 mm",
            weight: "460 g",
            hz: "120Hz ProMotion",
            security: "Face ID",
            bluetooth: "5.3",
            operatingSystem: "iPadOS 18",
            webcam: "12MP Center Stage",
            brand: "Apple",
            wifi: "Wi-Fi 6E",
            warranty: "12 tháng",
            ram: "8GB Unified RAM"
        ),
        type: .tablet
    )
]
