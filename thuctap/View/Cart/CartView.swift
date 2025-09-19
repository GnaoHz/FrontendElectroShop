//
//  CartView.swift
//  thuctap
//
//  Created by NGUYEN VIET HOANG on 15/9/25.
//

import SwiftUI

struct CartView: View {
    
    var body: some View {
        ZStack(alignment: .topTrailing){
            Color
                .green
                .ignoresSafeArea(edges: .top)
            VStack(spacing:20){
                TitleFontView(titleName: "My Cart",color: .white)
                ListCardView()
                
            }
        }
    }
}

#Preview {
    CartView()
}
