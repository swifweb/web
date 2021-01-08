//
//  Margin.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Sets all the margin properties in one declaration
///
/// ```html
/// margin: 35px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_margin.asp)
public class MarginProperty: _Property {
    public var propertyKey: PropertyKey<MarginValue> { .margin }
    public var propertyValue: MarginValue
    var _content = _PropertyContent<MarginValue>()
    
    public init <U: UnitValuable>(all: U) {
        propertyValue = MarginValue(all: all)
    }

    public convenience init <A>(all type: A) where A: StateConvertible, A.Value: UnitValuable {
        let state = type.stateValue
        self.init(all: state.wrappedValue)
        state.listen { self._changed(to: MarginValue(all: $0)) }
    }

    // MARK: V/H

    public init <U1: UnitValuable, U2: UnitValuable>(v: U1, h: U2) {
        propertyValue = MarginValue(v: v, h: h)
    }

    public convenience init <U1: UnitValuable, A>(v: A, h: U1) where A: StateConvertible, A.Value: UnitValuable {
        let v = v.stateValue
        self.init(v: v.wrappedValue, h: h)
        v.listen { self._changed(to: MarginValue(v: $0, h: h)) }
    }

    public convenience init <U1: UnitValuable, B>(v: U1, h: B) where B: StateConvertible, B.Value: UnitValuable {
        let h = h.stateValue
        self.init(v: v, h: h.wrappedValue)
        h.listen { self._changed(to: MarginValue(v: v, h: $0)) }
    }

    public convenience init <A, B>(v: A, h: B) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable {
        let v = v.stateValue
        let h = h.stateValue
        self.init(v: v.wrappedValue, h: h.wrappedValue)
        v.listen { self._changed(to: MarginValue(v: $0, h: h.wrappedValue)) }
        h.listen { self._changed(to: MarginValue(v: v.wrappedValue, h: $0)) }
    }

    // MARK: Top/H/Bottom

    public init <U1: UnitValuable, U2: UnitValuable, U3: UnitValuable>(top: U1, h: U2, bottom: U3) {
        propertyValue = MarginValue(top: top, h: h, bottom: bottom)
    }

    public convenience init <U1: UnitValuable, U2: UnitValuable, A>(top: A, h: U1, bottom: U2) where A: StateConvertible, A.Value: UnitValuable {
        let top = top.stateValue
        self.init(top: top.wrappedValue, h: h, bottom: bottom)
        top.listen { self._changed(to: MarginValue(top: $0, h: h, bottom: bottom)) }
    }

    public convenience init <U1: UnitValuable, U2: UnitValuable, B>(top: U1, h: B, bottom: U2) where B: StateConvertible, B.Value: UnitValuable {
        let h = h.stateValue
        self.init(top: top, h: h.wrappedValue, bottom: bottom)
        h.listen { self._changed(to: MarginValue(top: top, h: $0, bottom: bottom)) }
    }

    public convenience init <U1: UnitValuable, U2: UnitValuable, C>(top: U1, h: U2, bottom: C) where C: StateConvertible, C.Value: UnitValuable {
        let bottom = bottom.stateValue
        self.init(top: top, h: h, bottom: bottom.wrappedValue)
        bottom.listen { self._changed(to: MarginValue(top: top, h: h, bottom: $0)) }
    }

    public convenience init <U1: UnitValuable, A, B>(top: A, h: B, bottom: U1) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable {
        let top = top.stateValue
        let h = h.stateValue
        self.init(top: top.wrappedValue, h: h.wrappedValue, bottom: bottom)
        top.listen { self._changed(to: MarginValue(top: $0, h: h.wrappedValue, bottom: bottom)) }
        h.listen { self._changed(to: MarginValue(top: top.wrappedValue, h: $0, bottom: bottom)) }
    }

