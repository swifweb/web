//
//  ObjectPosition.swift
//  WasmApp
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
    
    public init (x: ObjectPositionXType) {
        propertyValue = .init(x: x)
    }
    
    public init <X>(x: X) where X: StateConvertible, X.Value == ObjectPositionXType {
        propertyValue = .init(x: x)
    }
    
    public init (y: ObjectPositionYType) {
        propertyValue = .init(y: y)
    }
    
    public init <Y>(y: Y) where Y: StateConvertible, Y.Value == ObjectPositionYType {
        propertyValue = .init(y: y)
    }
    
    public init (x: ObjectPositionXType, y: ObjectPositionYType) {
        propertyValue = .init(x: x, y: y)
    }
    
    public init <X>(x: X, y: ObjectPositionYType) where X: StateConvertible, X.Value == ObjectPositionXType {
        propertyValue = .init(x: x, y: y)
    }
    
    public init <Y>(x: ObjectPositionXType, y: Y) where Y: StateConvertible, Y.Value == ObjectPositionYType {
        propertyValue = .init(x: x, y: y)
    }
    
    public init <X, Y>(x: X, y: Y) where X: StateConvertible, X.Value == ObjectPositionXType, Y: StateConvertible, Y.Value == ObjectPositionYType {
        propertyValue = .init(x: x, y: y)
    }
    
    public init<X: UnitValuable>(x: X) {
        propertyValue = .init(x: x)
    }
    
    public init<X>(x: X) where X: StateConvertible, X.Value: UnitValuable {
        propertyValue = .init(x: x)
    }
    
    public init<Y: UnitValuable>(y: Y) {
        propertyValue = .init(y: y)
    }
    
    public init<Y>(y: Y) where Y: StateConvertible, Y.Value: UnitValuable {
        propertyValue = .init(y: y)
    }
    
    public init<X: UnitValuable, Y: UnitValuable>(x: X, y: Y) {
        propertyValue = .init(x: x, y: y)
    }
    
    public init<X, Y: UnitValuable>(x: X, y: Y) where X: StateConvertible, X.Value: UnitValuable {
        propertyValue = .init(x: x, y: y)
    }
    
    public init<X: UnitValuable, Y>(x: X, y: Y) where Y: StateConvertible, Y.Value: UnitValuable {
        propertyValue = .init(x: x, y: y)
    }
    
    public init<X, Y>(x: X, y: Y) where X: StateConvertible, X.Value: UnitValuable, Y: StateConvertible, Y.Value: UnitValuable {
        propertyValue = .init(x: x, y: y)
    }
    
    public init<X: UnitValuable>(x: X, y: ObjectPositionYType) {
        propertyValue = .init(x: x, y: y)
    }
    
    public init<X>(x: X, y: ObjectPositionYType) where X: StateConvertible, X.Value: UnitValuable {
        propertyValue = .init(x: x, y: y)
    }
    
    public init<Y: UnitValuable>(x: ObjectPositionXType, y: Y) {
        propertyValue = .init(x: x, y: y)
    }
    
    public init<Y>(x: ObjectPositionXType, y: Y) where Y: StateConvertible, Y.Value: UnitValuable {
        propertyValue = .init(x: x, y: y)
    }
}

extension PropertyKey {
    /// Specifies the alignment of the replaced element inside its box
    public static var objectPosition: PropertyKey<ObjectPositionValue> { "object-position".propertyKey() }
}

public class ObjectPositionValue: CustomStringConvertible, _PropertyValueInnerChangeable {
    public var value: String
    
    var _changeHandler = {}
    
    public init (x: ObjectPositionXType) {
        value = x.value
    }
    
    public convenience init <X>(x: X) where X: StateConvertible, X.Value == ObjectPositionXType {
        let x = x.stateValue
        self.init(x: x.wrappedValue)
        x.listen {
            self.value = $0.value
            self._changeHandler()
        }
    }
    
    public init (y: ObjectPositionYType) {
        value = y.value
    }
    
    public convenience init <Y>(y: Y) where Y: StateConvertible, Y.Value == ObjectPositionYType {
        let y = y.stateValue
        self.init(y: y.wrappedValue)
        y.listen {
            self.value = $0.value
            self._changeHandler()
        }
    }
    
    public init (x: ObjectPositionXType, y: ObjectPositionYType) {
        value = [x.value, y.value].joined(separator: " ")
    }
    
    public convenience init <X>(x: X, y: ObjectPositionYType) where X: StateConvertible, X.Value == ObjectPositionXType {
        let x = x.stateValue
        self.init(x: x.wrappedValue, y: y)
        x.listen {
            self.value = [$0.value, y.value].joined(separator: " ")
            self._changeHandler()
        }
    }
    
