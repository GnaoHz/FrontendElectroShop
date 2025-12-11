import SwiftUI

struct NotificationRow: View {
    var item: NotificationItem
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            
            icon
            
            VStack(alignment: .leading, spacing: 6) {
                Text(item.title)
                    .font(.headline)
                    .foregroundStyle(.primary)
                
                Text(item.message)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                Text(item.time)
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            if !item.isRead {
                Circle()
                    .fill(Color.blue)
                    .frame(width: 10, height: 10)
            }
        }
        .padding(.vertical, 12)
    }
    
    private var icon: some View {
        let iconName: String
        let color: Color
        
        switch item.type {
        case .order:
            iconName = "shippingbox"
            color = .blue
        case .promo:
            iconName = "tag.fill"
            color = .green
        case .system:
            iconName = "gearshape.fill"
            color = .gray
        }
        
        return Image(systemName: iconName)
            .font(.system(size: 22))
            .foregroundStyle(color)
    }
}