    public convenience init <U1: UnitValuable, A, C>(top: A, h: U1, bottom: C) where A: StateConvertible, A.Value: UnitValuable, C: StateConvertible, C.Value: UnitValuable {
        let top = top.stateValue
        let bottom = bottom.stateValue
        self.init(top: top.wrappedValue, h: h, bottom: bottom.wrappedValue)
        top.listen { self._changed(to: MarginValue(top: $0, h: h, bottom: bottom.wrappedValue)) }
        bottom.listen { self._changed(to: MarginValue(top: top.wrappedValue, h: h, bottom: $0)) }
    }

    public convenience init <U1: UnitValuable, B, C>(top: U1, h: B, bottom: C) where B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value: UnitValuable {
        let h = h.stateValue
        let bottom = bottom.stateValue
        self.init(top: top, h: h.wrappedValue, bottom: bottom.wrappedValue)
        h.listen { self._changed(to: MarginValue(top: top, h: $0, bottom: bottom.wrappedValue)) }
        bottom.listen { self._changed(to: MarginValue(top: top, h: h.wrappedValue, bottom: $0)) }
    }

    public convenience init <A, B, C>(top: A, h: B, bottom: C) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value: UnitValuable {
        let top = top.stateValue
        let h = h.stateValue
        let bottom = bottom.stateValue
        self.init(top: top.wrappedValue, h: h.wrappedValue, bottom: bottom.wrappedValue)
        top.listen { self._changed(to: MarginValue(top: $0, h: h.wrappedValue, bottom: bottom.wrappedValue)) }
        h.listen { self._changed(to: MarginValue(top: top.wrappedValue, h: $0, bottom: bottom.wrappedValue)) }
        bottom.listen { self._changed(to: MarginValue(top: top.wrappedValue, h: h.wrappedValue, bottom: $0)) }
    }

    // MARK: Top/Right/Bottom/Left

    public init <U1: UnitValuable, U2: UnitValuable, U3: UnitValuable, U4: UnitValuable>(top: U1, right: U2, bottom: U3, left: U4) {
        propertyValue = MarginValue(top: top, right: right, bottom: bottom, left: left)
    }

    public convenience init <U1: UnitValuable, U2: UnitValuable, U3: UnitValuable, A>(top: A, right: U1, bottom: U2, left: U3) where A: StateConvertible, A.Value: UnitValuable {
        let top = top.stateValue
        self.init(top: top.wrappedValue, right: right, bottom: bottom, left: left)
        top.listen { self._changed(to: MarginValue(top: $0, right: right, bottom: bottom, left: left)) }
    }

    public convenience init <U1: UnitValuable, U2: UnitValuable, U3: UnitValuable, B>(top: U1, right: B, bottom: U2, left: U3) where B: StateConvertible, B.Value: UnitValuable {
        let right = right.stateValue
        self.init(top: top, right: right.wrappedValue, bottom: bottom, left: left)
        right.listen { self._changed(to: MarginValue(top: top, right: $0, bottom: bottom, left: left)) }
    }

    public convenience init <U1: UnitValuable, U2: UnitValuable, U3: UnitValuable, C>(top: U1, right: U2, bottom: C, left: U3) where C: StateConvertible, C.Value: UnitValuable {
        let bottom = bottom.stateValue
        self.init(top: top, right: right, bottom: bottom.wrappedValue, left: left)
        bottom.listen { self._changed(to: MarginValue(top: top, right: right, bottom: $0, left: left)) }
    }

    public convenience init <U1: UnitValuable, U2: UnitValuable, U3: UnitValuable, D>(top: U1, right: U2, bottom: U3, left: D) where D: StateConvertible, D.Value: UnitValuable {
        let left = left.stateValue
        self.init(top: top, right: right, bottom: bottom, left: left.wrappedValue)
        left.listen { self._changed(to: MarginValue(top: top, right: right, bottom: bottom, left: $0)) }
    }

