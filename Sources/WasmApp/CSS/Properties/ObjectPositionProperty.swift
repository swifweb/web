//
//  ObjectPosition.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Specifies the alignment of the replaced element inside its box
///
/// ```html
/// object-position: center top;
/// object-position: 100px 50px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_object-position.asp)
public class ObjectPositionProperty: _Property {
    public var propertyKey: PropertyKey<ObjectPositionValue> { .objectPosition }
    public var propertyValue: ObjectPositionValue
    var _content = _PropertyContent<ObjectPositionValue>()
    
    public init (_ value: ObjectPositionValue) {
        propertyValue = value
    }
    
    public init (x: ObjectPositionXType) {
        propertyValue = ObjectPositionValue(x: x)
    }
    
    public init (y: ObjectPositionYType) {
        propertyValue = ObjectPositionValue(y: y)
    }
    
    public init (x: ObjectPositionXType, y: ObjectPositionYType) {
        propertyValue = ObjectPositionValue(x: x, y: y)
    }
    
    public init<X: UnitValuable>(x: X) {
        propertyValue = ObjectPositionValue(x: x)
    }
    
    public init<Y: UnitValuable>(y: Y) {
        propertyValue = ObjectPositionValue(y: y)
    }
    
    public init<X: UnitValuable, Y: UnitValuable>(x: X, y: Y) {
        propertyValue = ObjectPositionValue(x: x, y: y)
    }
    
    public init<X: UnitValuable>(x: X, y: ObjectPositionYType) {
        propertyValue = ObjectPositionValue(x: x, y: y)
    }
    
    public init<Y: UnitValuable>(x: ObjectPositionXType, y: Y) {
        propertyValue = ObjectPositionValue(x: x, y: y)
    }
}

extension PropertyKey {
    public static var objectPosition: PropertyKey<ObjectPositionValue> { "object-position".propertyKey() }
}

public struct ObjectPositionValue: CustomStringConvertible {
    let value: String
    
    public init (x: ObjectPositionXType) {
        value = x.value
    }
    
    public init (y: ObjectPositionYType) {
        value = y.value
    }
    
    public init (x: ObjectPositionXType, y: ObjectPositionYType) {
        value = [x.value, y.value].joined(separator: " ")
    }
    
    public init<X: UnitValuable>(x: X) {
        value = x.description
    }
    
    public init<Y: UnitValuable>(y: Y) {
        value = y.description
    }
    
    public init<X: UnitValuable, Y: UnitValuable>(x: X, y: Y) {
        value = [x.description, y.description].joined(separator: " ")
    }
    
    public init<X: UnitValuable>(x: X, y: ObjectPositionYType) {
        value = [x.description, y.value].joined(separator: " ")
    }
    
    public init<Y: UnitValuable>(x: ObjectPositionXType, y: Y) {
        value = [x.value, y.description].joined(separator: " ")
    }
    
    public var description: String { value }
}
