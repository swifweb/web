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
    
    public init (all: BorderRadiusType) {
        propertyValue = BorderRadiusValue(all: all)
    }
    
    public convenience init <A>(all type: A) where A: StateConvertible, A.Value == BorderRadiusType {
        let state = type.stateValue
        self.init(all: state.wrappedValue)
        state.listen { self._changed(to: BorderRadiusValue(all: $0)) }
    }
    
    // MARK: TL/BR
    
    public init (topLeft: BorderRadiusType, bottomRight: BorderRadiusType) {
        propertyValue = BorderRadiusValue(topLeft: topLeft, bottomRight: bottomRight)
    }
    
    public convenience init <A>(topLeft: A, bottomRight: BorderRadiusType) where A: StateConvertible, A.Value == BorderRadiusType {
        let topLeft = topLeft.stateValue
        self.init(topLeft: topLeft.wrappedValue, bottomRight: bottomRight)
        topLeft.listen { self._changed(to: BorderRadiusValue(topLeft: $0, bottomRight: bottomRight)) }
    }
    
    public convenience init <B>(topLeft: BorderRadiusType, bottomRight: B) where B: StateConvertible, B.Value == BorderRadiusType {
        let bottomRight = bottomRight.stateValue
        self.init(topLeft: topLeft, bottomRight: bottomRight.wrappedValue)
        bottomRight.listen { self._changed(to: BorderRadiusValue(topLeft: topLeft, bottomRight: $0)) }
    }
    
    public convenience init <A, B>(topLeft: A, bottomRight: B) where A: StateConvertible, A.Value == BorderRadiusType, B: StateConvertible, B.Value == BorderRadiusType {
        let topLeft = topLeft.stateValue
        let bottomRight = bottomRight.stateValue
        self.init(topLeft: topLeft.wrappedValue, bottomRight: bottomRight.wrappedValue)
        topLeft.listen { self._changed(to: BorderRadiusValue(topLeft: $0, bottomRight: bottomRight.wrappedValue)) }
        bottomRight.listen { self._changed(to: BorderRadiusValue(topLeft: topLeft.wrappedValue, bottomRight: $0)) }
    }
    
    // MARK: TL/TR/BL
    
    public init (topLeft: BorderRadiusType, topRight: BorderRadiusType, bottomLeft: BorderRadiusType) {
        propertyValue = BorderRadiusValue(topLeft: topLeft, topRight: topRight, bottomLeft: bottomLeft)
    }
    
    public convenience init <A>(topLeft: A, topRight: BorderRadiusType, bottomLeft: BorderRadiusType) where A: StateConvertible, A.Value == BorderRadiusType {
        let topLeft = topLeft.stateValue
        self.init(topLeft: topLeft.wrappedValue, topRight: topRight, bottomLeft: bottomLeft)
        topLeft.listen { self._changed(to: BorderRadiusValue(topLeft: $0, topRight: topRight, bottomLeft: bottomLeft)) }
    }
    
    public convenience init <B>(topLeft: BorderRadiusType, topRight: B, bottomLeft: BorderRadiusType) where B: StateConvertible, B.Value == BorderRadiusType {
        let topRight = topRight.stateValue
        self.init(topLeft: topLeft, topRight: topRight.wrappedValue, bottomLeft: bottomLeft)
        topRight.listen { self._changed(to: BorderRadiusValue(topLeft: topLeft, topRight: $0, bottomLeft: bottomLeft)) }
    }
    
    public convenience init <C>(topLeft: BorderRadiusType, topRight: BorderRadiusType, bottomLeft: C) where C: StateConvertible, C.Value == BorderRadiusType {
        let bottomLeft = bottomLeft.stateValue
        self.init(topLeft: topLeft, topRight: topRight, bottomLeft: bottomLeft.wrappedValue)
        bottomLeft.listen { self._changed(to: BorderRadiusValue(topLeft: topLeft, topRight: topRight, bottomLeft: $0)) }
    }
    
    public convenience init <A, B>(topLeft: A, topRight: B, bottomLeft: BorderRadiusType) where A: StateConvertible, A.Value == BorderRadiusType, B: StateConvertible, B.Value == BorderRadiusType {
        let topLeft = topLeft.stateValue
        let topRight = topRight.stateValue
        self.init(topLeft: topLeft.wrappedValue, topRight: topRight.wrappedValue, bottomLeft: bottomLeft)
        topLeft.listen { self._changed(to: BorderRadiusValue(topLeft: $0, topRight: topRight.wrappedValue, bottomLeft: bottomLeft)) }
        topRight.listen { self._changed(to: BorderRadiusValue(topLeft: topLeft.wrappedValue, topRight: $0, bottomLeft: bottomLeft)) }
    }
    
    public convenience init <A, C>(topLeft: A, topRight: BorderRadiusType, bottomLeft: C) where A: StateConvertible, A.Value == BorderRadiusType, C: StateConvertible, C.Value == BorderRadiusType {
        let topLeft = topLeft.stateValue
        let bottomLeft = bottomLeft.stateValue
        self.init(topLeft: topLeft.wrappedValue, topRight: topRight, bottomLeft: bottomLeft.wrappedValue)
        topLeft.listen { self._changed(to: BorderRadiusValue(topLeft: $0, topRight: topRight, bottomLeft: bottomLeft.wrappedValue)) }
        bottomLeft.listen { self._changed(to: BorderRadiusValue(topLeft: topLeft.wrappedValue, topRight: topRight, bottomLeft: $0)) }
    }
    
    public convenience init <B, C>(topLeft: BorderRadiusType, topRight: B, bottomLeft: C) where B: StateConvertible, B.Value == BorderRadiusType, C: StateConvertible, C.Value == BorderRadiusType {
        let topRight = topRight.stateValue
        let bottomLeft = bottomLeft.stateValue
        self.init(topLeft: topLeft, topRight: topRight.wrappedValue, bottomLeft: bottomLeft.wrappedValue)
        topRight.listen { self._changed(to: BorderRadiusValue(topLeft: topLeft, topRight: $0, bottomLeft: bottomLeft.wrappedValue)) }
        bottomLeft.listen { self._changed(to: BorderRadiusValue(topLeft: topLeft, topRight: topRight.wrappedValue, bottomLeft: $0)) }
    }
    
    public convenience init <A, B, C>(topLeft: A, topRight: B, bottomLeft: C) where A: StateConvertible, A.Value == BorderRadiusType, B: StateConvertible, B.Value == BorderRadiusType, C: StateConvertible, C.Value == BorderRadiusType {
        let topLeft = topLeft.stateValue
        let topRight = topRight.stateValue
        let bottomLeft = bottomLeft.stateValue
        self.init(topLeft: topLeft.wrappedValue, topRight: topRight.wrappedValue, bottomLeft: bottomLeft.wrappedValue)
        topLeft.listen { self._changed(to: BorderRadiusValue(topLeft: $0, topRight: topRight.wrappedValue, bottomLeft: bottomLeft.wrappedValue)) }
        topRight.listen { self._changed(to: BorderRadiusValue(topLeft: topLeft.wrappedValue, topRight: $0, bottomLeft: bottomLeft.wrappedValue)) }
        bottomLeft.listen { self._changed(to: BorderRadiusValue(topLeft: topLeft.wrappedValue, topRight: topRight.wrappedValue, bottomLeft: $0)) }
    }
    
    // MARK: TL/TR/BR/BL
    
    public init (topLeft: BorderRadiusType, topRight: BorderRadiusType, bottomRight: BorderRadiusType, bottomLeft: BorderRadiusType) {
        propertyValue = BorderRadiusValue(topLeft: topLeft, topRight: topRight, bottomRight: bottomRight, bottomLeft: bottomLeft)
    }
    
    public convenience init <A>(topLeft: A, topRight: BorderRadiusType, bottomRight: BorderRadiusType, bottomLeft: BorderRadiusType) where A: StateConvertible, A.Value == BorderRadiusType {
        let topLeft = topLeft.stateValue
        self.init(topLeft: topLeft.wrappedValue, topRight: topRight, bottomRight: bottomRight, bottomLeft: bottomLeft)
        topLeft.listen { self._changed(to: BorderRadiusValue(topLeft: $0, topRight: topRight, bottomRight: bottomRight, bottomLeft: bottomLeft)) }
    }
    
    public convenience init <B>(topLeft: BorderRadiusType, topRight: B, bottomRight: BorderRadiusType, bottomLeft: BorderRadiusType) where B: StateConvertible, B.Value == BorderRadiusType {
        let topRight = topRight.stateValue
        self.init(topLeft: topLeft, topRight: topRight.wrappedValue, bottomRight: bottomRight, bottomLeft: bottomLeft)
        topRight.listen { self._changed(to: BorderRadiusValue(topLeft: topLeft, topRight: $0, bottomRight: bottomRight, bottomLeft: bottomLeft)) }
    }
    
    public convenience init <C>(topLeft: BorderRadiusType, topRight: BorderRadiusType, bottomRight: C, bottomLeft: BorderRadiusType) where C: StateConvertible, C.Value == BorderRadiusType {
        let bottomRight = bottomRight.stateValue
        self.init(topLeft: topLeft, topRight: topRight, bottomRight: bottomRight.wrappedValue, bottomLeft: bottomLeft)
        bottomRight.listen { self._changed(to: BorderRadiusValue(topLeft: topLeft, topRight: topRight, bottomRight: $0, bottomLeft: bottomLeft)) }
    }
    
    public convenience init <D>(topLeft: BorderRadiusType, topRight: BorderRadiusType, bottomRight: BorderRadiusType, bottomLeft: D) where D: StateConvertible, D.Value == BorderRadiusType {
        let bottomLeft = bottomLeft.stateValue
        self.init(topLeft: topLeft, topRight: topRight, bottomRight: bottomRight, bottomLeft: bottomLeft.wrappedValue)
        bottomLeft.listen { self._changed(to: BorderRadiusValue(topLeft: topLeft, topRight: topRight, bottomRight: bottomRight, bottomLeft: $0)) }
    }
    
    public convenience init <A, B>(topLeft: A, topRight: B, bottomRight: BorderRadiusType, bottomLeft: BorderRadiusType) where A: StateConvertible, A.Value == BorderRadiusType, B: StateConvertible, B.Value == BorderRadiusType {
        let topLeft = topLeft.stateValue
        let topRight = topRight.stateValue
        self.init(topLeft: topLeft.wrappedValue, topRight: topRight.wrappedValue, bottomRight: bottomRight, bottomLeft: bottomLeft)
        topLeft.listen { self._changed(to: BorderRadiusValue(topLeft: $0, topRight: topRight.wrappedValue, bottomRight: bottomRight, bottomLeft: bottomLeft)) }
        topRight.listen { self._changed(to: BorderRadiusValue(topLeft: topLeft.wrappedValue, topRight: $0, bottomRight: bottomRight, bottomLeft: bottomLeft)) }
    }
    
    public convenience init <A, C>(topLeft: A, topRight: BorderRadiusType, bottomRight: C, bottomLeft: BorderRadiusType) where A: StateConvertible, A.Value == BorderRadiusType, C: StateConvertible, C.Value == BorderRadiusType {
        let topLeft = topLeft.stateValue
        let bottomRight = bottomRight.stateValue
        self.init(topLeft: topLeft.wrappedValue, topRight: topRight, bottomRight: bottomRight.wrappedValue, bottomLeft: bottomLeft)
        topLeft.listen { self._changed(to: BorderRadiusValue(topLeft: $0, topRight: topRight, bottomRight: bottomRight.wrappedValue, bottomLeft: bottomLeft)) }
        bottomRight.listen { self._changed(to: BorderRadiusValue(topLeft: topLeft.wrappedValue, topRight: topRight, bottomRight: $0, bottomLeft: bottomLeft)) }
    }
    
    public convenience init <A, D>(topLeft: A, topRight: BorderRadiusType, bottomRight: BorderRadiusType, bottomLeft: D) where A: StateConvertible, A.Value == BorderRadiusType, D: StateConvertible, D.Value == BorderRadiusType {
        let topLeft = topLeft.stateValue
        let bottomLeft = bottomLeft.stateValue
        self.init(topLeft: topLeft.wrappedValue, topRight: topRight, bottomRight: bottomRight, bottomLeft: bottomLeft.wrappedValue)
        topLeft.listen { self._changed(to: BorderRadiusValue(topLeft: $0, topRight: topRight, bottomRight: bottomRight, bottomLeft: bottomLeft.wrappedValue)) }
        bottomLeft.listen { self._changed(to: BorderRadiusValue(topLeft: topLeft.wrappedValue, topRight: topRight, bottomRight: bottomRight, bottomLeft: $0)) }
    }
    
    public convenience init <B, C>(topLeft: BorderRadiusType, topRight: B, bottomRight: C, bottomLeft: BorderRadiusType) where B: StateConvertible, B.Value == BorderRadiusType, C: StateConvertible, C.Value == BorderRadiusType {
        let topRight = topRight.stateValue
        let bottomRight = bottomRight.stateValue
        self.init(topLeft: topLeft, topRight: topRight.wrappedValue, bottomRight: bottomRight.wrappedValue, bottomLeft: bottomLeft)
        topRight.listen { self._changed(to: BorderRadiusValue(topLeft: topLeft, topRight: $0, bottomRight: bottomRight.wrappedValue, bottomLeft: bottomLeft)) }
        bottomRight.listen { self._changed(to: BorderRadiusValue(topLeft: topLeft, topRight: topRight.wrappedValue, bottomRight: $0, bottomLeft: bottomLeft)) }
    }

    public convenience init <B, D>(topLeft: BorderRadiusType, topRight: B, bottomRight: BorderRadiusType, bottomLeft: D) where B: StateConvertible, B.Value == BorderRadiusType, D: StateConvertible, D.Value == BorderRadiusType {
        let topRight = topRight.stateValue
        let bottomLeft = bottomLeft.stateValue
        self.init(topLeft: topLeft, topRight: topRight.wrappedValue, bottomRight: bottomRight, bottomLeft: bottomLeft.wrappedValue)
        topRight.listen { self._changed(to: BorderRadiusValue(topLeft: topLeft, topRight: $0, bottomRight: bottomRight, bottomLeft: bottomLeft.wrappedValue)) }
        bottomLeft.listen { self._changed(to: BorderRadiusValue(topLeft: topLeft, topRight: topRight.wrappedValue, bottomRight: bottomRight, bottomLeft: $0)) }
    }

    public convenience init <C, D>(topLeft: BorderRadiusType, topRight: BorderRadiusType, bottomRight: C, bottomLeft: D) where C: StateConvertible, C.Value == BorderRadiusType, D: StateConvertible, D.Value == BorderRadiusType {
        let bottomRight = bottomRight.stateValue
        let bottomLeft = bottomLeft.stateValue
        self.init(topLeft: topLeft, topRight: topRight, bottomRight: bottomRight.wrappedValue, bottomLeft: bottomLeft.wrappedValue)
        bottomRight.listen { self._changed(to: BorderRadiusValue(topLeft: topLeft, topRight: topRight, bottomRight: $0, bottomLeft: bottomLeft.wrappedValue)) }
        bottomLeft.listen { self._changed(to: BorderRadiusValue(topLeft: topLeft, topRight: topRight, bottomRight: bottomRight.wrappedValue, bottomLeft: $0)) }
    }

    public convenience init <A, B, C>(topLeft: A, topRight: B, bottomRight: C, bottomLeft: BorderRadiusType) where A: StateConvertible, A.Value == BorderRadiusType, B: StateConvertible, B.Value == BorderRadiusType, C: StateConvertible, C.Value == BorderRadiusType {
        let topLeft = topLeft.stateValue
        let topRight = topRight.stateValue
        let bottomRight = bottomRight.stateValue
        self.init(topLeft: topLeft.wrappedValue, topRight: topRight.wrappedValue, bottomRight: bottomRight.wrappedValue, bottomLeft: bottomLeft)
        topLeft.listen { self._changed(to: BorderRadiusValue(topLeft: $0, topRight: topRight.wrappedValue, bottomRight: bottomRight.wrappedValue, bottomLeft: bottomLeft)) }
        topRight.listen { self._changed(to: BorderRadiusValue(topLeft: topLeft.wrappedValue, topRight: $0, bottomRight: bottomRight.wrappedValue, bottomLeft: bottomLeft)) }
        bottomRight.listen { self._changed(to: BorderRadiusValue(topLeft: topLeft.wrappedValue, topRight: topRight.wrappedValue, bottomRight: $0, bottomLeft: bottomLeft)) }
    }

    public convenience init <A, B, D>(topLeft: A, topRight: B, bottomRight: BorderRadiusType, bottomLeft: D) where A: StateConvertible, A.Value == BorderRadiusType, B: StateConvertible, B.Value == BorderRadiusType, D: StateConvertible, D.Value == BorderRadiusType {
        let topLeft = topLeft.stateValue
        let topRight = topRight.stateValue
        let bottomLeft = bottomLeft.stateValue
        self.init(topLeft: topLeft.wrappedValue, topRight: topRight.wrappedValue, bottomRight: bottomRight, bottomLeft: bottomLeft.wrappedValue)
        topLeft.listen { self._changed(to: BorderRadiusValue(topLeft: $0, topRight: topRight.wrappedValue, bottomRight: bottomRight, bottomLeft: bottomLeft.wrappedValue)) }
        topRight.listen { self._changed(to: BorderRadiusValue(topLeft: topLeft.wrappedValue, topRight: $0, bottomRight: bottomRight, bottomLeft: bottomLeft.wrappedValue)) }
        bottomLeft.listen { self._changed(to: BorderRadiusValue(topLeft: topLeft.wrappedValue, topRight: topRight.wrappedValue, bottomRight: bottomRight, bottomLeft: $0)) }
    }

    public convenience init <A, C, D>(topLeft: A, topRight: BorderRadiusType, bottomRight: C, bottomLeft: D) where A: StateConvertible, A.Value == BorderRadiusType, C: StateConvertible, C.Value == BorderRadiusType, D: StateConvertible, D.Value == BorderRadiusType {
        let topLeft = topLeft.stateValue
        let bottomRight = bottomRight.stateValue
        let bottomLeft = bottomLeft.stateValue
        self.init(topLeft: topLeft.wrappedValue, topRight: topRight, bottomRight: bottomRight.wrappedValue, bottomLeft: bottomLeft.wrappedValue)
        topLeft.listen { self._changed(to: BorderRadiusValue(topLeft: $0, topRight: topRight, bottomRight: bottomRight.wrappedValue, bottomLeft: bottomLeft.wrappedValue)) }
        bottomRight.listen { self._changed(to: BorderRadiusValue(topLeft: topLeft.wrappedValue, topRight: topRight, bottomRight: $0, bottomLeft: bottomLeft.wrappedValue)) }
        bottomLeft.listen { self._changed(to: BorderRadiusValue(topLeft: topLeft.wrappedValue, topRight: topRight, bottomRight: bottomRight.wrappedValue, bottomLeft: $0)) }
    }

    public convenience init <B, C, D>(topLeft: BorderRadiusType, topRight: B, bottomRight: C, bottomLeft: D) where B: StateConvertible, B.Value == BorderRadiusType, C: StateConvertible, C.Value == BorderRadiusType, D: StateConvertible, D.Value == BorderRadiusType {
        let topRight = topRight.stateValue
        let bottomRight = bottomRight.stateValue
        let bottomLeft = bottomLeft.stateValue
        self.init(topLeft: topLeft, topRight: topRight.wrappedValue, bottomRight: bottomRight.wrappedValue, bottomLeft: bottomLeft.wrappedValue)
        topRight.listen { self._changed(to: BorderRadiusValue(topLeft: topLeft, topRight: $0, bottomRight: bottomRight.wrappedValue, bottomLeft: bottomLeft.wrappedValue)) }
        bottomRight.listen { self._changed(to: BorderRadiusValue(topLeft: topLeft, topRight: topRight.wrappedValue, bottomRight: $0, bottomLeft: bottomLeft.wrappedValue)) }
        bottomLeft.listen { self._changed(to: BorderRadiusValue(topLeft: topLeft, topRight: topRight.wrappedValue, bottomRight: bottomRight.wrappedValue, bottomLeft: $0)) }
    }

    public convenience init <A, B, C, D>(topLeft: A, topRight: B, bottomRight: C, bottomLeft: D) where A: StateConvertible, A.Value == BorderRadiusType, B: StateConvertible, B.Value == BorderRadiusType, C: StateConvertible, C.Value == BorderRadiusType, D: StateConvertible, D.Value == BorderRadiusType {
        let topLeft = topLeft.stateValue
        let topRight = topRight.stateValue
        let bottomRight = bottomRight.stateValue
        let bottomLeft = bottomLeft.stateValue
        self.init(topLeft: topLeft.wrappedValue, topRight: topRight.wrappedValue, bottomRight: bottomRight.wrappedValue, bottomLeft: bottomLeft.wrappedValue)
        topLeft.listen { self._changed(to: BorderRadiusValue(topLeft: $0, topRight: topRight.wrappedValue, bottomRight: bottomRight.wrappedValue, bottomLeft: bottomLeft.wrappedValue)) }
        topRight.listen { self._changed(to: BorderRadiusValue(topLeft: topLeft.wrappedValue, topRight: $0, bottomRight: bottomRight.wrappedValue, bottomLeft: bottomLeft.wrappedValue)) }
        bottomRight.listen { self._changed(to: BorderRadiusValue(topLeft: topLeft.wrappedValue, topRight: topRight.wrappedValue, bottomRight: $0, bottomLeft: bottomLeft.wrappedValue)) }
        bottomLeft.listen { self._changed(to: BorderRadiusValue(topLeft: topLeft.wrappedValue, topRight: topRight.wrappedValue, bottomRight: bottomRight.wrappedValue, bottomLeft: $0)) }
    }
}

