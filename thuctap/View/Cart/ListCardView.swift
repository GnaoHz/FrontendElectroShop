//
//  ListCardView.swift
//  thuctap
//
//  Created by NGUYEN VIET HOANG on 16/9/25.
//

import SwiftUI

struct ListCardView: View {
    @Binding var isChecked: Bool
    var body: some View {
        VStack(spacing:10) {
            ScrollView{
                CartItemView(isChecked: $isChecked)
                CartItemView(isChecked: $isChecked)
                CartItemView(isChecked: $isChecked)
                CartItemView(isChecked: $isChecked)
                CartItemView(isChecked: $isChecked)
                Spacer(minLength: 20)
            }
            .padding([.horizontal,.top],10)
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
    @Binding var isChecked: Bool
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
                CheckBoxView(isChecked: $isChecked )
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

struct QuantitySelectorView: View {
    @Binding var quantity: Int
    var body: some View {
        HStack{
            Button(action:{
                if quantity>1{
                    quantity -= 1
                }
            }){
                Image(systemName: "minus")
            }
            Text("\(quantity)")
            Button(action:{
                quantity += 1
            }){
                Image(systemName: "plus")
            }
        }
    }
}

#Preview {
    ListCardView(isChecked: .constant(true))
}
