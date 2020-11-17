//
//  File.swift
//  
//
//  Created by Mihael Isaev on 16.11.2020.
//

public protocol Stateable: AnyState {
    associatedtype Value
    
    var wrappedValue: Value { get set }
    
    func beginTrigger(_ trigger: @escaping () -> Void)
    func endTrigger(_ trigger: @escaping () -> Void)
    func listen(_ listener: @escaping (_ old: Value, _ new: Value) -> Void)
    func listen(_ listener: @escaping (_ value: Value) -> Void)
    func listen(_ listener: @escaping () -> Void)
}