extension PropertyKey {
    /// A shorthand property for the four border-*-radius properties
    public static var borderRadius: PropertyKey<BorderRadiusValue> { "border-radius".propertyKey() }
}

public class BorderRadiusValue: CustomStringConvertible, _PropertyValueInnerChangeable {
    @State public var value = ""
    
    var _changeHandler = {}
    
    public init (all: BorderRadiusType) {
        value = all.description
        $value.listen {
            self._changeHandler()
        }
    }
    
    public convenience init (all: State<BorderRadiusType>) {
        self.init(all: all.wrappedValue)
        all.listen {
            self.value = all.wrappedValue.description
        }
    }
    
    public convenience init <V>(all: ExpressableState<V, BorderRadiusType>) {
        self.init(all: all.unwrap())
    }
    
    private static func values(_ values: BorderRadiusType...) -> String {
        self.values(values)
    }
    
    private static func values(_ values: [BorderRadiusType]) -> String {
        values.map { $0.description }.joined(separator: " ")
    }
    
    // MARK: TL/BR
    
    public init (topLeft: BorderRadiusType, bottomRight: BorderRadiusType) {
        value = Self.values(topLeft, bottomRight)
        $value.listen {
            self._changeHandler()
        }
    }
    
    public convenience init (topLeft: State<BorderRadiusType>, bottomRight: BorderRadiusType) {
        self.init(topLeft: topLeft.wrappedValue, bottomRight: bottomRight)
        topLeft.listen {
            self.value = Self.values($0, bottomRight)
        }
    }
    
