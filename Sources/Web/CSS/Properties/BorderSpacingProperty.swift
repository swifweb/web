//
//  BorderSpacingProperty.swift
//  Web
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets the distance between the borders of adjacent cells
///
/// ```html
/// border-spacing: 15px;
/// border-spacing: 15px 15px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_border-spacing.asp)
public class BorderSpacingProperty: _Property {
    public var propertyKey: PropertyKey<BorderSpacingValue> { .borderSpacing }
    public var propertyValue: BorderSpacingValue
    var _content = _PropertyContent<BorderSpacingValue>()
    
    // MARK: All
    
    public init <A: UnitValuable>(all: A) {
        propertyValue = BorderSpacingValue(all: all)
    }
    
    public convenience init <A>(all type: A) where A: StateConvertible, A.Value: UnitValuable {
        let state = type.stateValue
        self.init(all: state.wrappedValue)
        state.listen { self._changed(to: BorderSpacingValue(all: $0)) }
    }
    
    // MARK: H/V
    
    public init <A: UnitValuable, B: UnitValuable>(h: A, v: B) {
        propertyValue = BorderSpacingValue(h: h, v: v)
    }
    
    public convenience init <A, B: UnitValuable>(h: A, v: B) where A: StateConvertible, A.Value: UnitValuable {
        let h = h.stateValue
        self.init(h: h.wrappedValue, v: v)
        h.listen { self._changed(to: BorderSpacingValue(h: $0, v: v)) }
    }
    
    public convenience init <A: UnitValuable, B>(h: A, v: B) where B: StateConvertible, B.Value: UnitValuable {
        let v = v.stateValue
        self.init(h: h, v: v.wrappedValue)
        v.listen { self._changed(to: BorderSpacingValue(h: h, v: $0)) }
    }
    
    public convenience init <A, B>(h: A, v: B) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable {
        let h = h.stateValue
        let v = v.stateValue
        self.init(h: h.wrappedValue, v: v.wrappedValue)
        h.listen { self._changed(to: BorderSpacingValue(h: $0, v: v.wrappedValue)) }
        v.listen { self._changed(to: BorderSpacingValue(h: h.wrappedValue, v: $0)) }
    }
}

extension PropertyKey {
    /// Sets the distance between the borders of adjacent cells
    public static var borderSpacing: PropertyKey<BorderSpacingValue> { "border-spacing".propertyKey() }
}

public class BorderSpacingValue: CustomStringConvertible, _PropertyValueInnerChangeable {
    @State public var value = ""
    
    var _changeHandler = {}
    
    public init<U: UnitValuable>(all: U) {
        value = all.description
        $value.listen {
            self._changeHandler()
        }
    }
    
    public init<H: UnitValuable, V: UnitValuable>(h: H, v: V) {
        value = [h.description, v.description].joined(separator: " ")
        $value.listen {
            self._changeHandler()
        }
    }
    
    public var description: String { value }
}

extension Stylesheet {
    /// Sets the distance between the borders of adjacent cells
    public typealias BorderSpacing = BorderSpacingProperty
}

extension CSSRulable {
    // MARK: All
    
    /// Sets the distance between the borders of adjacent cells
    public func borderSpacing<A: UnitValuable>(all value: A) -> Self {
        s?._addProperty(BorderSpacingProperty(all: value))
        return self
    }
    
    /// Sets the distance between the borders of adjacent cells
    public func borderSpacing<A>(all value: A) -> Self where A: StateConvertible, A.Value: UnitValuable {
        s?._addProperty(BorderSpacingProperty(all: value))
        return self
    }
    
    // MARK: H/V
    
    /// Sets the distance between the borders of adjacent cells
    public func borderSpacing<A: UnitValuable, B: UnitValuable>(h: A, v: B) -> Self {
        s?._addProperty(BorderSpacingProperty(h: h, v: v))
        return self
    }
    
    /// Sets the distance between the borders of adjacent cells
    public func borderSpacing<A, B: UnitValuable>(h: A, v: B) -> Self where A: StateConvertible, A.Value: UnitValuable {
        s?._addProperty(BorderSpacingProperty(h: h, v: v))
        return self
    }
    
    /// Sets the distance between the borders of adjacent cells
    public func borderSpacing<A: UnitValuable, B>(h: A, v: B) -> Self where B: StateConvertible, B.Value: UnitValuable {
        s?._addProperty(BorderSpacingProperty(h: h, v: v))
        return self
    }
    
    /// Sets the distance between the borders of adjacent cells
    public func borderSpacing<A, B>(h: A, v: B) -> Self where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable {
        s?._addProperty(BorderSpacingProperty(h: h, v: v))
        return self
    }
}
