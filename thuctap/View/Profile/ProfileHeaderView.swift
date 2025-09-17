

import SwiftUI
struct ProfileHeaderView: View {
    var body: some View {
        HStack(spacing:0){
            Image("m3")
                .resizable()
            //.aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .padding(.leading,15)
            Spacer()
            VStack(spacing:7) {
                Text("Nguyen Viet Hoang")
                    .font(.system(size: 20, weight: .bold))
                Text(verbatim:"ht98vv@gmail.com")
                    .font(.system(size: 15))
                    .foregroundStyle(.black)
            }
            Spacer()
        }
        .padding([.top,.bottom],15)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                //.stroke(Color.black, lineWidth: 1)
                .shadow(radius: 5)
        )
        .padding(.horizontal,20)
    }
}
#Preview{
    ProfileHeaderView()
    Spacer(minLength: 200)
}
