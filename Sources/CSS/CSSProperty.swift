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
}

extension Property {
    public var propertiesContent: Properties.Item { .property(self) }
    
    public var key: String { propertyKey.key }
    public var value: String { propertyValue.description }
    
    public var propertyAliases: [AnyProperty] { [] }
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

public protocol PropertyValueImportantable {
    /// Adds **!important** to the value
    var important: Self { get }
}

protocol _StringPropertyValue: CustomStringConvertible, PropertyValueImportantable {
    var value: String { get }

    init (_ value: String)
}

extension _StringPropertyValue {
    /// Adds **!important** to the value
    public var important: Self { .init(value + "!important") }
}
