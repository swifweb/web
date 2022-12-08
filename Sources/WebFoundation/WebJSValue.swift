//
//  WebJSValue.swift
//  WebFoundation
//
//  Created by Mihael Isaev on 24.02.2021.
//

import JavaScriptKit

public protocol WebJSValue {
    #if arch(wasm32)
    var webValue: JSValue { get }
    #else
    var webValue: String { get }
    #endif
}

extension Optional: WebJSValue where Wrapped: WebJSValue {
    #if arch(wasm32)
    public var webValue: JSValue {
        switch self {
        case .none: return .null
        case .some(let v): return v.webValue
        }
    }
    #else
    public var webValue: String {
        switch self {
        case .none: return "null"
        case .some(let v): return v.webValue
        }
    }
    #endif
}

extension Bool: WebJSValue {
    #if arch(wasm32)
    public var webValue: JSValue { jsValue }
    #else
    public var webValue: String { "\(self)" }
    #endif
}

extension Int: WebJSValue {
    #if arch(wasm32)
    public var webValue: JSValue { jsValue }
    #else
    public var webValue: String { "\(self)" }
    #endif
}

extension UInt: WebJSValue {
    #if arch(wasm32)
    public var webValue: JSValue { jsValue }
    #else
    public var webValue: String { "\(self)" }
    #endif
}

extension Float: WebJSValue {
    #if arch(wasm32)
    public var webValue: JSValue { jsValue }
    #else
    public var webValue: String { "\(self)" }
    #endif
}

extension Double: WebJSValue {
    #if arch(wasm32)
    public var webValue: JSValue { jsValue }
    #else
    public var webValue: String { "\(self)" }
    #endif
}

extension String: WebJSValue {
    #if arch(wasm32)
    public var webValue: JSValue { jsValue }
    #else
    public var webValue: String { self }
    #endif
}

extension UInt8: WebJSValue {
    #if arch(wasm32)
    public var webValue: JSValue { jsValue }
    #else
    public var webValue: String { "\(self)" }
    #endif
}

extension UInt16: WebJSValue {
    #if arch(wasm32)
    public var webValue: JSValue { jsValue }
    #else
    public var webValue: String { "\(self)" }
    #endif
}

extension UInt32: WebJSValue {
    #if arch(wasm32)
    public var webValue: JSValue { jsValue }
    #else
    public var webValue: String { "\(self)" }
    #endif
}

extension UInt64: WebJSValue {
    #if arch(wasm32)
    public var webValue: JSValue { jsValue }
    #else
    public var webValue: String { "\(self)" }
    #endif
}

extension Int8: WebJSValue {
    #if arch(wasm32)
    public var webValue: JSValue { jsValue }
    #else
    public var webValue: String { "\(self)" }
    #endif
}

extension Int16: WebJSValue {
    #if arch(wasm32)
    public var webValue: JSValue { jsValue }
    #else
    public var webValue: String { "\(self)" }
    #endif
}

extension Int32: WebJSValue {
    #if arch(wasm32)
    public var webValue: JSValue { jsValue }
    #else
    public var webValue: String { "\(self)" }
    #endif
}

extension Int64: WebJSValue {
    #if arch(wasm32)
    public var webValue: JSValue { jsValue }
    #else
    public var webValue: String { "\(self)" }
    #endif
}
