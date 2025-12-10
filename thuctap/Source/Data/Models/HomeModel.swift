import SwiftUI
struct ContentItem: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let color: Color
    let duration: String
    let likes: Int
}

let adData: [ContentItem] = [
    .init(title: "Special Content 4", description: "View Details", color: Color.orange, duration: "30 min", likes: 450),
    .init(title: "Special Content 5", description: "View Details", color: Color.pink.opacity(0.8), duration: "15 min", likes: 200),
    .init(title: "Special Content 6", description: "View Details", color: Color.green.opacity(0.8), duration: "25 min", likes: 120),
]


let categories: [String] = ["Iphone", "Tablet", "Laptop","PC", "Smartwatch", "Audio","Gaming","Accessory"]

