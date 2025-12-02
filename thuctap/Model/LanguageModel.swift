

import Foundation

class LanguageSettings: ObservableObject {
    @Published var currentLanguage: Locale = Locale(identifier: "vi")
    
    static func translate(key: String)->String{
        LocalizableManager.localziedString(key: key, locale: currentLanguage)
    }
}
