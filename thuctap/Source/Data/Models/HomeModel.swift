import SwiftUI
struct ContentItem: Identifiable {
    let id = UUID()
    let title: String
    let nameImage: String
    let description: String
    let color: Color
    let duration: String
    let likes: Int
    let product:Product
    
}

let adData: [ContentItem] = [
    .init(title: "Iphone 17 Pro",nameImage: "ip17p", description: "View Details", color: Color.orange, duration: "30 min", likes: 450,product: productIphone[2]),
    .init(title: "Samsung Tab s9",nameImage: "tabs9", description: "View Details", color: Color.pink.opacity(0.8), duration: "15 min", likes: 200,product: productTablet.first!),
    .init(title: "Laptop Dell 16",nameImage: "dell16", description: "View Details", color: Color.green.opacity(0.8), duration: "25 min", likes: 120,product: productLaptop[2])
]


let categories: [String] = ["Iphone", "Tablet", "Laptop","PC", "Smartwatch", "Audio","Gaming","Accessory"]

