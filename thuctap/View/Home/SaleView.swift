

import SwiftUI

struct SaleView:View{
    
    var body: some View{
        VStack(alignment: .leading){
            TitleSale()
            DiscountedProductList()
            
        }
        .padding([.horizontal],15)
    }
}
struct TitleSale: View {
    @State var pulse: Bool = false
    var body: some View {
        HStack {
            HStack(){
                Circle()
                    .fill(.yellow)
                    .frame(width: 15, height: 15)
                    .scaleEffect(pulse ? 1.08 : 0.92)
                    .opacity(pulse ? 1 : 0.85)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 0.9).repeatForever(autoreverses: true)) {
                            pulse.toggle()
                        }
                    }
                Image( "sale")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 30)
                
                Text("Special Sale")
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .foregroundStyle(.white)
                    .opacity(pulse ? 1 : 0.5)
                    .animation(.easeInOut(duration: 0.7).repeatForever(),value: pulse)
                Image("fire")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                
            }
            .padding(5)
            .background(RoundedRectangle(cornerRadius: 20).fill(Color.red))
            
            Spacer()
            
            Button(action:{
                    
            }){
                Text("Move")
                Image(systemName: "chevron.right")
            }
            .foregroundStyle(.black)
        }
    }
}

struct DiscountedProductList:View {
    let spacing:CGFloat = UIScreen.main.bounds.width-(UIScreen.screenWidth+25)*2
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            HStack (spacing:spacing){
                DiscountedProductCard()
                
                DiscountedProductCard()
                
                DiscountedProductCard()
            }
            
        }
    }
}

struct DiscountedProductCard: View {
    var imageName: String = "m3"
    var name: String = "Mac 1"
    var discountedPrice: String = "1,000"
    var originalPrice: String = "1,200"
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(
                    width: UIScreen.screenWidth,
                    height: UIScreen.screenWidth / 4 * 3
                )
                .background(.green)
                .padding(.horizontal, 5)
            
            Text(name)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("\(discountedPrice)$")
                        .bold()
                        .foregroundStyle(.red)
                    Text("\(originalPrice)$")
                        .foregroundStyle(.gray)
                        .strikethrough(true, color: .gray)
                }
                
                Spacer()
                
                Text("-20%")
                    .foregroundStyle(.white)
                    .padding(5)
                    .background(Color.red)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding(.horizontal, 15)
            
            AddToCartButton {
                // handle add to cart
            }
        }
        .padding(.vertical, 10)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray.opacity(0.1))
                .stroke(.black, lineWidth: 2)
        )
        .frame(height: 350)
    }
}
#Preview {
    SaleView()
}