    public convenience init <U1: UnitValuable, U2: UnitValuable, A, B>(top: A, right: B, bottom: U1, left: U2) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable {
        let top = top.stateValue
        let right = right.stateValue
        self.init(top: top.wrappedValue, right: right.wrappedValue, bottom: bottom, left: left)
        top.listen { self._changed(to: MarginValue(top: $0, right: right.wrappedValue, bottom: bottom, left: left)) }
        right.listen { self._changed(to: MarginValue(top: top.wrappedValue, right: $0, bottom: bottom, left: left)) }
    }

    public convenience init <U1: UnitValuable, U2: UnitValuable, A, C>(top: A, right: U1, bottom: C, left: U2) where A: StateConvertible, A.Value: UnitValuable, C: StateConvertible, C.Value: UnitValuable {
        let top = top.stateValue
        let bottom = bottom.stateValue
        self.init(top: top.wrappedValue, right: right, bottom: bottom.wrappedValue, left: left)
        top.listen { self._changed(to: MarginValue(top: $0, right: right, bottom: bottom.wrappedValue, left: left)) }
        bottom.listen { self._changed(to: MarginValue(top: top.wrappedValue, right: right, bottom: $0, left: left)) }
    }

    public convenience init <U1: UnitValuable, U2: UnitValuable, A, D>(top: A, right: U1, bottom: U2, left: D) where A: StateConvertible, A.Value: UnitValuable, D: StateConvertible, D.Value: UnitValuable {
        let top = top.stateValue
        let left = left.stateValue
        self.init(top: top.wrappedValue, right: right, bottom: bottom, left: left.wrappedValue)
        top.listen { self._changed(to: MarginValue(top: $0, right: right, bottom: bottom, left: left.wrappedValue)) }
        left.listen { self._changed(to: MarginValue(top: top.wrappedValue, right: right, bottom: bottom, left: $0)) }
    }

    public convenience init <U1: UnitValuable, U2: UnitValuable, B, C>(top: U1, right: B, bottom: C, left: U2) where B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value: UnitValuable {
        let right = right.stateValue
        let bottom = bottom.stateValue
        self.init(top: top, right: right.wrappedValue, bottom: bottom.wrappedValue, left: left)
        right.listen { self._changed(to: MarginValue(top: top, right: $0, bottom: bottom.wrappedValue, left: left)) }
        bottom.listen { self._changed(to: MarginValue(top: top, right: right.wrappedValue, bottom: $0, left: left)) }
    }

    public convenience init <U1: UnitValuable, U2: UnitValuable, B, D>(top: U1, right: B, bottom: U2, left: D) where B: StateConvertible, B.Value: UnitValuable, D: StateConvertible, D.Value: UnitValuable {
        let right = right.stateValue
        let left = left.stateValue
        self.init(top: top, right: right.wrappedValue, bottom: bottom, left: left.wrappedValue)
        right.listen { self._changed(to: MarginValue(top: top, right: $0, bottom: bottom, left: left.wrappedValue)) }
        left.listen { self._changed(to: MarginValue(top: top, right: right.wrappedValue, bottom: bottom, left: $0)) }
    }

    public convenience init <U1: UnitValuable, U2: UnitValuable, C, D>(top: U1, right: U2, bottom: C, left: D) where C: StateConvertible, C.Value: UnitValuable, D: StateConvertible, D.Value: UnitValuable {
        let bottom = bottom.stateValue
        let left = left.stateValue
        self.init(top: top, right: right, bottom: bottom.wrappedValue, left: left.wrappedValue)
        bottom.listen { self._changed(to: MarginValue(top: top, right: right, bottom: $0, left: left.wrappedValue)) }
        left.listen { self._changed(to: MarginValue(top: top, right: right, bottom: bottom.wrappedValue, left: $0)) }
    }

