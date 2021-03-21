//
//  Console.swift
//  WebFoundation
//
//  Created by Mihael Isaev on 20.03.2021.
//

import JavaScriptKit

public class Console {
    public static func dir(_ args: JSValue...) {
        JSObject.global.console.dir.function?.callAsFunction(this: JSObject.global.console.object, arguments: args)
    }
}
