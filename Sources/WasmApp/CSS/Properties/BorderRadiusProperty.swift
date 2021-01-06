//
//  BorderRadiusProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// A shorthand property for the four border-*-radius properties
///
/// ```html
/// border-radius: 50px 20px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_border-radius.asp)
public class BorderRadiusProperty: _Property {
    public var propertyKey: PropertyKey<BorderRadiusValue> { .borderRadius }
    public var propertyValue: BorderRadiusValue
    var _content = _PropertyContent<BorderRadiusValue>()
    
    public init <U: UnitValuable>(all: U) {
        propertyValue = BorderRadiusValue(all: all)
    }
    
    public init <U: UnitValuable>(all: State<U>) {
        propertyValue = BorderRadiusValue(all: all)
    }
    
    public convenience init <V, U: UnitValuable>(all: ExpressableState<V, U>) {
        self.init(all: all.unwrap())
    }
    
    // MARK: TL/BR
    
    public init <TL: UnitValuable, BR: UnitValuable>(topLeft: TL, bottomRight: BR) {
        propertyValue = BorderRadiusValue(topLeft: topLeft, bottomRight: bottomRight)
    }
    
    public init <TL: UnitValuable, BR: UnitValuable>(topLeft: State<TL>, bottomRight: BR) {
        propertyValue = BorderRadiusValue(topLeft: topLeft, bottomRight: bottomRight)
    }
    
    public init <TLV, TL: UnitValuable, BR: UnitValuable>(topLeft: ExpressableState<TLV, TL>, bottomRight: BR) {
        propertyValue = BorderRadiusValue(topLeft: topLeft, bottomRight: bottomRight)
    }
    
    public init <TLV, TL: UnitValuable, BR: UnitValuable>(topLeft: ExpressableState<TLV, TL>, bottomRight: State<BR>) {
        propertyValue = BorderRadiusValue(topLeft: topLeft, bottomRight: bottomRight)
    }
    
    public init <TL: UnitValuable, BRV, BR: UnitValuable>(topLeft: TL, bottomRight: ExpressableState<BRV, BR>) {
        propertyValue = BorderRadiusValue(topLeft: topLeft, bottomRight: bottomRight)
    }
    
    public init <TL: UnitValuable, BRV, BR: UnitValuable>(topLeft: State<TL>, bottomRight: ExpressableState<BRV, BR>) {
        propertyValue = BorderRadiusValue(topLeft: topLeft, bottomRight: bottomRight)
    }
    
    public init <TLV, TL: UnitValuable, BRV, BR: UnitValuable>(topLeft: ExpressableState<TLV, TL>, bottomRight: ExpressableState<BRV, BR>) {
        propertyValue = BorderRadiusValue(topLeft: topLeft, bottomRight: bottomRight)
    }
    
    public init <TL: UnitValuable, BR: UnitValuable>(topLeft: TL, bottomRight: State<BR>) {
        propertyValue = BorderRadiusValue(topLeft: topLeft, bottomRight: bottomRight)
    }
    
    public init <TL: UnitValuable, BR: UnitValuable>(topLeft: State<TL>, bottomRight: State<BR>) {
        propertyValue = BorderRadiusValue(topLeft: topLeft, bottomRight: bottomRight)
    }
    
    // MARK: Other
    
    public init <TL: UnitValuable, TR: UnitValuable, BL: UnitValuable>(topLeft: TL, topRight: TR, bottomLeft: BL) {
        propertyValue = BorderRadiusValue(topLeft: topLeft, topRight: topRight, bottomLeft: bottomLeft)
    }
    
    public init <TL: UnitValuable, TR: UnitValuable, BR: UnitValuable, BL: UnitValuable>(topLeft: TL, topRight: TR, bottomRight: BR, bottomLeft: BL) {
        propertyValue = BorderRadiusValue(topLeft: topLeft, topRight: topRight, bottomRight: bottomRight, bottomLeft: bottomLeft)
    }
}

extension PropertyKey {
    /// A shorthand property for the four border-*-radius properties
    public static var borderRadius: PropertyKey<BorderRadiusValue> { "border-radius".propertyKey() }
}

public class BorderRadiusValue: CustomStringConvertible, _PropertyValueInnerChangeable {
    @State public var value: String = ""
    
    var _changeHandler = {}
    
    public init <U: UnitValuable>(all: U) {
        value = all.description
    }
    
