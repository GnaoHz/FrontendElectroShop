import Foundation

struct CartItem: Hashable {
    var id:  UUID { product.id }
    var product: Product
    var quantity: Int
    var lineTotal: Double {
        return Double(product.price) * Double(quantity)
        }
}

func calculateTotal(items: [CartItem]) -> String {
    let total = items.reduce(0) { $0 + ($1.product.price * $1.quantity) }
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.groupingSeparator = "."
    return formatter.string(from: NSNumber(value: total)) ?? "\(total)"
}

let cartItemsData: [CartItem] = [
    CartItem(
        product: Product(
            nameImage: "ip1",
            nameProduct: "iPhone 14",
            rating: 4.5,
            price: 999,
            information: "",
            configuration: Configuration(
                ssd: "", battery: "", vga: "", cpu: "", dimensions: "", weight: "", hz: "", security: "", bluetooth: "", operatingSystem: "", webcam: "", brand: "", wifi: "", warranty: "", ram: ""
            ),
            type: .iphone
        ),
        quantity: 1
    ),
    CartItem(
        product: Product(
            nameImage: "ip2",
            nameProduct: "iPhone 14 Pro Max",
            rating: 4.0,
            price: 1299,
            information: "",
            configuration: Configuration(
                ssd: "", battery: "", vga: "", cpu: "", dimensions: "", weight: "", hz: "", security: "", bluetooth: "", operatingSystem: "", webcam: "", brand: "", wifi: "", warranty: "", ram: ""
            ),
            type: .iphone
        ),
        quantity: 1
    )
]