    public convenience init <V>(topLeft: ExpressableState<V, BorderRadiusType>, bottomRight: BorderRadiusType) {
        self.init(topLeft: topLeft.unwrap(), bottomRight: bottomRight)
    }
    
    public convenience init <V>(topLeft: ExpressableState<V, BorderRadiusType>, bottomRight: State<BorderRadiusType>) {
        self.init(topLeft: topLeft.unwrap(), bottomRight: bottomRight)
    }
    
    public convenience init <V>(topLeft: BorderRadiusType, bottomRight: ExpressableState<V, BorderRadiusType>) {
        self.init(topLeft: topLeft, bottomRight: bottomRight.unwrap())
    }
    
    public convenience init <V>(topLeft: State<BorderRadiusType>, bottomRight: ExpressableState<V, BorderRadiusType>) {
        self.init(topLeft: topLeft, bottomRight: bottomRight.unwrap())
    }
    
    public convenience init <V1, V2>(topLeft: ExpressableState<V1, BorderRadiusType>, bottomRight: ExpressableState<V2, BorderRadiusType>) {
        self.init(topLeft: topLeft.unwrap(), bottomRight: bottomRight.unwrap())
    }
    
    public convenience init (topLeft: BorderRadiusType, bottomRight: State<BorderRadiusType>) {
        self.init(topLeft: topLeft, bottomRight: bottomRight.wrappedValue)
        bottomRight.listen {
            self.value = Self.values(topLeft, $0)
        }
    }
    