    public convenience init <U1: UnitValuable, A, B, C>(top: A, right: B, bottom: C, left: U1) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value: UnitValuable {
        let top = top.stateValue
        let right = right.stateValue
        let bottom = bottom.stateValue
        self.init(top: top.wrappedValue, right: right.wrappedValue, bottom: bottom.wrappedValue, left: left)
        top.listen { self._changed(to: MarginValue(top: $0, right: right.wrappedValue, bottom: bottom.wrappedValue, left: left)) }
        right.listen { self._changed(to: MarginValue(top: top.wrappedValue, right: $0, bottom: bottom.wrappedValue, left: left)) }
        bottom.listen { self._changed(to: MarginValue(top: top.wrappedValue, right: right.wrappedValue, bottom: $0, left: left)) }
    }

    public convenience init <U1: UnitValuable, A, B, D>(top: A, right: B, bottom: U1, left: D) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, D: StateConvertible, D.Value: UnitValuable {
        let top = top.stateValue
        let right = right.stateValue
        let left = left.stateValue
        self.init(top: top.wrappedValue, right: right.wrappedValue, bottom: bottom, left: left.wrappedValue)
        top.listen { self._changed(to: MarginValue(top: $0, right: right.wrappedValue, bottom: bottom, left: left.wrappedValue)) }
        right.listen { self._changed(to: MarginValue(top: top.wrappedValue, right: $0, bottom: bottom, left: left.wrappedValue)) }
        left.listen { self._changed(to: MarginValue(top: top.wrappedValue, right: right.wrappedValue, bottom: bottom, left: $0)) }
    }

    public convenience init <U1: UnitValuable, A, C, D>(top: A, right: U1, bottom: C, left: D) where A: StateConvertible, A.Value: UnitValuable, C: StateConvertible, C.Value: UnitValuable, D: StateConvertible, D.Value: UnitValuable {
        let top = top.stateValue
        let bottom = bottom.stateValue
        let left = left.stateValue
        self.init(top: top.wrappedValue, right: right, bottom: bottom.wrappedValue, left: left.wrappedValue)
        top.listen { self._changed(to: MarginValue(top: $0, right: right, bottom: bottom.wrappedValue, left: left.wrappedValue)) }
        bottom.listen { self._changed(to: MarginValue(top: top.wrappedValue, right: right, bottom: $0, left: left.wrappedValue)) }
        left.listen { self._changed(to: MarginValue(top: top.wrappedValue, right: right, bottom: bottom.wrappedValue, left: $0)) }
    }

    public convenience init <U1: UnitValuable, B, C, D>(top: U1, right: B, bottom: C, left: D) where B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value: UnitValuable, D: StateConvertible, D.Value: UnitValuable {
        let right = right.stateValue
        let bottom = bottom.stateValue
        let left = left.stateValue
        self.init(top: top, right: right.wrappedValue, bottom: bottom.wrappedValue, left: left.wrappedValue)
        right.listen { self._changed(to: MarginValue(top: top, right: $0, bottom: bottom.wrappedValue, left: left.wrappedValue)) }
        bottom.listen { self._changed(to: MarginValue(top: top, right: right.wrappedValue, bottom: $0, left: left.wrappedValue)) }
        left.listen { self._changed(to: MarginValue(top: top, right: right.wrappedValue, bottom: bottom.wrappedValue, left: $0)) }
    }

    public convenience init <A, B, C, D>(top: A, right: B, bottom: C, left: D) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value: UnitValuable, D: StateConvertible, D.Value: UnitValuable {
        let top = top.stateValue
        let right = right.stateValue
        let bottom = bottom.stateValue
        let left = left.stateValue
        self.init(top: top.wrappedValue, right: right.wrappedValue, bottom: bottom.wrappedValue, left: left.wrappedValue)
        top.listen { self._changed(to: MarginValue(top: $0, right: right.wrappedValue, bottom: bottom.wrappedValue, left: left.wrappedValue)) }
        right.listen { self._changed(to: MarginValue(top: top.wrappedValue, right: $0, bottom: bottom.wrappedValue, left: left.wrappedValue)) }
        bottom.listen { self._changed(to: MarginValue(top: top.wrappedValue, right: right.wrappedValue, bottom: $0, left: left.wrappedValue)) }
        left.listen { self._changed(to: MarginValue(top: top.wrappedValue, right: right.wrappedValue, bottom: bottom.wrappedValue, left: $0)) }
    }
}

