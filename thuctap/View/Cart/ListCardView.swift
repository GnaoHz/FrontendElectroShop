//
//  ListCardView.swift
//  thuctap
//
//  Created by NGUYEN VIET HOANG on 16/9/25.
//

import SwiftUI

struct ListCardView: View {
    var totalPrice: Int = 0
    var body: some View {
        VStack(spacing:0) {
            ScrollView{
                CartItemView()
                CartItemView()
                CartItemView()
                CartItemView()
                CartItemView()
                Spacer(minLength: 10)
            }
            .padding([.horizontal,.top],10)
            .scrollIndicators(.hidden)
            HStack{
                Text("Total: \(totalPrice) $")
                Spacer()
                IconTextbutton(icon: "creditcard.fill", text: "Checkout")
            }
            .padding(.horizontal,15)
            .padding(.vertical,10)
            .background(
                Rectangle()
                    .fill(Color.white)
                    .shadow(radius: 5)
            )
            
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(
            UnevenRoundedRectangle(
                topLeadingRadius: 20,
                topTrailingRadius: 20
            )
            .fill(Color.white)
        )
    }
}

struct CartItemView: View {
    var nameIcon: String = "apple"
    var nameItem: String = "quanlytaikhoan"
    var price: Int = 1000
    @State var quantity: Int = 1
    var onDelete: () -> Void = {}
    
    var body: some View {
        HStack(spacing:0){
            Image(nameIcon)
                .resizable()
                .scaledToFit()
                .frame(width: 100,height: 100)
                .background(.gray)
                .padding(.leading,5)
            Spacer()
            VStack(alignment: .leading,spacing: 10){
                Text(nameItem)
                    .font(.system(size: 20,weight: .bold))
                
                TotalRatingView(totalRating: 3.5)
                
                Text("\(price) $")
                    .font(.system(size: 15,weight: .regular))
                QuantitySelectorView(quantity: $quantity)
            }
            Spacer()
            VStack{
                DeleteButton(onDelete: {})
                
            }
                .padding(.trailing,5)
        }
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .padding(5)
                .shadow(radius: 5)
        )
    }
}


#Preview {
    ListCardView()
}