    public convenience init (topLeft: State<BorderRadiusType>, bottomRight: State<BorderRadiusType>) {
        self.init(topLeft: topLeft.wrappedValue, bottomRight: bottomRight.wrappedValue)
        topLeft.listen {
            self.value = Self.values($0, bottomRight.wrappedValue)
        }
        bottomRight.listen {
            self.value = Self.values(topLeft.wrappedValue, $0)
        }
    }
    
    // MARK: Other
    
    public init (topLeft: BorderRadiusType, topRight: BorderRadiusType, bottomLeft: BorderRadiusType) {
        value = Self.values(topLeft, topRight, bottomLeft)
        $value.listen {
            self._changeHandler()
        }
    }
    
    public init (topLeft: BorderRadiusType, topRight: BorderRadiusType, bottomRight: BorderRadiusType, bottomLeft: BorderRadiusType) {
        value = Self.values(topLeft, topRight, bottomRight, bottomLeft)
        $value.listen {
            self._changeHandler()
        }
    }
    
    public var description: String { value }
}

extension Stylesheet {
    /// A shorthand property for the four border-*-radius properties
    public typealias BorderRadius = BorderRadiusProperty
}

extension CSSRulable {
    /// A shorthand property for the four border-*-radius properties
    public func borderRadius(all: BorderRadiusType) -> Self {
        s?._addProperty(BorderRadiusProperty(all: all))
        return self
    }
    