    public convenience init <Y>(x: ObjectPositionXType, y: Y) where Y: StateConvertible, Y.Value == ObjectPositionYType {
        let y = y.stateValue
        self.init(x: x, y: y.wrappedValue)
        y.listen {
            self.value = [x.value, $0.value].joined(separator: " ")
            self._changeHandler()
        }
    }
    
    public convenience init <X, Y>(x: X, y: Y) where X: StateConvertible, X.Value == ObjectPositionXType, Y: StateConvertible, Y.Value == ObjectPositionYType {
        let x = x.stateValue
        let y = y.stateValue
        self.init(x: x.wrappedValue, y: y.wrappedValue)
        x.listen {
            self.value = [$0.value, y.wrappedValue.value].joined(separator: " ")
            self._changeHandler()
        }
        y.listen {
            self.value = [x.wrappedValue.value, $0.value].joined(separator: " ")
            self._changeHandler()
        }
    }
    
    public init<X: UnitValuable>(x: X) {
        value = x.description
    }
    
    public convenience init<X>(x: X) where X: StateConvertible, X.Value: UnitValuable {
        let x = x.stateValue
        self.init(x: x.wrappedValue)
        x.listen {
            self.value = $0.description
            self._changeHandler()
        }
    }
    
    public init<Y: UnitValuable>(y: Y) {
        value = y.description
    }
    
    public convenience init<Y>(y: Y) where Y: StateConvertible, Y.Value: UnitValuable {
        let y = y.stateValue
        self.init(y: y.wrappedValue)
        y.listen {
            self.value = $0.description
            self._changeHandler()
        }
    }
    
    public init<X: UnitValuable, Y: UnitValuable>(x: X, y: Y) {
        value = [x.description, y.description].joined(separator: " ")
    }
    
    public convenience init<X, Y: UnitValuable>(x: X, y: Y) where X: StateConvertible, X.Value: UnitValuable {
        let x = x.stateValue
        self.init(x: x.wrappedValue, y: y)
        x.listen {
            self.value = [$0.description, y.description].joined(separator: " ")
            self._changeHandler()
        }
    }
    
    public convenience init<X: UnitValuable, Y>(x: X, y: Y) where Y: StateConvertible, Y.Value: UnitValuable {
        let y = y.stateValue
        self.init(x: x, y: y.wrappedValue)
        y.listen {
            self.value = [x.description, $0.description].joined(separator: " ")
            self._changeHandler()
        }
    }
    
    public convenience init<X, Y>(x: X, y: Y) where X: StateConvertible, X.Value: UnitValuable, Y: StateConvertible, Y.Value: UnitValuable {
        let x = x.stateValue
        let y = y.stateValue
        self.init(x: x.wrappedValue, y: y.wrappedValue)
        x.listen {
            self.value = [$0.description, y.wrappedValue.description].joined(separator: " ")
            self._changeHandler()
        }
        y.listen {
            self.value = [x.wrappedValue.description, $0.description].joined(separator: " ")
            self._changeHandler()
        }
    }
    
    public init<X: UnitValuable>(x: X, y: ObjectPositionYType) {
        value = [x.description, y.value].joined(separator: " ")
    }
    
    public convenience init<X>(x: X, y: ObjectPositionYType) where X: StateConvertible, X.Value: UnitValuable {
        let x = x.stateValue
        self.init(x: x.wrappedValue, y: y)
        x.listen {
            self.value = [$0.description, y.value].joined(separator: " ")
            self._changeHandler()
        }
    }
    
    public init<Y: UnitValuable>(x: ObjectPositionXType, y: Y) {
        value = [x.value, y.description].joined(separator: " ")
    }
    
    public convenience init<Y>(x: ObjectPositionXType, y: Y) where Y: StateConvertible, Y.Value: UnitValuable {
        let y = y.stateValue
        self.init(x: x, y: y.wrappedValue)
        y.listen {
            self.value = [x.value, $0.description].joined(separator: " ")
            self._changeHandler()
        }
    }
    
    public var description: String { value }
}

extension Stylesheet {
    /// Specifies the alignment of the replaced element inside its box
    public typealias ObjectPosition = ObjectPositionProperty
}

extension CSSRulable {
    /// Specifies the alignment of the replaced element inside its box
    public func objectPosition(x: ObjectPositionXType) -> Self {
        s?._addProperty(ObjectPositionProperty(x: x))
        return self
    }
    
    /// Specifies the alignment of the replaced element inside its box
    public func objectPosition<X>(x: X) -> Self where X: StateConvertible, X.Value == ObjectPositionXType {
        s?._addProperty(ObjectPositionProperty(x: x))
        return self
    }
    
    /// Specifies the alignment of the replaced element inside its box
    public func objectPosition(y: ObjectPositionYType) -> Self {
        s?._addProperty(ObjectPositionProperty(y: y))
        return self
    }
    
