

import Foundation

class LanguageSettings: ObservableObject {
    static let shared = LanguageSettings()
    
    @Published var currentLanguage: Locale = Locale(identifier: "vi")
    
    func translate(key: String) -> String {
        LocalizableManager.localziedString(key: key, locale: currentLanguage)
    }
}
