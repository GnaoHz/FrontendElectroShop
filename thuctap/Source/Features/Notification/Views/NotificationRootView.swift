import SwiftUI

struct NotificationRootView: View {
    @StateObject var viewModel = NotificationViewModel()
    
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.notifications) { noti in
                    NotificationRow(item: noti)
                }
                .onDelete(perform: deleteItems)
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Notifications")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        viewModel.notifications.remove(atOffsets: offsets)
    }
}

