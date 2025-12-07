

import SwiftUI

struct TitleFontView: View {
    var titleName: String
    var color: Color = .black
    var body: some View {
        Text(titleName)
            .font(.system(size: 30, weight: .bold, design: .default))
            .foregroundStyle(color)
            //.padding(.bottom,20)
            .frame(maxWidth: .infinity, alignment: .center)
    }
}

#Preview {
    TitleFontView(titleName: "Title")
}
