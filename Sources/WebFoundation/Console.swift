//
//  Console.swift
//  WebFoundation
//
//  Created by Mihael Isaev on 20.03.2021.
//

import JavaScriptKit

public class Console {
    public static func dir(_ args: JSValueConvertible...) {
        JSObject.global.console.dir.function?.callAsFunction(optionalThis: JSObject.global.console.object, arguments: args)
    }
    
    public static func warning(_ args: JSValueConvertible...) {
        JSObject.global.console.warn.function?.callAsFunction(optionalThis: JSObject.global.console.object, arguments: args)
    }
    
    public static func error(_ args: JSValueConvertible...) {
        JSObject.global.console.error.function?.callAsFunction(optionalThis: JSObject.global.console.object, arguments: args)
    }
    
    public static func clear() {
        JSObject.global.console.clear.function?.callAsFunction(optionalThis: JSObject.global.console.object, arguments: [])
    }
}
