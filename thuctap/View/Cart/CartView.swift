//
//  CartView.swift
//  thuctap
//
//  Created by NGUYEN VIET HOANG on 15/9/25.
//

import SwiftUI

struct CartView: View {
    @State var isChecked: Bool = true
    var body: some View {
        ZStack(alignment: .topTrailing){
            Color
                .green
                .ignoresSafeArea(edges: .top)
            VStack(spacing:20){
                TitleFontView(titleName: "My Cart",color: .white)
                ListCardView(isChecked: $isChecked)
            }
            if isChecked {
                Button(action: {}) {
                    HStack{
                        Image(systemName: "creditcard.fill")
                            .foregroundStyle(.white)
                        Text("Buy")
                            .foregroundStyle(.white)
                    }
                }
                .padding(11)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.red)
                )
                .padding(.trailing)
            }
            
        }
    }
}

#Preview {
    CartView()
}
