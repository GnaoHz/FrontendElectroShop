//
//  CategoryCard.swift
//  thuctap
//
//  Created by NGUYEN VIET HOANG on 18/9/25.
//

import SwiftUI

struct CategoryCard: View {
    var nameCategory: String = "Apple"
    var nameImage: String = "apple"
    var widthImage: CGFloat = 150
    var heightImage: CGFloat = 150
    var body: some View {
        ZStack {
            Image(nameImage)
                .resizable()
                .frame(width: widthImage, height: heightImage)
                
            Text(nameCategory)
                .offset(x: 0, y: -65)
        }
        .frame(width: 145, height: 142)
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.orange.opacity(0.4))
        )
    }
}

#Preview {
    CategoryCard()
}