    public convenience init <U: UnitValuable>(all: State<U>) {
        self.init(all: all.wrappedValue)
        all.listen {
            self.value = all.wrappedValue.description
            self._changeHandler()
        }
    }
    
    public convenience init <V, U: UnitValuable>(all: ExpressableState<V, U>) {
        self.init(all: all.unwrap())
    }
    
    private static func values(_ values: AnyUnitValuable...) -> String {
        self.values(values)
    }
    
    private static func values(_ values: [AnyUnitValuable]) -> String {
        values.map { $0.description }.joined(separator: " ")
    }
    
    // MARK: TL/BR
    
    public init <TL: UnitValuable, BR: UnitValuable>(topLeft: TL, bottomRight: BR) {
        value = Self.values(topLeft, bottomRight)
    }
    
    public convenience init <TL: UnitValuable, BR: UnitValuable>(topLeft: State<TL>, bottomRight: BR) {
        self.init(topLeft: topLeft.wrappedValue, bottomRight: bottomRight)
        topLeft.listen {
            self.value = Self.values($0, bottomRight)
            self._changeHandler()
        }
    }
    
    public convenience init <TLV, TL: UnitValuable, BR: UnitValuable>(topLeft: ExpressableState<TLV, TL>, bottomRight: BR) {
        self.init(topLeft: topLeft.unwrap(), bottomRight: bottomRight)
    }
    
    public convenience init <TLV, TL: UnitValuable, BR: UnitValuable>(topLeft: ExpressableState<TLV, TL>, bottomRight: State<BR>) {
        self.init(topLeft: topLeft.unwrap(), bottomRight: bottomRight)
    }
    
    public convenience init <TL: UnitValuable, BRV, BR: UnitValuable>(topLeft: TL, bottomRight: ExpressableState<BRV, BR>) {
        self.init(topLeft: topLeft, bottomRight: bottomRight.unwrap())
    }
    
    public convenience init <TL: UnitValuable, BRV, BR: UnitValuable>(topLeft: State<TL>, bottomRight: ExpressableState<BRV, BR>) {
        self.init(topLeft: topLeft, bottomRight: bottomRight.unwrap())
    }
    
    public convenience init <TLV, TL: UnitValuable, BRV, BR: UnitValuable>(topLeft: ExpressableState<TLV, TL>, bottomRight: ExpressableState<BRV, BR>) {
        self.init(topLeft: topLeft.unwrap(), bottomRight: bottomRight.unwrap())
    }
    
    public convenience init <TL: UnitValuable, BR: UnitValuable>(topLeft: TL, bottomRight: State<BR>) {
        self.init(topLeft: topLeft, bottomRight: bottomRight.wrappedValue)
        bottomRight.listen {
            self.value = Self.values(topLeft, $0)
            self._changeHandler()
        }
    }
    
    public convenience init <TL: UnitValuable, BR: UnitValuable>(topLeft: State<TL>, bottomRight: State<BR>) {
        self.init(topLeft: topLeft.wrappedValue, bottomRight: bottomRight.wrappedValue)
        topLeft.listen {
            self.value = Self.values($0, bottomRight.wrappedValue)
            self._changeHandler()
        }
        bottomRight.listen {
            self.value = Self.values(topLeft.wrappedValue, $0)
            self._changeHandler()
        }
    }
    
    // MARK: Other
    
    public init <TL: UnitValuable, TR: UnitValuable, BL: UnitValuable>(topLeft: TL, topRight: TR, bottomLeft: BL) {
        value = Self.values(topLeft, topRight, bottomLeft)
    }
    
    public init <TL: UnitValuable, TR: UnitValuable, BR: UnitValuable, BL: UnitValuable>(topLeft: TL, topRight: TR, bottomRight: BR, bottomLeft: BL) {
        value = Self.values(topLeft, topRight, bottomRight, bottomLeft)
    }
    
    public var description: String { value }
}

extension Stylesheet {
    /// A shorthand property for the four border-*-radius properties
    public typealias BorderRadius = BorderRadiusProperty
}

extension CSSRulable {
    /// A shorthand property for the four border-*-radius properties
    public func borderRadius<U: UnitValuable>(all: U) -> Self {
        s?._addProperty(BorderRadiusProperty(all: all))
        return self
    }
    
    /// A shorthand property for the four border-*-radius properties
    public func borderRadius<U: UnitValuable>(all: State<U>) -> Self {
        s?._addProperty(BorderRadiusProperty(all: all))
        return self
    }
    
