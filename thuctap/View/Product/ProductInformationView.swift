//
//  ProductInformationView.swift
//  thuctap
//
//  Created by NGUYEN VIET HOANG on 24/9/25.
//

import SwiftUI

struct ProductInformationView: View {
    let information: String
    
    var body: some View {
        VStack(spacing: 10) {
            Divider()
            HStack {
                Text("Information")
                    .font(.system(size: 25, weight: .bold))
                    .padding(.leading,5)
                Spacer()
            }
            Text(information)
                .font(.body)
            Divider()
        }
        .padding(.leading,5)
    }
}


