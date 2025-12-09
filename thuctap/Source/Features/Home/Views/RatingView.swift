import SwiftUI

struct RatingView: View {
    
    let rating: Double
    let maxRating: Int = 5

    var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<maxRating, id: \.self) { index in
                Image(systemName: starType(for: index))
                    .foregroundColor(.yellow)
                    .font(.caption)
            }
        }
    }

    private func starType(for index: Int) -> String {
        let starValue = Double(index) + 1.0
        
        if starValue <= rating {
            return "star.fill"
        } else if starValue - 0.5 <= rating {
            return "star.leadinghalf.fill"
        } else {
            return "star"
        }
    }
}

