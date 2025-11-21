import SwiftUI

struct AdBannerView: View {
    @State private var isShowingFirst = true
    
    var body: some View {
        ZStack {
            if isShowingFirst {
                Image("ip1")
                    .resizable()
                    .scaledToFit()
            } else {
                Image("ip2")
                    .resizable()
                    .scaledToFit()
            }
        }
        .frame(height: 200)
        .onAppear {
            
            Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
                withAnimation(.easeInOut) {
                    isShowingFirst.toggle()
                }
            }
        }
    }
}

struct AdBannerView_Previews: PreviewProvider {
    static var previews: some View {
        AdBannerView()
    }
}
