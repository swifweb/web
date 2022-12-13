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
            #if JAVASCRIPTKIT_WITHOUT_WEAKREFS
            function.release()
            #endif
            dispatch.functions[uid] = nil
            return .null
        }
        dispatch.functions[uid] = function
        _ = JSObject.global.setTimeout!(function, time * 1_000)
        #else
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(Int(time)), execute: closure)
        #endif
    }
    
    public struct IntervalTask {
        let object: JSValue
        let invalidateHandler: () -> Void
        
        init (_ object: JSValue, _ invalidateHandler: @escaping () -> Void) {
            self.object = object
            self.invalidateHandler = invalidateHandler
        }
        
        public func invalidate() {
            _ = JSObject.global.clearInterval!(object)
        }
    }
    
    /// https://www.w3schools.com/jsref/met_win_setinterval.asp
    public static func interval(_ time: Double, _ closure: @escaping (IntervalTask) -> Void) {
        #if arch(wasm32)
        let uid = String.shuffledAlphabet(8)
        var function: JSClosure!
        var timer: JSValue!
        var task: IntervalTask?
        function = .init { _ -> JSValue in
            if let task = task {
                closure(task)
            } else {
                task = IntervalTask(timer) {
                    dispatch.functions[uid] = nil
                }
                closure(task!)
            }
            #if JAVASCRIPTKIT_WITHOUT_WEAKREFS
            function.release()
            #endif
            return .null
        }
        dispatch.functions[uid] = function
        timer = JSObject.global.setInterval!(function, time * 1_000)
        #endif
    }
}