    /// Specifies the alignment of the replaced element inside its box
    public func objectPosition<Y>(y: Y) -> Self where Y: StateConvertible, Y.Value == ObjectPositionYType {
        s?._addProperty(ObjectPositionProperty(y: y))
        return self
    }
    
    /// Specifies the alignment of the replaced element inside its box
    public func objectPosition(x: ObjectPositionXType, y: ObjectPositionYType) -> Self {
        s?._addProperty(ObjectPositionProperty(x: x, y: y))
        return self
    }
    
    /// Specifies the alignment of the replaced element inside its box
    public func objectPosition<X>(x: X, y: ObjectPositionYType) -> Self where X: StateConvertible, X.Value == ObjectPositionXType {
        s?._addProperty(ObjectPositionProperty(x: x, y: y))
        return self
    }
    
    /// Specifies the alignment of the replaced element inside its box
    public func objectPosition<Y>(x: ObjectPositionXType, y: Y) -> Self where Y: StateConvertible, Y.Value == ObjectPositionYType {
        s?._addProperty(ObjectPositionProperty(x: x, y: y))
        return self
    }
    
    /// Specifies the alignment of the replaced element inside its box
    public func objectPosition<X, Y>(x: X, y: Y) -> Self where X: StateConvertible, X.Value == ObjectPositionXType, Y: StateConvertible, Y.Value == ObjectPositionYType {
        s?._addProperty(ObjectPositionProperty(x: x, y: y))
        return self
    }
    
    /// Specifies the alignment of the replaced element inside its box
    public func objectPosition<X: UnitValuable>(x: X) -> Self {
        s?._addProperty(ObjectPositionProperty(x: x))
        return self
    }
    
    /// Specifies the alignment of the replaced element inside its box
    public func objectPosition<X>(x: X) -> Self where X: StateConvertible, X.Value: UnitValuable {
        s?._addProperty(ObjectPositionProperty(x: x))
        return self
    }
    
    /// Specifies the alignment of the replaced element inside its box
    public func objectPosition<Y: UnitValuable>(y: Y) -> Self {
        s?._addProperty(ObjectPositionProperty(y: y))
        return self
    }
    
    /// Specifies the alignment of the replaced element inside its box
    public func objectPosition<Y>(y: Y) -> Self where Y: StateConvertible, Y.Value: UnitValuable {
        s?._addProperty(ObjectPositionProperty(y: y))
        return self
    }
    
    /// Specifies the alignment of the replaced element inside its box
    public func objectPosition<X: UnitValuable, Y: UnitValuable>(x: X, y: Y) -> Self {
        s?._addProperty(ObjectPositionProperty(x: x, y: y))
        return self
    }
    
    /// Specifies the alignment of the replaced element inside its box
    public func objectPosition<X, Y: UnitValuable>(x: X, y: Y) -> Self where X: StateConvertible, X.Value: UnitValuable {
        s?._addProperty(ObjectPositionProperty(x: x, y: y))
        return self
    }
    
    /// Specifies the alignment of the replaced element inside its box
    public func objectPosition<X: UnitValuable, Y>(x: X, y: Y) -> Self where Y: StateConvertible, Y.Value: UnitValuable {
        s?._addProperty(ObjectPositionProperty(x: x, y: y))
        return self
    }
    
    /// Specifies the alignment of the replaced element inside its box
    public func objectPosition<X, Y>(x: X, y: Y) -> Self where X: StateConvertible, X.Value: UnitValuable, Y: StateConvertible, Y.Value: UnitValuable {
        s?._addProperty(ObjectPositionProperty(x: x, y: y))
        return self
    }
    
    /// Specifies the alignment of the replaced element inside its box
    public func objectPosition<X: UnitValuable>(x: X, y: ObjectPositionYType) -> Self {
        s?._addProperty(ObjectPositionProperty(x: x, y: y))
        return self
    }
    
    /// Specifies the alignment of the replaced element inside its box
    public func objectPosition<X>(x: X, y: ObjectPositionYType) -> Self where X: StateConvertible, X.Value: UnitValuable {
        s?._addProperty(ObjectPositionProperty(x: x, y: y))
        return self
    }
    
    /// Specifies the alignment of the replaced element inside its box
    public func objectPosition<Y: UnitValuable>(x: ObjectPositionXType, y: Y) -> Self {
        s?._addProperty(ObjectPositionProperty(x: x, y: y))
        return self
    }
    
    /// Specifies the alignment of the replaced element inside its box
    public func objectPosition<Y>(x: ObjectPositionXType, y: Y) -> Self where Y: StateConvertible, Y.Value: UnitValuable {
        s?._addProperty(ObjectPositionProperty(x: x, y: y))
        return self
    }
}
