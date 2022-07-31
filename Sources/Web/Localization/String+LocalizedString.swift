//
//  String+LocalizedString.swift
//  Web
//
//  Created by Mihael Isaev on 31.07.2022.
//

import Foundation

extension String {
	public init (_ ls: LocalizedString...) {
		self.init(ls)
	}
	
	public init (_ ls: [LocalizedString]) {
		guard ls.count > 0 else {
			self.init("")
			print("⚠️ Localization: ❌ EMPTY STRING")
			return
		}
		var lsByPrefix: LocalizedString?
		for ls in ls {
			switch ls.type {
			case .short:
				if Localization.current.rawValue.starts(with: ls.language.rawValue) {
					self.init(ls.value)
					return
				}
			case .long:
				if ls.language == Localization.current {
					self.init(ls.value)
					return
				} else if Localization.current.prefix.starts(with: ls.prefix) {
					lsByPrefix = ls
				} else if ls.prefix.starts(with: Localization.current.prefix) {
					lsByPrefix = ls
				}
			}
		}
		if let ls = lsByPrefix {
			self.init(ls.value)
			return
		}
		if let ls = ls.first(where: {
			$0.language.rawValue.contains(Localization.default.rawValue)
				|| $0.prefix == Localization.default.prefix }) {
			self.init(ls.value)
			return
		}
		self.init("❔❔❔")
		print("⚠️ Localization: ❌ UNABLE TO DETECT LOCALE 🤬 set breakpoint here to find that string (current locale: \(Localization.current)")
	}
}

/// Dynamic localized string
public func LString(_ ls: LocalizedString...) -> State<String> {
	LString(ls)
}

/// Dynamic localized string
public func LString(_ ls: [LocalizedString]) -> State<String> {
	let state: State<String> = .init(wrappedValue: .init(ls))
	Localization.currentState.listen {
		state.wrappedValue = .init(ls)
	}
	return state
}
