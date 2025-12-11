import SwiftUI

struct OrderTrackingRootView: View {
    @State private var selectedTab: Int = 0
    
    let tabs = ["Processing", "Delivered", "Cancelled"]
    
    var body: some View {
        VStack(spacing: 0) {
            
            HStack {
                ForEach(0..<tabs.count, id: \.self) { index in
                    Button {
                        selectedTab = index
                    } label: {
                        VStack {
                            Text(tabs[index])
                                .font(.system(size: 16, weight: selectedTab == index ? .bold : .regular))
                                .foregroundColor(selectedTab == index ? .green : .gray)
                            
                            Rectangle()
                                .fill(selectedTab == index ? Color.green : Color.clear)
                                .frame(height: 3)
                                .padding(.top, 4)
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
            }
            .padding(.vertical, 12)
            .background(Color.white)
            
            Divider()
            
            Spacer()
            
            Group {
                switch selectedTab {
                case 0:
                    ProcessingView()
                case 1:
                    DeliveredView()
                default:
                    CancelledView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Spacer()
        }
        .navigationTitle(Text("Order Tracking"))
        
    }
}

#Preview {
    OrderTrackingRootView()
}

