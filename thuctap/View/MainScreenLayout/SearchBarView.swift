

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    @FocusState private var isFocusTextField: Bool
    var body: some View {
        HStack{
            Image("logo")
                .resizable()
                .scaledToFit( )
                .frame(width: 50, height: 50)
            
            TextField("Search", text: $searchText)
                
                .padding(.leading, 30)
                .padding(10)
                .background(Color.customGreen.opacity(0.5))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.black)
                            .padding(.leading, 8)
                            .onTapGesture {
                                self.isFocusTextField = true
                            }
                        Spacer()
                    }
                )
                .focused($isFocusTextField)
                .onSubmit {
                    print("123")
                }
            
            Image(systemName: "bell.fill")
                .font(.system(size: 20))
                .onTapGesture {
                    
                }
        }
    }
}

#Preview {
    SearchBarView(searchText: .constant(""))
}