    /// A shorthand property for the four border-*-radius properties
    public func borderRadius<A>(all type: A) -> Self where A: StateConvertible, A.Value == BorderRadiusType {
        s?._addProperty(BorderRadiusProperty(all: type))
        return self
    }
    
    // MARK: TL/BR
    
    /// A shorthand property for the four border-*-radius properties
    public func borderRadius(topLeft: BorderRadiusType, bottomRight: BorderRadiusType) -> Self {
        s?._addProperty(BorderRadiusProperty(topLeft: topLeft, bottomRight: bottomRight))
        return self
    }
    
    /// A shorthand property for the four border-*-radius properties
    public func borderRadius<A>(topLeft: A, bottomRight: BorderRadiusType) -> Self where A: StateConvertible, A.Value == BorderRadiusType {
        s?._addProperty(BorderRadiusProperty(topLeft: topLeft, bottomRight: bottomRight))
        return self
    }
    
    /// A shorthand property for the four border-*-radius properties
    public func borderRadius<B>(topLeft: BorderRadiusType, bottomRight: B) -> Self where B: StateConvertible, B.Value == BorderRadiusType {
        s?._addProperty(BorderRadiusProperty(topLeft: topLeft, bottomRight: bottomRight))
        return self
    }

    /// A shorthand property for the four border-*-radius properties
    public func borderRadius<A, B>(topLeft: A, bottomRight: B) -> Self where A: StateConvertible, A.Value == BorderRadiusType, B: StateConvertible, B.Value == BorderRadiusType {
        s?._addProperty(BorderRadiusProperty(topLeft: topLeft, bottomRight: bottomRight))
        return self
    }

