import SwiftUI

struct AdCardView: View {
    let item: ContentItem
    
    var body: some View {
        NavigationLink(destination: ProductDetailView(product: item.product)) {
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Image(item.nameImage)
                        .resizable()
                        .scaledToFit()
                    Spacer()
                }
                Text(item.title)
                    .font(.title3.bold())
                    .foregroundColor(.white)
                Text(item.description)
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.9))
            }
            .padding()
            .frame(width:200,height: 200)
            .background(item.color)
            .cornerRadius(20)
        }
    }
}

struct AdBannerView: View {
    @State var currentIndex: Int = 0
    let items: [ContentItem]
    var body: some View {
        ScrollViewReader { proxy in
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(items) { item in
                        AdCardView(item: item)
                            .frame(width: UIScreen.main.bounds.width * 0.6)
                    }
                }
            }
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { _ in
                    withAnimation {
                        currentIndex = (currentIndex + 1) % items.count
                        proxy.scrollTo(items[currentIndex].id, anchor: .center)
                    }
                }
            }
        }
        .padding(.top,8)
        HStack(spacing: 8) {
            Spacer()
            ForEach(0..<items.count, id: \.self) { index in
                Circle()
                    .fill(Color.gray.opacity(currentIndex == index ? 1 : 0.3))
                    .frame(width: currentIndex == index ? 10 : 8,
                           height: currentIndex == index ? 10 : 8)
                    .animation(.easeInOut(duration: 0.25), value: currentIndex)
            }
            Spacer()
        }
        .padding(.top,8)
    }
}
