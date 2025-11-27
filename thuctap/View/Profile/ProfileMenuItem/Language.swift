

import SwiftUI

struct Language: View {
    @EnvironmentObject var languageSettings: LanguageSettings
        
        var body: some View {
            VStack(spacing: 20) {
                // Text sẽ tự động dịch dựa trên Locale mới nhất
                Text("personalInformation.title")
                    .font(.largeTitle)
                
                Text("personalInformation.title")
                
                Button("Switch to English") {
                    // Cập nhật giá trị, kích hoạt làm mới giao diện
                    languageSettings.currentLanguage = Locale(identifier: "en")
                }
                .buttonStyle(.borderedProminent)
                
                Button("Switch to Vietnamese") {
                    languageSettings.currentLanguage = Locale(identifier: "vi")
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
}

#Preview {
    
    @Previewable @StateObject var tempSettings = LanguageSettings()
    
   
    Language()
        .environmentObject(tempSettings)
      
        .environment(\.locale, tempSettings.currentLanguage)
}
