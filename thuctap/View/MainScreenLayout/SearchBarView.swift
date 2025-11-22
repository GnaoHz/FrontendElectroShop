import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    @FocusState private var isFocusTextField: Bool

    // Danh sách gợi ý
    let suggestions: [String] = [
        "Apple", "A2", "Banana", "Cherry", "Date", "Fig", "Grape",
    ]

    // Lọc gợi ý dựa vào text đang nhập
    var filteredSuggestions: [String] {
        if searchText.isEmpty {
            return []
        } else {
            return suggestions.filter {
                $0.lowercased().hasPrefix(searchText.lowercased())
            }
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 10) {
                VStack(alignment:.leading) {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    Spacer(minLength: 0)
                }

                VStack {
                    ZStack {
                        TextField("Search", text: $searchText)
                            .font(.system(size: 20))
                            .padding(.horizontal, 35)
                            .padding(.vertical, 10)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.white)
                                    .shadow(radius: 5)
                            )
                            .focused($isFocusTextField)
                            .onSubmit {
                                print("Search submitted: \(searchText)")
                            }
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.black)
                                .padding(.leading, 8)
                                .onTapGesture {
                                    isFocusTextField = true
                                }
                            Spacer()
                            if !searchText.isEmpty {
                                Button(action: {
                                    searchText = ""
                                    isFocusTextField = false
                                }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.black)
                                }
                                .padding(.trailing, 8)
                            }
                        }
                    }
                    // Hiển thị gợi ý
                    if !filteredSuggestions.isEmpty {
                        ScrollView {
                            VStack(alignment: .leading, spacing: 0) {
                                ForEach(filteredSuggestions, id: \.self) { suggestion in
                                    Text(suggestion)
                                        .font(.system(size: 19))
                                        .padding(10)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(Color.gray)
                                        .onTapGesture {
                                            searchText = suggestion
                                            isFocusTextField = false
                                        }
                                }
                            }
                            .cornerRadius(8)
                            //.shadow(radius: 0)
                        }
                        .frame(maxHeight: 150)
                        //.padding(.horizontal)
                    }
                }

                VStack(alignment:.leading) {
                    NavigationLink(destination: NotificationView()) {
                        Image(systemName: "bell.fill")
                            .font(.system(size: 25))
                            .foregroundColor(.yellow)
                            
                    }
                    .padding(.top,10)
                    Spacer()
                }
            }
            .padding(.vertical, 10)
            .padding(.horizontal)

            
        }
        .background(.blue)
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchText: .constant(""))
    }
}
