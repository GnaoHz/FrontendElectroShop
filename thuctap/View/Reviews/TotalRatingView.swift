

import SwiftUI

struct TotalRatingView: View {
    var totalRating: Double = 4.5
    var body: some View {
        HStack {
            ForEach(0..<5, id: \.self) { index in
                let a=totalRating-Double(index)
                let b=max(min(1,a),0)
                RatingStarView(fillFraction: CGFloat(b))
            }
        }
        
    }
}

struct RatingStarView: View {
    var fillFraction: CGFloat = 0.5
    var body: some View {
        ZStack {
            Image(systemName:"star")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundStyle(.gray)
            Image(systemName:"star.fill")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundStyle(.yellow)
                .mask(
                    GeometryReader { geometry in
                        Rectangle()
                            .frame(
                                width: geometry.size.width*fillFraction
                            )
                    }
                )
        }
    }
}

#Preview {
    TotalRatingView()
}
