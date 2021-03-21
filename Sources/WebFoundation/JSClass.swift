//
//  JSClass.swift
//  WebFoundation
//
//  Created by Mihael Isaev on 20.03.2021.
//

import JavaScriptKit

public protocol JSClass: class {
    var jsValue: JSValue { get }
    static var instanceConstructor: JSFunction { get }
    
    func isInstanceOf(_ type: JSClass.Type) -> Bool
}

extension JSClass {
    public func isInstanceOf(_ type: JSClass.Type) -> Bool {
        jsValue.object?.isInstanceOf(type.instanceConstructor) ?? false
    }
    
    public func isString() -> Bool {
        jsValue.jsString == nil ? false : true
    }
}

extension JSValue {
    public func isInstanceOf(_ type: JSClass.Type) -> Bool {
        object?.isInstanceOf(type.instanceConstructor) ?? false
    }
    
    public func isString() -> Bool {
        jsString == nil ? false : true
    }
}
