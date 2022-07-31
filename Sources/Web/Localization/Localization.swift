//
//  Localization.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation

private var localization = Localization()

public class Localization {
    let currentLocaleIdentifier = WebApp.shared.window.navigator.language?.replacingOccurrences(of: "-", with: "_") ?? "en_US"
    
    var defaultLanguage: Language = .en
    
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