    // MARK: TL/TR/BL

    /// A shorthand property for the four border-*-radius properties
    public func borderRadius(topLeft: BorderRadiusType, topRight: BorderRadiusType, bottomLeft: BorderRadiusType) -> Self {
        s?._addProperty(BorderRadiusProperty(topLeft: topLeft, topRight: topRight, bottomLeft: bottomLeft))
        return self
    }

    /// A shorthand property for the four border-*-radius properties
    public func borderRadius<A>(topLeft: A, topRight: BorderRadiusType, bottomLeft: BorderRadiusType) -> Self where A: StateConvertible, A.Value == BorderRadiusType {
        s?._addProperty(BorderRadiusProperty(topLeft: topLeft, topRight: topRight, bottomLeft: bottomLeft))
        return self
    }

    /// A shorthand property for the four border-*-radius properties
    public func borderRadius<B>(topLeft: BorderRadiusType, topRight: B, bottomLeft: BorderRadiusType) -> Self where B: StateConvertible, B.Value == BorderRadiusType {
        s?._addProperty(BorderRadiusProperty(topLeft: topLeft, topRight: topRight, bottomLeft: bottomLeft))
        return self
    }

    /// A shorthand property for the four border-*-radius properties
    public func borderRadius<C>(topLeft: BorderRadiusType, topRight: BorderRadiusType, bottomLeft: C) -> Self where C: StateConvertible, C.Value == BorderRadiusType {
        s?._addProperty(BorderRadiusProperty(topLeft: topLeft, topRight: topRight, bottomLeft: bottomLeft))
        return self
    }

