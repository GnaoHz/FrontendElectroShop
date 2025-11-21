import Foundation

class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var favorites: [Product] = []
    @Published var sales: [Product] = []
    @Published var populars: [Product] = []
    init() {
        loadSampleProducts()
        if let first = products.first {
                favorites.append(first)  
            }
        loadSampleSale()
        loadSamplePopular()
    }
    func toggleFavorite(for product: Product) {
            if let index = favorites.firstIndex(where: { $0.nameProduct == product.nameProduct }) {
                favorites.remove(at: index)
            } else {
                favorites.append(product)
            }
        }
        
    func isFavorite(_ product: Product) -> Bool {
            favorites.contains(where: { $0.nameProduct == product.nameProduct })
        }
    
    func loadSampleProducts() {
        products = [
            Product(
                nameImage: "pc1",
                nameProduct: "Acer Swift",
                rating: 4.5,
                price: 1599,
                information: "Powerful laptop for work and study",
                configuration: Configuration(
                    ssd: "512GB PCIe NVMe SSD (1 slot; upgradable up to 2TB)",
                    battery: "58Whr 3-cell",
                    vga: "Intel Arc Graphics (Onboard)",
                    cpu: "Intel Core Ultra 5 125U (12 cores / 14 threads; 3.6 GHz; 4.3 GHz; 12 MB Intel Smart Cache)",
                    dimensions: "314.4 (W) x 221.9 (D) x 17.5 (H) mm",
                    weight: "1.27 kg",
                    hz: "60 Hz",
                    security: "BIOS user; supervisor; HDD passwords; Kensington lock",
                    bluetooth: "Bluetooth 5",
                    operatingSystem: "Windows 11 Home Single Language",
                    webcam: "FHD Video Conferencing Camera 2M",
                    brand: "ACER",
                    wifi: "Intel® Wireless Wi-Fi 6 AX201",
                    warranty: "12 months",
                    ram: "16GB (2x8GB) LPDDR5 4800 MHz (2 Slots Max 32GB)"
                ),
                type: .laptop
            ),
            Product(
                nameImage: "mb",
                nameProduct: "MacBook Pro 14",
                rating: 4.8,
                price: 2499,
                information: "High performance laptop for professionals",
                configuration: Configuration(
                    ssd: "1TB SSD",
                    battery: "70Whr",
                    vga: "Apple M2 Pro GPU 16-core",
                    cpu: "Apple M2 Pro (10 cores; up to 3.5 GHz)",
                    dimensions: "312 x 221 x 15.5 mm",
                    weight: "1.6 kg",
                    hz: "120 Hz ProMotion",
                    security: "Touch ID; Secure Enclave",
                    bluetooth: "Bluetooth 5.3",
                    operatingSystem: "macOS Sonoma",
                    webcam: "1080p FaceTime HD camera",
                    brand: "Apple",
                    wifi: "Wi-Fi 6E",
                    warranty: "12 months",
                    ram: "16GB Unified Memory"
                ),
                type: .laptop
            ),
            Product(
                nameImage: "lt",
                nameProduct: "Dell XPS 13",
                rating: 4,
                price: 1399,
                information: "Sleek ultrabook with great portability",
                configuration: Configuration(
                    ssd: "512GB NVMe SSD",
                    battery: "55Whr",
                    vga: "Intel Iris Xe Graphics",
                    cpu: "Intel Core i7-1360P (12 cores / 16 threads; up to 5.0 GHz)",
                    dimensions: "295.7 x 198.7 x 14.8 mm",
                    weight: "1.2 kg",
                    hz: "60 Hz",
                    security: "Fingerprint Reader; TPM 2.0",
                    bluetooth: "Bluetooth 5.1",
                    operatingSystem: "Windows 11 Home",
                    webcam: "720p HD camera",
                    brand: "Dell",
                    wifi: "Wi-Fi 6",
                    warranty: "12 months",
                    ram: "16GB LPDDR5 5200 MHz"
                ),
                type: .laptop
            ),
            Product(
                nameImage: "ip1",
                nameProduct: "iPhone 14",
                rating: 4.8,
                price: 999,
                information: "The latest iPhone with advanced camera and performance",
                configuration: Configuration(
                    ssd: "128GB / 256GB / 512GB NVMe Storage",
                    battery: "3279 mAh Li-Ion",
                    vga: "Apple GPU 4-core",
                    cpu: "A15 Bionic chip (6-core CPU; 5-core GPU; 16-core Neural Engine)",
                    dimensions: "146.7 (H) x 71.5 (W) x 7.8 (D) mm",
                    weight: "172 g",
                    hz: "60 Hz",
                    security: "Face ID",
                    bluetooth: "Bluetooth 5.3",
                    operatingSystem: "iOS 17",
                    webcam: "12MP front camera",
                    brand: "Apple",
                    wifi: "Wi‑Fi 6 (802.11ax) with MIMO",
                    warranty: "12 months",
                    ram: "6GB LPDDR4X"
                ),
                type: .iphone
            ),
            Product(
                nameImage: "ip2",
                nameProduct: "iPhone 14 Pro",
                rating: 4.9,
                price: 1199,
                information: "Advanced iPhone with ProMotion display and triple camera system",
                configuration: Configuration(
                    ssd: "128GB / 256GB / 512GB / 1TB NVMe Storage",
                    battery: "3200 mAh Li-Ion",
                    vga: "Apple GPU 5-core",
                    cpu: "A16 Bionic chip (6-core CPU; 5-core GPU; 16-core Neural Engine)",
                    dimensions: "147.5 (H) x 71.5 (W) x 7.85 (D) mm",
                    weight: "206 g",
                    hz: "ProMotion 120 Hz",
                    security: "Face ID",
                    bluetooth: "Bluetooth 5.3",
                    operatingSystem: "iOS 17",
                    webcam: "12MP front camera",
                    brand: "Apple",
                    wifi: "Wi‑Fi 6 (802.11ax) with MIMO",
                    warranty: "12 months",
                    ram: "6GB LPDDR5"
                ),
                type: .iphone
            ),
            Product(
                nameImage: "ip3",
                nameProduct: "iPhone 14 Pro Max",
                rating: 4.9,
                price: 1299,
                information: "The largest and most advanced iPhone with ProMotion display and triple camera system",
                configuration: Configuration(
                    ssd: "128GB / 256GB / 512GB / 1TB NVMe Storage",
                    battery: "4323 mAh Li-Ion",
                    vga: "Apple GPU 5-core",
                    cpu: "A16 Bionic chip (6-core CPU; 5-core GPU; 16-core Neural Engine)",
                    dimensions: "160.7 (H) x 77.6 (W) x 7.85 (D) mm",
                    weight: "240 g",
                    hz: "ProMotion 120 Hz",
                    security: "Face ID",
                    bluetooth: "Bluetooth 5.3",
                    operatingSystem: "iOS 17",
                    webcam: "12MP front camera",
                    brand: "Apple",
                    wifi: "Wi‑Fi 6 (802.11ax) with MIMO",
                    warranty: "12 months",
                    ram: "6GB LPDDR5"
                ),
                type: .iphone
            ),
            Product(
                nameImage: "tablet1",
                nameProduct: "iPad Air 11 (M2)",
                rating: 4.7,
                price: 599,
                information: "Powerful and lightweight tablet for work and entertainment",
                configuration: Configuration(
                    ssd: "128GB / 256GB / 512GB / 1TB (non-upgradable)",
                    battery: "28.93-watt-hour rechargeable lithium-polymer battery",
                    vga: "Apple M2 GPU (8-core)",
                    cpu: "Apple M2 chip (8-core CPU, 8-core GPU, 16-core Neural Engine)",
                    dimensions: "247.6 (H) x 178.5 (W) x 6.1 (D) mm",
                    weight: "462 g (Wi-Fi), 462 g (Wi-Fi + Cellular)",
                    hz: "60 Hz",
                    security: "Touch ID (Top button)",
                    bluetooth: "Bluetooth 5.3",
                    operatingSystem: "iPadOS 17",
                    webcam: "12MP Ultra Wide front camera (landscape), 12MP Wide back camera",
                    brand: "Apple",
                    wifi: "Wi-Fi 6E",
                    warranty: "12 months (Apple Limited Warranty)",
                    ram: "8GB (unified memory)"
                ),
                type: .tablet
            ),
            Product(
                nameImage: "pc2",
                nameProduct: "PC CPS X",
                rating: 4.6,
                price: 1299,
                information: "Powerful desktop PC for work, study, and gaming",
                configuration: Configuration(
                    ssd: "1TB NVMe PCIe Gen4 SSD (2 slots; upgradable)",
                    battery: "N/A (Desktop, uses PSU 650W 80+ Bronze)",
                    vga: "NVIDIA GeForce RTX 3060 12GB",
                    cpu: "Intel Core i5-13400F (10 cores / 16 threads; up to 4.6 GHz)",
                    dimensions: "Mid Tower ATX Case (210 x 450 x 400 mm)",
                    weight: "≈ 7.5 kg",
                    hz: "144 Hz (monitor dependent)",
                    security: "TPM 2.0; Kensington lock support",
                    bluetooth: "Bluetooth 5.2 (via mainboard)",
                    operatingSystem: "Windows 11 Home",
                    webcam: "External (optional)",
                    brand: "CPS",
                    wifi: "Wi-Fi 6 (AX200 module)",
                    warranty: "24 months",
                    ram: "16GB (2x8GB) DDR4 3200 MHz (upgradable to 64GB)"
                ),
                type: .pc
            )
        ]
    }
    func loadSampleSale() {
        sales = [
            Product(
                nameImage: "pc1",
                nameProduct: "Acer Swift",
                rating: 4.5,
                price: 1599,
                information: "Powerful laptop for work and study",
                configuration: Configuration(
                    ssd: "512GB PCIe NVMe SSD (1 slot; upgradable up to 2TB)",
                    battery: "58Whr 3-cell",
                    vga: "Intel Arc Graphics (Onboard)",
                    cpu: "Intel Core Ultra 5 125U (12 cores / 14 threads; 3.6 GHz; 4.3 GHz; 12 MB Intel Smart Cache)",
                    dimensions: "314.4 (W) x 221.9 (D) x 17.5 (H) mm",
                    weight: "1.27 kg",
                    hz: "60 Hz",
                    security: "BIOS user; supervisor; HDD passwords; Kensington lock",
                    bluetooth: "Bluetooth 5",
                    operatingSystem: "Windows 11 Home Single Language",
                    webcam: "FHD Video Conferencing Camera 2M",
                    brand: "ACER",
                    wifi: "Intel® Wireless Wi-Fi 6 AX201",
                    warranty: "12 months",
                    ram: "16GB (2x8GB) LPDDR5 4800 MHz (2 Slots Max 32GB)"
                ),
                type: .laptop
            ),
            Product(
                nameImage: "mb",
                nameProduct: "MacBook Pro 14",
                rating: 4.8,
                price: 2499,
                information: "High performance laptop for professionals",
                configuration: Configuration(
                    ssd: "1TB SSD",
                    battery: "70Whr",
                    vga: "Apple M2 Pro GPU 16-core",
                    cpu: "Apple M2 Pro (10 cores; up to 3.5 GHz)",
                    dimensions: "312 x 221 x 15.5 mm",
                    weight: "1.6 kg",
                    hz: "120 Hz ProMotion",
                    security: "Touch ID; Secure Enclave",
                    bluetooth: "Bluetooth 5.3",
                    operatingSystem: "macOS Sonoma",
                    webcam: "1080p FaceTime HD camera",
                    brand: "Apple",
                    wifi: "Wi-Fi 6E",
                    warranty: "12 months",
                    ram: "16GB Unified Memory"
                ),
                type: .laptop
            )
        ]
    }
    func loadSamplePopular() {
        populars = [
            Product(
                nameImage: "ip1",
                nameProduct: "iPhone 14",
                rating: 4.8,
                price: 999,
                information: "The latest iPhone with advanced camera and performance",
                configuration: Configuration(
                    ssd: "128GB / 256GB / 512GB NVMe Storage",
                    battery: "3279 mAh Li-Ion",
                    vga: "Apple GPU 4-core",
                    cpu: "A15 Bionic chip (6-core CPU; 5-core GPU; 16-core Neural Engine)",
                    dimensions: "146.7 (H) x 71.5 (W) x 7.8 (D) mm",
                    weight: "172 g",
                    hz: "60 Hz",
                    security: "Face ID",
                    bluetooth: "Bluetooth 5.3",
                    operatingSystem: "iOS 17",
                    webcam: "12MP front camera",
                    brand: "Apple",
                    wifi: "Wi‑Fi 6 (802.11ax) with MIMO",
                    warranty: "12 months",
                    ram: "6GB LPDDR4X"
                ),
                type: .iphone
            ),
            Product(
                nameImage: "ip2",
                nameProduct: "iPhone 14 Pro",
                rating: 4.9,
                price: 1199,
                information: "Advanced iPhone with ProMotion display and triple camera system",
                configuration: Configuration(
                    ssd: "128GB / 256GB / 512GB / 1TB NVMe Storage",
                    battery: "3200 mAh Li-Ion",
                    vga: "Apple GPU 5-core",
                    cpu: "A16 Bionic chip (6-core CPU; 5-core GPU; 16-core Neural Engine)",
                    dimensions: "147.5 (H) x 71.5 (W) x 7.85 (D) mm",
                    weight: "206 g",
                    hz: "ProMotion 120 Hz",
                    security: "Face ID",
                    bluetooth: "Bluetooth 5.3",
                    operatingSystem: "iOS 17",
                    webcam: "12MP front camera",
                    brand: "Apple",
                    wifi: "Wi‑Fi 6 (802.11ax) with MIMO",
                    warranty: "12 months",
                    ram: "6GB LPDDR5"
                ),
                type: .iphone
            ),
            Product(
                nameImage: "ip3",
                nameProduct: "iPhone 14 Pro Max",
                rating: 4.9,
                price: 1299,
                information: "The largest and most advanced iPhone with ProMotion display and triple camera system",
                configuration: Configuration(
                    ssd: "128GB / 256GB / 512GB / 1TB NVMe Storage",
                    battery: "4323 mAh Li-Ion",
                    vga: "Apple GPU 5-core",
                    cpu: "A16 Bionic chip (6-core CPU; 5-core GPU; 16-core Neural Engine)",
                    dimensions: "160.7 (H) x 77.6 (W) x 7.85 (D) mm",
                    weight: "240 g",
                    hz: "ProMotion 120 Hz",
                    security: "Face ID",
                    bluetooth: "Bluetooth 5.3",
                    operatingSystem: "iOS 17",
                    webcam: "12MP front camera",
                    brand: "Apple",
                    wifi: "Wi‑Fi 6 (802.11ax) with MIMO",
                    warranty: "12 months",
                    ram: "6GB LPDDR5"
                ),
                type: .iphone
            )
        ]
    }
    
}
