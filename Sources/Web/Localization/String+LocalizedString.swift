//
//  String+LocalizedString.swift
//  Web
//
//  Created by Mihael Isaev on 31.07.2022.
//

import FoundationEssentials

extension String {
	@MainActor public init (_ ls: LocalizedString...) {
		self.init(ls)
	}
	
	@MainActor public init (_ ls: [LocalizedString]) {
		self.init(renderLocalizedString(ls, current: Localization.current, default: Localization.default))
	}
}

private func renderLocalizedString(
	_ ls: [LocalizedString],
	current: Language,
	default defaultLanguage: Language
) -> String {
		if ls.isEmpty {
			print("⚠️ Localization: ❌ EMPTY STRING")
			return ""
		}
		var lsByPrefix: LocalizedString?
		for ls in ls {
			switch ls.type {
			case .short:
				if current.rawValue.starts(with: ls.language.rawValue) {
					return ls.value
				}
			case .long:
				if ls.language == current {
					return ls.value
				} else if current.prefix.starts(with: ls.prefix) {
					lsByPrefix = ls
				} else if ls.prefix.starts(with: current.prefix) {
					lsByPrefix = ls
				}
			}
		}
		if let ls = lsByPrefix {
			return ls.value
		}
		if let ls = ls.first(where: {
			$0.language.rawValue.contains(defaultLanguage.rawValue)
				|| $0.prefix == defaultLanguage.prefix }) {
			return ls.value
		}
		print("⚠️ Localization: ❌ UNABLE TO DETECT LOCALE 🤬 set breakpoint here to find that string (current locale: \(current)")
		return "❔❔❔"
}

/// Dynamic localized string
@MainActor
public func LString(_ ls: LocalizedString...) -> State<String> {
	LString(ls)
}

/// Dynamic localized string
@MainActor
public func LString(_ ls: [LocalizedString]) -> State<String> {
	let currentState = Localization.currentState
	let defaultState = Localization.shared.defaultStateForLString
	let state: State<String> = .init(
		wrappedValue: renderLocalizedString(
			ls,
			current: currentState.wrappedValue,
			default: defaultState.wrappedValue
		)
	)
	currentState.listen { newCurrent in
		state.wrappedValue = renderLocalizedString(
			ls,
			current: newCurrent,
			default: defaultState.wrappedValue
		)
	}
	return state
}
