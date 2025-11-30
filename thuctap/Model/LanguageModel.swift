

import Foundation

class LanguageSettings: ObservableObject {
    @Published var currentLanguage: Locale = Locale(identifier: "vi")
}
