//


import SwiftUI

extension Color {
    static let customGreen = Color(red: 114/255, green: 174/255, blue: 164/255)
    
    
}
extension LinearGradient {
    static let mixRedOrange = LinearGradient(
        colors: [
            Color(red: 251/255, green: 128/255, blue: 128/255),
            Color(red: 253/255, green: 193/255, blue: 104/255)
        ],
        startPoint: .leading,
        endPoint: .trailing
    )
}

//.foregroundColor(Color(red: 114/255, green: 174/255, blue: 164/255))
