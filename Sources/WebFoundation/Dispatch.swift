//
//  Dispatch.swift
//  WebFoundation
//
//  Created by Mihael Isaev on 15.11.2020.
//

import FoundationEssentials
import JavaScriptKit

@MainActor public enum Dispatch {
    private static var functions: [String: JSClosure] = [:]
    
    /// Set timeout JavaScript function which executes after 0 seconds.
    /// - Parameter closure: Closure to execute.
    public static func async(_ closure: @escaping @MainActor () -> Void) {
        asyncAfter(0, closure)
    }
    
    /// Set timeout JavaScript function
    /// - Parameters:
    ///   - time: Time in seconds.
    ///   - closure: Closure to execute.
    public static func asyncAfter(_ time: Double, _ closure: @escaping @MainActor () -> Void) {
        #if arch(wasm32)
        let uid = String.shuffledAlphabet(8)
        var function: JSClosure!
        function = .init { _ -> JSValue in
            MainActor.assumeIsolated {
                closure()
                #if JAVASCRIPTKIT_WITHOUT_WEAKREFS
                function.release()
                #endif
                functions[uid] = nil
            }
            return .null
        }
        functions[uid] = function
        _ = JSObject.global.setTimeout!(function, time * 1_000)
        #else
        Task { @MainActor in
            try? await Task.sleep(nanoseconds: UInt64(time) * 1_000_000_000)
            closure()
        }
        #endif
    }
    
    @MainActor public struct IntervalTask {
        let object: JSValue
        let invalidateHandler: @MainActor () -> Void
        
        init (_ object: JSValue, _ invalidateHandler: @escaping @MainActor () -> Void) {
            self.object = object
            self.invalidateHandler = invalidateHandler
        }
        
        public func invalidate() {
            _ = JSObject.global.clearInterval!(object)
        }
    }
    
    /// https://www.w3schools.com/jsref/met_win_setinterval.asp
    public static func interval(_ time: Double, _ closure: @escaping @MainActor (IntervalTask) -> Void) {
        #if arch(wasm32)
        let uid = String.shuffledAlphabet(8)
        var function: JSClosure!
        var timer: JSValue!
        var task: IntervalTask?
        function = .init { _ -> JSValue in
            MainActor.assumeIsolated {
                if let task = task {
                    closure(task)
                } else {
                    task = IntervalTask(timer) {
                        functions[uid] = nil
                        #if JAVASCRIPTKIT_WITHOUT_WEAKREFS
                        function.release()
                        #endif
                    }
                    closure(task!)
                }
            }
            return .null
        }
        functions[uid] = function
        timer = JSObject.global.setInterval!(function, time * 1_000)
        #endif
    }
}