    /// A shorthand property for the four border-*-radius properties
    public func borderRadius<A, B>(topLeft: A, topRight: B, bottomLeft: BorderRadiusType) -> Self where A: StateConvertible, A.Value == BorderRadiusType, B: StateConvertible, B.Value == BorderRadiusType {
        s?._addProperty(BorderRadiusProperty(topLeft: topLeft, topRight: topRight, bottomLeft: bottomLeft))
        return self
    }

    /// A shorthand property for the four border-*-radius properties
    public func borderRadius<A, C>(topLeft: A, topRight: BorderRadiusType, bottomLeft: C) -> Self where A: StateConvertible, A.Value == BorderRadiusType, C: StateConvertible, C.Value == BorderRadiusType {
        s?._addProperty(BorderRadiusProperty(topLeft: topLeft, topRight: topRight, bottomLeft: bottomLeft))
        return self
    }

    /// A shorthand property for the four border-*-radius properties
    public func borderRadius<B, C>(topLeft: BorderRadiusType, topRight: B, bottomLeft: C) -> Self where B: StateConvertible, B.Value == BorderRadiusType, C: StateConvertible, C.Value == BorderRadiusType {
        s?._addProperty(BorderRadiusProperty(topLeft: topLeft, topRight: topRight, bottomLeft: bottomLeft))
        return self
    }

    /// A shorthand property for the four border-*-radius properties
    public func borderRadius<A, B, C>(topLeft: A, topRight: B, bottomLeft: C) -> Self where A: StateConvertible, A.Value == BorderRadiusType, B: StateConvertible, B.Value == BorderRadiusType, C: StateConvertible, C.Value == BorderRadiusType {
        s?._addProperty(BorderRadiusProperty(topLeft: topLeft, topRight: topRight, bottomLeft: bottomLeft))
        return self
    }

    // MARK: TL/TR/BR/BL

    /// A shorthand property for the four border-*-radius properties
    public func borderRadius(topLeft: BorderRadiusType, topRight: BorderRadiusType, bottomRight: BorderRadiusType, bottomLeft: BorderRadiusType) -> Self {
        s?._addProperty(BorderRadiusProperty(topLeft: topLeft, topRight: topRight, bottomRight: bottomRight, bottomLeft: bottomLeft))
        return self
    }

    /// A shorthand property for the four border-*-radius properties
    public func borderRadius<A>(topLeft: A, topRight: BorderRadiusType, bottomRight: BorderRadiusType, bottomLeft: BorderRadiusType) -> Self where A: StateConvertible, A.Value == BorderRadiusType {
        s?._addProperty(BorderRadiusProperty(topLeft: topLeft, topRight: topRight, bottomRight: bottomRight, bottomLeft: bottomLeft))
        return self
    }

    /// A shorthand property for the four border-*-radius properties
    public func borderRadius<B>(topLeft: BorderRadiusType, topRight: B, bottomRight: BorderRadiusType, bottomLeft: BorderRadiusType) -> Self where B: StateConvertible, B.Value == BorderRadiusType {
        s?._addProperty(BorderRadiusProperty(topLeft: topLeft, topRight: topRight, bottomRight: bottomRight, bottomLeft: bottomLeft))
        return self
    }

    /// A shorthand property for the four border-*-radius properties
    public func borderRadius<C>(topLeft: BorderRadiusType, topRight: BorderRadiusType, bottomRight: C, bottomLeft: BorderRadiusType) -> Self where C: StateConvertible, C.Value == BorderRadiusType {
        s?._addProperty(BorderRadiusProperty(topLeft: topLeft, topRight: topRight, bottomRight: bottomRight, bottomLeft: bottomLeft))
        return self
    }

    /// A shorthand property for the four border-*-radius properties
    public func borderRadius<D>(topLeft: BorderRadiusType, topRight: BorderRadiusType, bottomRight: BorderRadiusType, bottomLeft: D) -> Self where D: StateConvertible, D.Value == BorderRadiusType {
        s?._addProperty(BorderRadiusProperty(topLeft: topLeft, topRight: topRight, bottomRight: bottomRight, bottomLeft: bottomLeft))
        return self
    }

    /// A shorthand property for the four border-*-radius properties
    public func borderRadius<A, B>(topLeft: A, topRight: B, bottomRight: BorderRadiusType, bottomLeft: BorderRadiusType) -> Self where A: StateConvertible, A.Value == BorderRadiusType, B: StateConvertible, B.Value == BorderRadiusType {
        s?._addProperty(BorderRadiusProperty(topLeft: topLeft, topRight: topRight, bottomRight: bottomRight, bottomLeft: bottomLeft))
        return self
    }

    /// A shorthand property for the four border-*-radius properties
    public func borderRadius<A, C>(topLeft: A, topRight: BorderRadiusType, bottomRight: C, bottomLeft: BorderRadiusType) -> Self where A: StateConvertible, A.Value == BorderRadiusType, C: StateConvertible, C.Value == BorderRadiusType {
        s?._addProperty(BorderRadiusProperty(topLeft: topLeft, topRight: topRight, bottomRight: bottomRight, bottomLeft: bottomLeft))
        return self
    }

