

import SwiftUI

struct PopularView: View {
    var body: some View {
        Title(nameTitle: "Popular")
    }
}
struct Title: View {
    var nameTitle:String=""
    var body: some View {
        HStack{
            Text(nameTitle)
                .font(.system(size: 25, weight: .bold, design: .default))
            Spacer()
            Button(action:{
                    
            }){
                Text("Move")
                Image(systemName: "chevron.right")
            }
            .foregroundStyle(.black)
        }
        .padding(.horizontal)
    }
}
#Preview {
    PopularView()
}
