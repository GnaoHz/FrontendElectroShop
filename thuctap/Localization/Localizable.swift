import Foundation
import SwiftUI

class LocalizableManager {
    static func getBundle(for locale: Locale) -> Bundle {
        let currentLanguage = locale.identifier

        guard
            let pathLanguage = Bundle.main.path(
                forResource: currentLanguage,
                ofType: "lproj"
            ), let localeBundle = Bundle(path: pathLanguage)
        else {
            return Bundle.main
        }
        return localeBundle
    }
    
    static func localziedString(key:String,locale:Locale)->String{
        let bundle = getBundle(for: locale)
        return NSLocalizedString(key, bundle: bundle,  comment: "")
    }
}