extension PropertyKey {
    public static var margin: PropertyKey<MarginValue> { "margin".propertyKey() }
}

public class MarginValue: CustomStringConvertible, _PropertyValueInnerChangeable {
    @State public var value = ""
    
    var _changeHandler = {}
    
    private static func values(_ v: CustomStringConvertible...) -> String {
        v.map { $0.description }.joined(separator: " ")
    }
    
    public init <U: UnitValuable>(all: U) {
        value = all.description
        $value.listen {
            self._changeHandler()
        }
    }
    
    public init <U1: UnitValuable, U2: UnitValuable>(v: U1, h: U2) {
        value = Self.values(v, h)
        $value.listen {
            self._changeHandler()
        }
    }
    
    public init <U1: UnitValuable, U2: UnitValuable, U3: UnitValuable>(top: U1, h: U2, bottom: U3) {
        value = Self.values(top, h, bottom)
        $value.listen {
            self._changeHandler()
        }
    }
    
    public init <U1: UnitValuable, U2: UnitValuable, U3: UnitValuable, U4: UnitValuable>(top: U1, right: U2, bottom: U3, left: U4) {
        value = Self.values(top, right, bottom, left)
        $value.listen {
            self._changeHandler()
        }
    }
    
    public var description: String { value }
}

extension Stylesheet {
    /// Sets all the margin properties in one declaration
    public typealias Margin = MarginProperty
}

extension CSSRulable {
    /// Sets all the margin properties in one declaration
    public func margin<U: UnitValuable>(all: U) -> Self {
        s?._addProperty(MarginProperty(all: all))
        return self
    }

    /// Sets all the margin properties in one declaration
    public func margin<A>(all type: A) -> Self where A: StateConvertible, A.Value: UnitValuable {
        s?._addProperty(MarginProperty(all: type))
        return self
    }

    // MARK: V/H

    /// Sets all the margin properties in one declaration
    public func margin<U1: UnitValuable, U2: UnitValuable>(v: U1, h: U2) -> Self {
        s?._addProperty(MarginProperty(v: v, h: h))
        return self
    }

    /// Sets all the margin properties in one declaration
    public func margin<U1: UnitValuable, A>(v: A, h: U1) -> Self where A: StateConvertible, A.Value: UnitValuable {
        s?._addProperty(MarginProperty(v: v, h: h))
        return self
    }

    /// Sets all the margin properties in one declaration
    public func margin<U1: UnitValuable, B>(v: U1, h: B) -> Self where B: StateConvertible, B.Value: UnitValuable {
        s?._addProperty(MarginProperty(v: v, h: h))
        return self
    }

    /// Sets all the margin properties in one declaration
    public func margin<A, B>(v: A, h: B) -> Self where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable {
        s?._addProperty(MarginProperty(v: v, h: h))
        return self
    }

    // MARK: Top/H/Bottom

    /// Sets all the margin properties in one declaration
    public func margin<U1: UnitValuable, U2: UnitValuable, U3: UnitValuable>(top: U1, h: U2, bottom: U3) -> Self {
        s?._addProperty(MarginProperty(top: top, h: h, bottom: bottom))
        return self
    }

    /// Sets all the margin properties in one declaration
    public func margin<U1: UnitValuable, U2: UnitValuable, A>(top: A, h: U1, bottom: U2) -> Self where A: StateConvertible, A.Value: UnitValuable {
        s?._addProperty(MarginProperty(top: top, h: h, bottom: bottom))
        return self
    }

