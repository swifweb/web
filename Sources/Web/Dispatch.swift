//
//  Dispatch.swift
//  
//
//  Created by Mihael Isaev on 15.11.2020.
//

import Foundation
import JavaScriptKit

private var dispatch = Dispatch()

public struct Dispatch {
    fileprivate var functions: [String: JSClosure] = [:]
    
    public static func async(_ closure: @escaping () -> Void) {
        asyncAfter(0, closure)
    }
    
    public static func asyncAfter(_ time: Double, _ closure: @escaping () -> Void) {
        #if arch(wasm32)
        let uid = String.shuffledAlphabet(8)
        var function: JSClosure!
        function = .init { _ -> Void in
            closure()
            function.release()
            dispatch.functions[uid] = nil
        }
        dispatch.functions[uid] = function
        _ = JSObject.global.setTimeout!(function, time * 1_000)
        #else
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(Int(time)), execute: closure)
        #endif
    }
}
