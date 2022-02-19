//
//  DarkModeDetector.swift
//  DOM
//
//  Created by Mihael Isaev on 17.11.2020.
//

import JavaScriptKit

class DarkModeDetector {
    private var closure: JSClosure?
    private lazy var mediaQuery = JSObject.global.window.matchMedia.function!.callAsFunction("(prefers-color-scheme: dark)")
    
    init (_ handler: @escaping (Bool) -> Void) {
        #if arch(wasm32)
        closure = .init { v -> JSValue in
            handler(v.first?.matches.boolean == true)
            return .null
        }
        setJSValue(this: mediaQuery.object!, name: "onchange", value: closure.jsValue())
        handler(mediaQuery.matches.boolean == true)
        #else
        handler(false)
        #endif
    }
}
