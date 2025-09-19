//
//  CategoryView.swift
//  thuctap
//
//  Created by NGUYEN VIET HOANG on 18/9/25.
//

import SwiftUI

struct CategoryView: View {
    @State var searchText: String = ""
    var body: some View {
        ZStack {
            Color
                .green
                .ignoresSafeArea(edges: .top)
            VStack(spacing:0){
                SearchBarView(searchText: $searchText)
                    .padding(.top,1)
                ScrollView( showsIndicators: false){
                    CategoryCard()
                }
                Spacer()
            }
        }
    }
}

#Preview {
    CategoryView()
}
