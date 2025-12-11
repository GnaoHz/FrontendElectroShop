import SwiftUI

struct EmptyAddressView: View {
    var body: some View {
        VStack {
            Image("address")
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)

            Text("No address added")
                .font(.largeTitle)
                .foregroundColor(.secondary)
            Button(action: {

            }) {
                HStack {
                    Image(systemName: "plus")
                    Text("Add address")
                }
                .foregroundStyle(.white)
                .bold()
            }
            .padding(15)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(.green)
            )
        }
        .navigationTitle("Address")
        .navigationBarTitleDisplayMode(.inline)
    }
}
#Preview {
    EmptyAddressView()
}
