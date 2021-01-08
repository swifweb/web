//
//  BackgroundSizeProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Specifies the size of the background images
///
/// ```html
/// background-size: 300px 100px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_background-size.asp)
public class BackgroundSizeProperty: _Property {
    public var propertyKey: PropertyKey<BackgroundSizeValue> { .backgroundSize }
    public var propertyValue: BackgroundSizeValue
    var _content = _PropertyContent<BackgroundSizeValue>()
    
    // MARK: All
    
    public init (all: BackgroundSizeType) {
        propertyValue = BackgroundSizeValue(all: all)
    }
    
    public convenience init <A>(all type: A) where A: StateConvertible, A.Value == BackgroundSizeType {
        let state = type.stateValue
        self.init(all: state.wrappedValue)
        state.listen { self._changed(to: BackgroundSizeValue(all: $0)) }
    }
    
    // MARK: H/V
    
    public init (h: BackgroundSizeType, v: BackgroundSizeType) {
        propertyValue = BackgroundSizeValue(h: h, v: v)
    }
    
    public convenience init <A>(h: A, v: BackgroundSizeType) where A: StateConvertible, A.Value == BackgroundSizeType {
        let h = h.stateValue
        self.init(h: h.wrappedValue, v: v)
        h.listen { self._changed(to: BackgroundSizeValue(h: $0, v: v)) }
    }
    
    public convenience init <B>(h: BackgroundSizeType, v: B) where B: StateConvertible, B.Value == BackgroundSizeType {
        let v = v.stateValue
        self.init(h: h, v: v.wrappedValue)
        v.listen { self._changed(to: BackgroundSizeValue(h: h, v: $0)) }
    }
    
    public convenience init <A, B>(h: A, v: B) where A: StateConvertible, A.Value == BackgroundSizeType, B: StateConvertible, B.Value == BackgroundSizeType {
        let h = h.stateValue
        let v = v.stateValue
        self.init(h: h.wrappedValue, v: v.wrappedValue)
        h.listen { self._changed(to: BackgroundSizeValue(h: $0, v: v.wrappedValue)) }
        v.listen { self._changed(to: BackgroundSizeValue(h: h.wrappedValue, v: $0)) }
    }
}

extension PropertyKey {
    public static var backgroundSize: PropertyKey<BackgroundSizeValue> { "background-size".propertyKey() }
}

public class BackgroundSizeValue: CustomStringConvertible, _PropertyValueInnerChangeable {
    @State public var value = ""
    
    var _changeHandler = {}
    
    public init (all: BackgroundSizeType) {
        value = all.value
        $value.listen {
            self._changeHandler()
        }
    }
    
    public init (h: BackgroundSizeType, v: BackgroundSizeType) {
        value = [h.value, v.value].joined(separator: " ")
        $value.listen {
            self._changeHandler()
        }
    }
    
    public var description: String { value }
}

extension Stylesheet {
    /// Specifies the size of the background images
    public typealias BackgroundSize = BackgroundSizeProperty
}

extension CSSRulable {
    // MARK: All
    
    /// Specifies the size of the background images
    public func backgroundSize(all: BackgroundSizeType) -> Self {
        s?._addProperty(.backgroundSize, .init(all: all))
        return self
    }
    
    /// Specifies the size of the background images
    public func backgroundSize<A>(all value: A) -> Self where A: StateConvertible, A.Value == BackgroundSizeType {
        s?._addProperty(BackgroundSizeProperty(all: value))
        return self
    }
    
    // MARK: H/V
    
    /// Specifies the size of the background images
    public func backgroundSize(h: BackgroundSizeType, v: BackgroundSizeType) -> Self {
        s?._addProperty(BackgroundSizeProperty(h: h, v: v))
        return self
    }
    
    /// Specifies the size of the background images
    public func backgroundSize<A>(h: A, v: BackgroundSizeType) -> Self where A: StateConvertible, A.Value == BackgroundSizeType {
        s?._addProperty(BackgroundSizeProperty(h: h, v: v))
        return self
    }
    
    /// Specifies the size of the background images
    public func backgroundSize<B>(h: BackgroundSizeType, v: B) -> Self where B: StateConvertible, B.Value == BackgroundSizeType {
        s?._addProperty(BackgroundSizeProperty(h: h, v: v))
        return self
    }
    
    /// Specifies the size of the background images
    public func backgroundSize<A, B>(h: A, v: B) -> Self where A: StateConvertible, A.Value == BackgroundSizeType, B: StateConvertible, B.Value == BackgroundSizeType {
        s?._addProperty(BackgroundSizeProperty(h: h, v: v))
        return self
    }
}