    /// A shorthand property for the four border-*-radius properties
    public func borderRadius<V, U: UnitValuable>(all: ExpressableState<V, U>) -> Self {
        s?._addProperty(BorderRadiusProperty(all: all))
        return self
    }
    
    // MARK: TL/BR
    
    /// A shorthand property for the four border-*-radius properties
    public func borderRadius<TL: UnitValuable, BR: UnitValuable>(topLeft: TL, bottomRight: BR) -> Self {
        s?._addProperty(BorderRadiusProperty(topLeft: topLeft, bottomRight: bottomRight))
        return self
    }
    
    /// A shorthand property for the four border-*-radius properties
    public func borderRadius<TL: UnitValuable, BR: UnitValuable>(topLeft: State<TL>, bottomRight: BR) -> Self {
        s?._addProperty(BorderRadiusProperty(topLeft: topLeft, bottomRight: bottomRight))
        return self
    }
    
    /// A shorthand property for the four border-*-radius properties
    public func borderRadius<TLV, TL: UnitValuable, BR: UnitValuable>(topLeft: ExpressableState<TLV, TL>, bottomRight: BR) -> Self {
        s?._addProperty(BorderRadiusProperty(topLeft: topLeft, bottomRight: bottomRight))
        return self
    }
    
    /// A shorthand property for the four border-*-radius properties
    public func borderRadius<TLV, TL: UnitValuable, BR: UnitValuable>(topLeft: ExpressableState<TLV, TL>, bottomRight: State<BR>) -> Self {
        s?._addProperty(BorderRadiusProperty(topLeft: topLeft, bottomRight: bottomRight))
        return self
    }
    
    /// A shorthand property for the four border-*-radius properties
    public func borderRadius<TL: UnitValuable, BRV, BR: UnitValuable>(topLeft: TL, bottomRight: ExpressableState<BRV, BR>) -> Self {
        s?._addProperty(BorderRadiusProperty(topLeft: topLeft, bottomRight: bottomRight))
        return self
    }
    
    /// A shorthand property for the four border-*-radius properties
    public func borderRadius<TL: UnitValuable, BRV, BR: UnitValuable>(topLeft: State<TL>, bottomRight: ExpressableState<BRV, BR>) -> Self {
        s?._addProperty(BorderRadiusProperty(topLeft: topLeft, bottomRight: bottomRight))
        return self
    }
    
    /// A shorthand property for the four border-*-radius properties
    public func borderRadius<TLV, TL: UnitValuable, BRV, BR: UnitValuable>(topLeft: ExpressableState<TLV, TL>, bottomRight: ExpressableState<BRV, BR>) -> Self {
        s?._addProperty(BorderRadiusProperty(topLeft: topLeft, bottomRight: bottomRight))
        return self
    }
    
    /// A shorthand property for the four border-*-radius properties
    public func borderRadius<TL: UnitValuable, BR: UnitValuable>(topLeft: TL, bottomRight: State<BR>) -> Self {
        s?._addProperty(BorderRadiusProperty(topLeft: topLeft, bottomRight: bottomRight))
        return self
    }
    
    /// A shorthand property for the four border-*-radius properties
    public func borderRadius<TL: UnitValuable, BR: UnitValuable>(topLeft: State<TL>, bottomRight: State<BR>) -> Self {
        s?._addProperty(BorderRadiusProperty(topLeft: topLeft, bottomRight: bottomRight))
        return self
    }
    
    // MARK: Other
    
    /// A shorthand property for the four border-*-radius properties
    public func borderRadius<TL: UnitValuable, TR: UnitValuable, BL: UnitValuable>(topLeft: TL, topRight: TR, bottomLeft: BL) -> Self {
        s?._addProperty(BorderRadiusProperty(topLeft: topLeft, topRight: topRight, bottomLeft: bottomLeft))
        return self
    }
    
    /// A shorthand property for the four border-*-radius properties
    public func borderRadius<TL: UnitValuable, TR: UnitValuable, BR: UnitValuable, BL: UnitValuable>(topLeft: TL, topRight: TR, bottomRight: BR, bottomLeft: BL) -> Self {
        s?._addProperty(BorderRadiusProperty(topLeft: topLeft, topRight: topRight, bottomRight: bottomRight, bottomLeft: bottomLeft))
        return self
    }
}
