//
//  PreviewColorScheme.swift
//  Web
//
//  Created by Mihael Isaev on 31.01.2021.
//

#if os(macOS) && canImport(SwiftUI) && DEBUG && !arch(wasm32)
import SwiftUI

public enum PreviewColorScheme {
    case light, dark
    @available(macOS 10.15, *)
    fileprivate var val: SwiftUI.ColorScheme {
        switch self {
        case .light: return .light
        case .dark: return .dark
        }
    }
}
#endif
