//
//  DarkModeDetector.swift
//  
//
//  Created by Mihael Isaev on 17.11.2020.
//

import JavaScriptKit

class DarkModeDetector {
    private let closure: JSClosure
    private lazy var mediaQuery = JSObject.global.window.matchMedia.function!.callAsFunction("(prefers-color-scheme: dark)")
    
    init (_ handler: @escaping (Bool) -> Void) {
        closure = .init { v -> Void in
            handler(v.first?.matches.boolean == true)
        }
        setJSValue(this: mediaQuery.object!, name: "onchange", value: closure.jsValue())
        handler(mediaQuery.matches.boolean == true)
    }
    
    deinit { closure.release() }
}
