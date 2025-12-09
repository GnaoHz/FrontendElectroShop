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

let popularData: [ContentItem] = [
    .init(title: "Title 1", description: "Description", color: Color.blue, duration: "17 min", likes: 353),
    .init(title: "Title 2", description: "Description", color: Color.green.opacity(0.7), duration: "44 min", likes: 26),
    .init(title: "Title 3", description: "Description", color: Color.red.opacity(0.7), duration: "12 min", likes: 800),
    .init(title: "Title 4", description: "Description", color: Color.purple.opacity(0.7), duration: "5 min", likes: 10),
]

let categories: [String] = ["Iphone", "Tablet", "Laptop","PC", "Smartwatch", "Audio","Gaming","Accessory"]

