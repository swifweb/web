//
//  Localization.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import FoundationEssentials

@MainActor
public class Localization {
    private static let localization = Localization()

    let currentLocaleIdentifier = WebApp.shared.window.navigator.language.map { language in
        String(language.map { $0 == "-" ? "_" : $0 })
    } ?? "en_US"

    private let defaultLanguageState = State<Language>(wrappedValue: .en)

    var defaultLanguage: Language {
        get { defaultLanguageState.wrappedValue }
        set { defaultLanguageState.wrappedValue = newValue }
    }

    var defaultStateForLString: State<Language> { defaultLanguageState }
    
	@State public internal(set) var currentLanguage: Language = .en
	
	init () {
		currentLanguage = detectCurrentLanguage()
	}
    
    func detectCurrentLanguage() -> Language {
        if let language = Language(rawValue: currentLocaleIdentifier) {
            return language
        }
        if let language = Language(rawValue: Locale.current.identifier) {
            return language
        }
        if let locale = currentLocaleIdentifier.components(separatedBy: "_").first {
            if let language = Language(rawValue: locale) {
                return language
            } else if let locale = locale.components(separatedBy: "-").first, let language = Language(rawValue: locale) {
                return language
            }
        }
        return defaultLanguage
    }
    
    static var shared: Localization { localization }
    
    public static var current: Language {
        get { shared.currentLanguage }
        set { shared.currentLanguage = newValue }
    }
	
	public static var currentState: State<Language> {
		get { shared._currentLanguage }
		set { shared._currentLanguage = newValue }
	}
    
    public static var `default`: Language {
        get { shared.defaultLanguage }
        set { shared.defaultLanguage = newValue }
    }
}