    /// Sets all the margin properties in one declaration
    public func margin<U1: UnitValuable, U2: UnitValuable, B>(top: U1, h: B, bottom: U2) -> Self where B: StateConvertible, B.Value: UnitValuable {
        s?._addProperty(MarginProperty(top: top, h: h, bottom: bottom))
        return self
    }

    /// Sets all the margin properties in one declaration
    public func margin<U1: UnitValuable, U2: UnitValuable, C>(top: U1, h: U2, bottom: C) -> Self where C: StateConvertible, C.Value: UnitValuable {
        s?._addProperty(MarginProperty(top: top, h: h, bottom: bottom))
        return self
    }

    /// Sets all the margin properties in one declaration
    public func margin<U1: UnitValuable, A, B>(top: A, h: B, bottom: U1) -> Self where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable {
        s?._addProperty(MarginProperty(top: top, h: h, bottom: bottom))
        return self
    }

    /// Sets all the margin properties in one declaration
    public func margin<U1: UnitValuable, A, C>(top: A, h: U1, bottom: C) -> Self where A: StateConvertible, A.Value: UnitValuable, C: StateConvertible, C.Value: UnitValuable {
        s?._addProperty(MarginProperty(top: top, h: h, bottom: bottom))
        return self
    }

    /// Sets all the margin properties in one declaration
    public func margin<U1: UnitValuable, B, C>(top: U1, h: B, bottom: C) -> Self where B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value: UnitValuable {
        s?._addProperty(MarginProperty(top: top, h: h, bottom: bottom))
        return self
    }

    /// Sets all the margin properties in one declaration
    public func margin<A, B, C>(top: A, h: B, bottom: C) -> Self where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value: UnitValuable {
        s?._addProperty(MarginProperty(top: top, h: h, bottom: bottom))
        return self
    }

    // MARK: Top/Right/Bottom/Left

    /// Sets all the margin properties in one declaration
    public func margin<U1: UnitValuable, U2: UnitValuable, U3: UnitValuable, U4: UnitValuable>(top: U1, right: U2, bottom: U3, left: U4) -> Self {
        s?._addProperty(MarginProperty(top: top, right: right, bottom: bottom, left: left))
        return self
    }

    /// Sets all the margin properties in one declaration
    public func margin<U1: UnitValuable, U2: UnitValuable, U3: UnitValuable, A>(top: A, right: U1, bottom: U2, left: U3) -> Self where A: StateConvertible, A.Value: UnitValuable {
        s?._addProperty(MarginProperty(top: top, right: right, bottom: bottom, left: left))
        return self
    }

    /// Sets all the margin properties in one declaration
    public func margin<U1: UnitValuable, U2: UnitValuable, U3: UnitValuable, B>(top: U1, right: B, bottom: U2, left: U3) -> Self where B: StateConvertible, B.Value: UnitValuable {
        s?._addProperty(MarginProperty(top: top, right: right, bottom: bottom, left: left))
        return self
    }

    /// Sets all the margin properties in one declaration
    public func margin<U1: UnitValuable, U2: UnitValuable, U3: UnitValuable, C>(top: U1, right: U2, bottom: C, left: U3) -> Self where C: StateConvertible, C.Value: UnitValuable {
        s?._addProperty(MarginProperty(top: top, right: right, bottom: bottom, left: left))
        return self
    }

    /// Sets all the margin properties in one declaration
    public func margin<U1: UnitValuable, U2: UnitValuable, U3: UnitValuable, D>(top: U1, right: U2, bottom: U3, left: D) -> Self where D: StateConvertible, D.Value: UnitValuable {
        s?._addProperty(MarginProperty(top: top, right: right, bottom: bottom, left: left))
        return self
    }

