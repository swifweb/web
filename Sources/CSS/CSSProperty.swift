//
//  Property.swift
//  CSS
//
//  Created by Mihael Isaev on 04.01.2021.
//

public struct PropertyKey<Value: CustomStringConvertible> {
    public let key: String
    
    public init(_ value: String) {
        key = value
    }
}

extension String {
    func propertyKey<Value>() -> PropertyKey<Value> {
        .init(self)
    }
}

public protocol AnyProperty {
    var key: String { get }
    var value: String { get }
}

extension AnyProperty {
    public func render() -> String {
        key + ": " + value + ";"
    }
}

public protocol Property: AnyProperty, PropertiesContent {
    associatedtype Value: CustomStringConvertible
    
    var propertyKey: PropertyKey<Value> { get }
    var propertyValue: Value { get }
    var propertyAliases: [AnyProperty] { get }
    
    
    
//    var important: Self { get }
}

extension Property {
    public var propertiesContent: Properties.Item { .property(self) }
    
    public var key: String { propertyKey.key }
    public var value: String { propertyValue.description }
    
    public var propertyAliases: [AnyProperty] { [] }
//    /// Adds `!important` to the end of value
//    public var important: Self {
//        value += "!important"
//        return self
//    }
}

class _PropertyContent<Value: CustomStringConvertible> {
    var _changeHandler: (Value?) -> Void = { _ in }
    
    init () {}
}

protocol _Property: Property {
    var _content: _PropertyContent<Value> { get }
    func _changed(to newValue: Value)
}

extension _Property {
    func _changed(to newValue: Value) {
        _content._changeHandler(newValue)
    }
}
