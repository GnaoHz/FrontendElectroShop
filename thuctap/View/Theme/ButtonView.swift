

import SwiftUI

import SwiftUI

struct AddToCartButton: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: "cart.fill")
                Text("Add to cart")
            }
            .foregroundStyle(.black)
            .bold()
        }
        .padding(8)
        .background(LinearGradient.mixRedOrange)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .padding(.top, 20)
    }
}

struct DeleteButton:View {
    var onDelete: () -> Void
    var body: some View {
        VStack {
            Button(action: onDelete) {
                Image(systemName: "trash.fill")
                    .font(.system(size: 20))
                    .foregroundStyle(.red)
            }
            Spacer(minLength: 0)
        }
    }
}

struct CheckBoxView: View {
    @Binding var isChecked:Bool
    
    var body: some View {
        Image(systemName: isChecked ? "checkmark.square.fill" : "square")
            .foregroundStyle(isChecked ? .red : .black)
            .onTapGesture {
                isChecked.toggle()
            }
    }
}