    /// Sets all the margin properties in one declaration
    public func margin<U1: UnitValuable, U2: UnitValuable, A, B>(top: A, right: B, bottom: U1, left: U2) -> Self where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable {
        s?._addProperty(MarginProperty(top: top, right: right, bottom: bottom, left: left))
        return self
    }

    /// Sets all the margin properties in one declaration
    public func margin<U1: UnitValuable, U2: UnitValuable, A, C>(top: A, right: U1, bottom: C, left: U2) -> Self where A: StateConvertible, A.Value: UnitValuable, C: StateConvertible, C.Value: UnitValuable {
        s?._addProperty(MarginProperty(top: top, right: right, bottom: bottom, left: left))
        return self
    }

    /// Sets all the margin properties in one declaration
    public func margin<U1: UnitValuable, U2: UnitValuable, A, D>(top: A, right: U1, bottom: U2, left: D) -> Self where A: StateConvertible, A.Value: UnitValuable, D: StateConvertible, D.Value: UnitValuable {
        s?._addProperty(MarginProperty(top: top, right: right, bottom: bottom, left: left))
        return self
    }

    /// Sets all the margin properties in one declaration
    public func margin<U1: UnitValuable, U2: UnitValuable, B, C>(top: U1, right: B, bottom: C, left: U2) -> Self where B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value: UnitValuable {
        s?._addProperty(MarginProperty(top: top, right: right, bottom: bottom, left: left))
        return self
    }

    /// Sets all the margin properties in one declaration
    public func margin<U1: UnitValuable, U2: UnitValuable, B, D>(top: U1, right: B, bottom: U2, left: D) -> Self where B: StateConvertible, B.Value: UnitValuable, D: StateConvertible, D.Value: UnitValuable {
        s?._addProperty(MarginProperty(top: top, right: right, bottom: bottom, left: left))
        return self
    }

    /// Sets all the margin properties in one declaration
    public func margin<U1: UnitValuable, U2: UnitValuable, C, D>(top: U1, right: U2, bottom: C, left: D) -> Self where C: StateConvertible, C.Value: UnitValuable, D: StateConvertible, D.Value: UnitValuable {
        s?._addProperty(MarginProperty(top: top, right: right, bottom: bottom, left: left))
        return self
    }

    /// Sets all the margin properties in one declaration
    public func margin<U1: UnitValuable, A, B, C>(top: A, right: B, bottom: C, left: U1) -> Self where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value: UnitValuable {
        s?._addProperty(MarginProperty(top: top, right: right, bottom: bottom, left: left))
        return self
    }

    /// Sets all the margin properties in one declaration
    public func margin<U1: UnitValuable, A, B, D>(top: A, right: B, bottom: U1, left: D) -> Self where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, D: StateConvertible, D.Value: UnitValuable {
        s?._addProperty(MarginProperty(top: top, right: right, bottom: bottom, left: left))
        return self
    }

    /// Sets all the margin properties in one declaration
    public func margin<U1: UnitValuable, A, C, D>(top: A, right: U1, bottom: C, left: D) -> Self where A: StateConvertible, A.Value: UnitValuable, C: StateConvertible, C.Value: UnitValuable, D: StateConvertible, D.Value: UnitValuable {
        s?._addProperty(MarginProperty(top: top, right: right, bottom: bottom, left: left))
        return self
    }

    /// Sets all the margin properties in one declaration
    public func margin<U1: UnitValuable, B, C, D>(top: U1, right: B, bottom: C, left: D) -> Self where B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value: UnitValuable, D: StateConvertible, D.Value: UnitValuable {
        s?._addProperty(MarginProperty(top: top, right: right, bottom: bottom, left: left))
        return self
    }

    /// Sets all the margin properties in one declaration
    public func margin<A, B, C, D>(top: A, right: B, bottom: C, left: D) -> Self where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value: UnitValuable, D: StateConvertible, D.Value: UnitValuable {
        s?._addProperty(MarginProperty(top: top, right: right, bottom: bottom, left: left))
        return self
    }
}
