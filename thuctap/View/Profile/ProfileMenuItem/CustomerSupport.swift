import SwiftUI

struct MessageBubbleView: View {
    let message: MessageSupport

    var body: some View {
        HStack {
            if message.isCustomer {
                Spacer()
            }
            VStack(
                alignment: message.isCustomer ? .trailing : .leading,
                spacing: 5
            ) {
                Text(message.content)
                    .padding(10)
                    .background(
                        message.isCustomer
                            ? Color.blue : Color.gray.opacity(0.2)
                    )
                    .foregroundColor(message.isCustomer ? .white : .black)
                    .cornerRadius(15)

                Text(message.timestamp, style: .time)
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }

            if !message.isCustomer {
                Spacer()
            }
        }
        .padding(.horizontal, 10)
    }
}

struct CustomerSupportChatView: View {
    
    @State private var messages: [MessageSupport] = [
        MessageSupport(
            content:
                "Xin chào, đây là bộ phận hỗ trợ khách hàng. Tôi có thể giúp gì cho bạn?",
            isCustomer: false
        )
    ]
    @State private var inputMessage: String = ""
    @State private var lastMessageId: UUID?

    var body: some View {
        VStack {
            ScrollView {
                ScrollViewReader { proxy in
                    ForEach(messages) { message in
                        MessageBubbleView(message: message)
                            .padding(.vertical, 5)
                            .id(message.id)
                    }
                    .onAppear {
                        lastMessageId = messages.last?.id
                    }
                    .onChange(of: lastMessageId) { id in
                        if let id = id {
                            withAnimation {
                                proxy.scrollTo(id, anchor: .bottom)
                            }
                        }
                    }
                }
            }
            HStack {
                TextField(
                    LanguageSettings.shared.translate(key: "customerSupport.inputPlaceholder")
                    ,
                    text: $inputMessage,
                    axis: .vertical
                )
                .textFieldStyle(.roundedBorder)
                .frame(minHeight: 30)

                Button {
                    sendMessage()
                } label: {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(inputMessage.isEmpty ? .gray : .blue)
                }
                .padding(.horizontal, 5)
                .disabled(inputMessage.isEmpty)
            }
            .padding([.horizontal, .vertical])
            .background(Color(.systemGroupedBackground))
        }
        .navigationTitle(
            "Hỗ trợ Trực tuyến"
        )
    }

    private func sendMessage() {
        let content = inputMessage.trimmingCharacters(
            in: .whitespacesAndNewlines
        )
        guard !content.isEmpty else { return }

        let customerMessage = MessageSupport(content: content, isCustomer: true)
        messages.append(customerMessage)
        lastMessageId = customerMessage.id

        inputMessage = ""

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            let responseContent = simpleAIBotResponse(for: content)
            let supportMessage = MessageSupport(
                content: responseContent,
                isCustomer: false
            )
            messages.append(supportMessage)
            lastMessageId = supportMessage.id
        }
    }

    private func simpleAIBotResponse(for message: String) -> String {
        let lowercased = message.lowercased()
        if lowercased.contains("cảm ơn") || lowercased.contains("cám ơn") {
            return "Rất vui được hỗ trợ bạn! Chúc bạn một ngày tốt lành."
        } else if lowercased.contains("sản phẩm") || lowercased.contains("giá")
        {
            return
                "Bạn vui lòng cung cấp mã sản phẩm hoặc tên sản phẩm để chúng tôi kiểm tra thông tin giá và chi tiết nhé."
        } else if lowercased.contains("giao hàng")
            || lowercased.contains("đơn hàng")
        {
            return
                "Bạn vui lòng cung cấp mã đơn hàng để chúng tôi kiểm tra tình trạng giao hàng cho bạn."
        } else {
            return
                "Chúng tôi đã nhận được tin nhắn của bạn. Vui lòng chờ trong giây lát, nhân viên hỗ trợ sẽ phản hồi bạn ngay."
        }
    }
}

#Preview {
    NavigationView {
        CustomerSupportChatView()
            .environmentObject(LanguageSettings())
    }
}
