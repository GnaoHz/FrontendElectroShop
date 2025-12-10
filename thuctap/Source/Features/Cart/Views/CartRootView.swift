import SwiftUI

struct CartRootView: View {
    @State private var items = cartItemsData
    @State private var showCheckout: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.green.ignoresSafeArea(.all)
            
            VStack(spacing: 0) {
                Text("Cart")
                    .font(.title.bold())
                    .foregroundColor(.white)
                    .padding(.bottom, 20)
                    .frame(maxWidth: .infinity)

                Spacer()
            }

            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {

                    ForEach(items, id: \.self) { index in
                        CartProductCardView(item: index)
                    }

                    Spacer()
                        .frame(height: 100)
                }
                .padding(.top,20)
            }
            .background(
                UnevenRoundedRectangle(
                    topLeadingRadius: 20,
                    topTrailingRadius: 20
                )
                .fill(Color(.systemGray5))

            )
            .padding(.top, 50)

            VStack(spacing: 0) {
                Rectangle()
                    .fill(Color(.systemGray6))
                    .frame(height: 1)

                HStack {
                    VStack(alignment: .leading) {
                        Text("Total:")
                            .font(.title3.bold())
                            .foregroundColor(.black)
                        Text("\(calculateTotal(items: items)) $")
                            .font(.title2.bold())
                            .foregroundColor(.black)
                    }
                    .padding(.leading, 15)

                    Spacer()

                    
                    Button {
                        showCheckout.toggle()
                    } label: {
                        HStack {
                            Image(systemName: "creditcard.fill")
                            Text("Checkout")
                                .bold()
                        }
                        .foregroundColor(.white)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 25)
                        .background(Color.red)  //
                        .cornerRadius(15)
                    }
                    .padding(.trailing, 15)
                }
                .padding(.vertical, 10)
                .background(.white)
            }
        }
        .sheet(isPresented: $showCheckout) {
            CheckoutView(showCheckout: $showCheckout)
                .presentationDetents([.large])
        }
    }
}
