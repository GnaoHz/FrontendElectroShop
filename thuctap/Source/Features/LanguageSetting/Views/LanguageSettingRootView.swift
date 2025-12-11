import Foundation

struct LanguageOption: Identifiable {
    let id = UUID()
    let code: String
    let name: String
    let flag: String
}

import SwiftUI

struct LanguageSettingRootView: View {
    
    @AppStorage("app_language") private var selectedLanguage: String = "en"
    
    let options = [
        LanguageOption(code: "en", name: "English", flag: "🇺🇸"),
        LanguageOption(code: "vi", name: "Vietnamese", flag: "🇻🇳")
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Choose your preferred language for the app interface.")
                .foregroundColor(.black)
                .font(.subheadline)
            
            ForEach(options) { option in
                Button {
                    selectedLanguage = option.code
                } label: {
                    HStack {
                        Text(option.flag)
                            .font(.system(size: 26))
                        
                        Text(option.name)
                            .font(.system(size: 18))
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        if selectedLanguage == option.code {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                                .font(.system(size: 22))
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.1), radius: 3, x: 0, y: 2)
                }
            }
            
            Spacer()
        }
        .padding()
        .background(Color(UIColor.systemGroupedBackground))
        .navigationTitle(Text("Language"))
    }
}

#Preview {
    LanguageSettingRootView()
}
