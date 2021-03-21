//
//  Dispatch.swift
//  WebFoundation
//
//  Created by Mihael Isaev on 15.11.2020.
//

import Foundation
import JavaScriptKit

private var dispatch = Dispatch()

public struct Dispatch {
    fileprivate var functions: [String: JSClosure] = [:]
    
    /// Set timeout JavaScript function which executes after 0 seconds.
    /// - Parameter closure: Closure to execute.
    public static func async(_ closure: @escaping () -> Void) {
        asyncAfter(0, closure)
    }
    
    /// Set timeout JavaScript function
    /// - Parameters:
    ///   - time: Time in seconds.
    ///   - closure: Closure to execute.
    public static func asyncAfter(_ time: Double, _ closure: @escaping () -> Void) {
        #if arch(wasm32)
        let uid = String.shuffledAlphabet(8)
        var function: JSClosure!
        function = .init { _ -> JSValue in
            closure()
            function.release()
            dispatch.functions[uid] = nil
            return .null
        }
        dispatch.functions[uid] = function
        _ = JSObject.global.setTimeout!(function, time * 1_000)
        #else
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(Int(time)), execute: closure)
        #endif
    }
}