    /// A shorthand property for the four border-*-radius properties
    public func borderRadius<A, D>(topLeft: A, topRight: BorderRadiusType, bottomRight: BorderRadiusType, bottomLeft: D) -> Self where A: StateConvertible, A.Value == BorderRadiusType, D: StateConvertible, D.Value == BorderRadiusType {
        s?._addProperty(BorderRadiusProperty(topLeft: topLeft, topRight: topRight, bottomRight: bottomRight, bottomLeft: bottomLeft))
        return self
    }

    /// A shorthand property for the four border-*-radius properties
    public func borderRadius<B, C>(topLeft: BorderRadiusType, topRight: B, bottomRight: C, bottomLeft: BorderRadiusType) -> Self where B: StateConvertible, B.Value == BorderRadiusType, C: StateConvertible, C.Value == BorderRadiusType {
        s?._addProperty(BorderRadiusProperty(topLeft: topLeft, topRight: topRight, bottomRight: bottomRight, bottomLeft: bottomLeft))
        return self
    }

    /// A shorthand property for the four border-*-radius properties
    public func borderRadius<B, D>(topLeft: BorderRadiusType, topRight: B, bottomRight: BorderRadiusType, bottomLeft: D) -> Self where B: StateConvertible, B.Value == BorderRadiusType, D: StateConvertible, D.Value == BorderRadiusType {
        s?._addProperty(BorderRadiusProperty(topLeft: topLeft, topRight: topRight, bottomRight: bottomRight, bottomLeft: bottomLeft))
        return self
    }

    /// A shorthand property for the four border-*-radius properties
    public func borderRadius<C, D>(topLeft: BorderRadiusType, topRight: BorderRadiusType, bottomRight: C, bottomLeft: D) -> Self where C: StateConvertible, C.Value == BorderRadiusType, D: StateConvertible, D.Value == BorderRadiusType {
        s?._addProperty(BorderRadiusProperty(topLeft: topLeft, topRight: topRight, bottomRight: bottomRight, bottomLeft: bottomLeft))
        return self
    }

    /// A shorthand property for the four border-*-radius properties
    public func borderRadius<A, B, C>(topLeft: A, topRight: B, bottomRight: C, bottomLeft: BorderRadiusType) -> Self where A: StateConvertible, A.Value == BorderRadiusType, B: StateConvertible, B.Value == BorderRadiusType, C: StateConvertible, C.Value == BorderRadiusType {
        s?._addProperty(BorderRadiusProperty(topLeft: topLeft, topRight: topRight, bottomRight: bottomRight, bottomLeft: bottomLeft))
        return self
    }

    /// A shorthand property for the four border-*-radius properties
    public func borderRadius<A, B, D>(topLeft: A, topRight: B, bottomRight: BorderRadiusType, bottomLeft: D) -> Self where A: StateConvertible, A.Value == BorderRadiusType, B: StateConvertible, B.Value == BorderRadiusType, D: StateConvertible, D.Value == BorderRadiusType {
        s?._addProperty(BorderRadiusProperty(topLeft: topLeft, topRight: topRight, bottomRight: bottomRight, bottomLeft: bottomLeft))
        return self
    }

    /// A shorthand property for the four border-*-radius properties
    public func borderRadius<A, C, D>(topLeft: A, topRight: BorderRadiusType, bottomRight: C, bottomLeft: D) -> Self where A: StateConvertible, A.Value == BorderRadiusType, C: StateConvertible, C.Value == BorderRadiusType, D: StateConvertible, D.Value == BorderRadiusType {
        s?._addProperty(BorderRadiusProperty(topLeft: topLeft, topRight: topRight, bottomRight: bottomRight, bottomLeft: bottomLeft))
        return self
    }

    /// A shorthand property for the four border-*-radius properties
    public func borderRadius<B, C, D>(topLeft: BorderRadiusType, topRight: B, bottomRight: C, bottomLeft: D) -> Self where B: StateConvertible, B.Value == BorderRadiusType, C: StateConvertible, C.Value == BorderRadiusType, D: StateConvertible, D.Value == BorderRadiusType {
        s?._addProperty(BorderRadiusProperty(topLeft: topLeft, topRight: topRight, bottomRight: bottomRight, bottomLeft: bottomLeft))
        return self
    }

    /// A shorthand property for the four border-*-radius properties
    public func borderRadius<A, B, C, D>(topLeft: A, topRight: B, bottomRight: C, bottomLeft: D) -> Self where A: StateConvertible, A.Value == BorderRadiusType, B: StateConvertible, B.Value == BorderRadiusType, C: StateConvertible, C.Value == BorderRadiusType, D: StateConvertible, D.Value == BorderRadiusType {
        s?._addProperty(BorderRadiusProperty(topLeft: topLeft, topRight: topRight, bottomRight: bottomRight, bottomLeft: bottomLeft))
        return self
    }
}
