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
    
    public convenience init (all type: State<BackgroundSizeType>) {
        self.init(all: type.wrappedValue)
        type.listen { self._changed(to: BackgroundSizeValue(all: $0)) }
    }

    public convenience init <V>(all type: ExpressableState<V, BackgroundSizeType>) {
        self.init(all: type.unwrap())
    }
    
    convenience init<U: UnitValuable>(all value: U) {
        self.init(all: .init(value.value.doubleValue, value.unit))
    }
    
    public convenience init <U: UnitValuable>(all value: State<U>) {
        self.init(all: value.wrappedValue)
        value.listen { self._changed(to: BackgroundSizeValue(all: .init($0.value.doubleValue, $0.unit))) }
    }

    public convenience init <V, U: UnitValuable>(all value: ExpressableState<V, U>) {
        self.init(all: value.unwrap())
    }
    
    // MARK: H/V
    
    public init (h: BackgroundSizeType, v: BackgroundSizeType) {
        propertyValue = BackgroundSizeValue(h: h, v: v)
    }
    
    public init <H: UnitValuable, V: UnitValuable>(h: H, v: V) {
        propertyValue = BackgroundSizeValue(h: .init(h.value.doubleValue, h.unit), v: .init(v.value.doubleValue, v.unit))
    }
    
    public convenience init <H: UnitValuable>(h: State<H>, v: BackgroundSizeType) {
        self.init(h: h.wrappedValue, v: v)
        h.listen { self._changed(to: BackgroundSizeValue(h: .init($0.value.doubleValue, $0.unit), v: v)) }
    }
    
    public convenience init <H: UnitValuable>(h: State<H>, v: State<BackgroundSizeType>) {
        self.init(h: h.wrappedValue, v: v.wrappedValue)
        h.listen { self._changed(to: BackgroundSizeValue(h: .init($0.value.doubleValue, $0.unit), v: v.wrappedValue)) }
        v.listen { self._changed(to: BackgroundSizeValue(h: .init(h.wrappedValue.value.doubleValue, h.wrappedValue.unit), v: $0)) }
    }
    
    public convenience init <V: UnitValuable>(h: State<BackgroundSizeType>, v: State<V>) {
        self.init(h: h.wrappedValue, v: v.wrappedValue)
        h.listen { self._changed(to: BackgroundSizeValue(h: $0, v: .init(v.wrappedValue.value.doubleValue, v.wrappedValue.unit))) }
        v.listen { self._changed(to: BackgroundSizeValue(h: h.wrappedValue, v: .init($0.value.doubleValue, $0.unit))) }
    }
    
    public convenience init <D, H: UnitValuable>(h: ExpressableState<D, H>, v: BackgroundSizeType) {
        self.init(h: h.unwrap(), v: v)
    }
    
    public init <V: UnitValuable>(h: BackgroundSizeType, v: V) {
        propertyValue = BackgroundSizeValue(h: h, v: .init(v.value.doubleValue, v.unit))
    }
    
    public convenience init <V: UnitValuable>(h: BackgroundSizeType, v: State<V>) {
        self.init(h: h, v: v.wrappedValue)
        v.listen { self._changed(to: BackgroundSizeValue(h: h, v: .init($0.value.doubleValue, $0.unit))) }
    }
    
    public convenience init <D, V: UnitValuable>(h: BackgroundSizeType, v: ExpressableState<D, V>) {
        self.init(h: h, v: v.unwrap())
    }
    
    public init <H: UnitValuable>(h: H, v: BackgroundSizeType) {
        propertyValue = BackgroundSizeValue(h: .init(h.value.doubleValue, h.unit), v: v)
    }
    
    public convenience init (h: State<BackgroundSizeType>, v: State<BackgroundSizeType>) {
        self.init(h: h.wrappedValue, v: v.wrappedValue)
        h.listen { self._changed(to: BackgroundSizeValue(h: $0, v: v.wrappedValue)) }
        v.listen { self._changed(to: BackgroundSizeValue(h: h.wrappedValue, v: $0)) }
    }
    
    public convenience init (h: BackgroundSizeType, v: State<BackgroundSizeType>) {
        self.init(h: h, v: v.wrappedValue)
        v.listen { self._changed(to: BackgroundSizeValue(h: h, v: $0)) }
    }
    
    public convenience init <H: UnitValuable>(h: H, v: State<BackgroundSizeType>) {
        self.init(h: h, v: v.wrappedValue)
        v.listen { self._changed(to: BackgroundSizeValue(h: .init(h.value.doubleValue, h.unit), v: $0)) }
    }
    
    public convenience init (h: State<BackgroundSizeType>, v: BackgroundSizeType) {
        self.init(h: h.wrappedValue, v: v)
        h.listen { self._changed(to: BackgroundSizeValue(h: $0, v: v)) }
    }
    
    public convenience init <V: UnitValuable>(h: State<BackgroundSizeType>, v: V) {
        self.init(h: h.wrappedValue, v: v)
        h.listen { self._changed(to: BackgroundSizeValue(h: $0, v: .init(v.value.doubleValue, v.unit))) }
    }

    public convenience init <V>(h: BackgroundSizeType, v: ExpressableState<V, BackgroundSizeType>) {
        self.init(h: h, v: v.unwrap())
    }
    
    public convenience init <H: UnitValuable, V>(h: H, v: ExpressableState<V, BackgroundSizeType>) {
        self.init(h: h, v: v.unwrap())
    }
    
    public convenience init <V>(h: State<BackgroundSizeType>, v: ExpressableState<V, BackgroundSizeType>) {
        self.init(h: h, v: v.unwrap())
    }
    
    public convenience init <H: UnitValuable, V>(h: State<H>, v: ExpressableState<V, BackgroundSizeType>) {
        self.init(h: h, v: v.unwrap())
    }
    
    public convenience init <H>(h: ExpressableState<H, BackgroundSizeType>, v: BackgroundSizeType) {
        self.init(h: h.unwrap(), v: v)
    }
    
    public convenience init <H, V: UnitValuable>(h: ExpressableState<H, BackgroundSizeType>, v: V) {
        self.init(h: h.unwrap(), v: v)
    }
    
    public convenience init <H>(h: ExpressableState<H, BackgroundSizeType>, v: State<BackgroundSizeType>) {
        self.init(h: h.unwrap(), v: v)
    }
    
    public convenience init <H, V: UnitValuable>(h: ExpressableState<H, BackgroundSizeType>, v: State<V>) {
        self.init(h: h.unwrap(), v: v)
    }
    
    public convenience init <H, V>(h: ExpressableState<H, BackgroundSizeType>, v: ExpressableState<V, BackgroundSizeType>) {
        self.init(h: h.unwrap(), v: v.unwrap())
    }
}

extension PropertyKey {
    public static var backgroundSize: PropertyKey<BackgroundSizeValue> { "background-size".propertyKey() }
}

public struct BackgroundSizeValue: CustomStringConvertible {
    public let value: String
    
    public init (all: BackgroundSizeType) {
        value = all.value
    }
    
    public init (h: BackgroundSizeType, v: BackgroundSizeType) {
        value = [h.value, v.value].joined(separator: " ")
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
    public func backgroundSize(all value: State<BackgroundSizeType>) -> Self {
        s?._addProperty(BackgroundSizeProperty(all: value))
        return self
    }
    
    /// Specifies the size of the background images
    public func backgroundSize<V>(all value: ExpressableState<V, BackgroundSizeType>) -> Self {
        backgroundSize(all: value.unwrap())
    }
    
    /// Specifies the size of the background images
    public func backgroundSize<U: UnitValuable>(all value: U) -> Self {
        s?._addProperty(BackgroundSizeProperty(all: value))
        return self
    }
    
    /// Specifies the size of the background images
    public func backgroundSize<U: UnitValuable>(all value: State<U>) -> Self {
        s?._addProperty(BackgroundSizeProperty(all: value))
        return self
    }
    
    /// Specifies the size of the background images
    public func backgroundSize<V, U: UnitValuable>(all value: ExpressableState<V, U>) -> Self {
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
    public func backgroundSize<H: UnitValuable, V: UnitValuable>(h: H, v: V) -> Self {
        s?._addProperty(BackgroundSizeProperty(h: h, v: v))
        return self
    }
    
    /// Specifies the size of the background images
    public func backgroundSize<H: UnitValuable>(h: State<H>, v: BackgroundSizeType) -> Self {
        s?._addProperty(BackgroundSizeProperty(h: h, v: v))
        return self
    }
    
    /// Specifies the size of the background images
    public func backgroundSize<H: UnitValuable>(h: State<H>, v: State<BackgroundSizeType>) -> Self {
        s?._addProperty(BackgroundSizeProperty(h: h, v: v))
        return self
    }
    
    /// Specifies the size of the background images
    public func backgroundSize<V: UnitValuable>(h: State<BackgroundSizeType>, v: State<V>) -> Self {
        s?._addProperty(BackgroundSizeProperty(h: h, v: v))
        return self
    }
    
    /// Specifies the size of the background images
    public func backgroundSize<D, H: UnitValuable>(h: ExpressableState<D, H>, v: BackgroundSizeType) -> Self {
        backgroundSize(h: h.unwrap(), v: v)
    }
    
    /// Specifies the size of the background images
    public func backgroundSize<V: UnitValuable>(h: BackgroundSizeType, v: V) -> Self {
        s?._addProperty(BackgroundSizeProperty(h: h, v: v))
        return self
    }
    
    /// Specifies the size of the background images
    public func backgroundSize<V: UnitValuable>(h: BackgroundSizeType, v: State<V>) -> Self {
        backgroundSize(h: h, v: v.wrappedValue)
    }
    
    /// Specifies the size of the background images
    public func backgroundSize<D, V: UnitValuable>(h: BackgroundSizeType, v: ExpressableState<D, V>) -> Self {
        backgroundSize(h: h, v: v.unwrap())
    }
    
    /// Specifies the size of the background images
    public func backgroundSize<H: UnitValuable>(h: H, v: BackgroundSizeType) -> Self {
        s?._addProperty(BackgroundSizeProperty(h: h, v: v))
        return self
    }
    
    public func backgroundSize(h: State<BackgroundSizeType>, v: State<BackgroundSizeType>) -> Self {
        backgroundSize(h: h.wrappedValue, v: v.wrappedValue)
    }
    
    /// Specifies the size of the background images
    public func backgroundSize(h: BackgroundSizeType, v: State<BackgroundSizeType>) -> Self {
        backgroundSize(h: h, v: v.wrappedValue)
    }
    
    public func backgroundSize<H: UnitValuable>(h: H, v: State<BackgroundSizeType>) -> Self {
        backgroundSize(h: h, v: v.wrappedValue)
    }
    
    /// Specifies the size of the background images
    public func backgroundSize(h: State<BackgroundSizeType>, v: BackgroundSizeType) -> Self {
        backgroundSize(h: h.wrappedValue, v: v)
    }
    
    /// Specifies the size of the background images
    public func backgroundSize<V: UnitValuable>(h: State<BackgroundSizeType>, v: V) -> Self {
        backgroundSize(h: h.wrappedValue, v: v)
    }
    
    /// Specifies the size of the background images
    public func backgroundSize<V>(h: BackgroundSizeType, v: ExpressableState<V, BackgroundSizeType>) -> Self {
        backgroundSize(h: h, v: v.unwrap())
    }
    
    /// Specifies the size of the background images
    public func backgroundSize<H: UnitValuable, V>(h: H, v: ExpressableState<V, BackgroundSizeType>) -> Self {
        backgroundSize(h: h, v: v.unwrap())
    }
    
    /// Specifies the size of the background images
    public func backgroundSize<V>(h: State<BackgroundSizeType>, v: ExpressableState<V, BackgroundSizeType>) -> Self {
        backgroundSize(h: h, v: v.unwrap())
    }
    
    /// Specifies the size of the background images
    public func backgroundSize<H: UnitValuable, V>(h: State<H>, v: ExpressableState<V, BackgroundSizeType>) -> Self {
        backgroundSize(h: h, v: v.unwrap())
    }
    
    /// Specifies the size of the background images
    public func backgroundSize<H>(h: ExpressableState<H, BackgroundSizeType>, v: BackgroundSizeType) -> Self {
        backgroundSize(h: h.unwrap(), v: v)
    }
    
    /// Specifies the size of the background images
    public func backgroundSize<H, V: UnitValuable>(h: ExpressableState<H, BackgroundSizeType>, v: V) -> Self {
        backgroundSize(h: h.unwrap(), v: v)
    }
    
    /// Specifies the size of the background images
    public func backgroundSize<H>(h: ExpressableState<H, BackgroundSizeType>, v: State<BackgroundSizeType>) -> Self {
        backgroundSize(h: h.unwrap(), v: v)
    }
    
    /// Specifies the size of the background images
    public func backgroundSize<H, V: UnitValuable>(h: ExpressableState<H, BackgroundSizeType>, v: State<V>) -> Self {
        backgroundSize(h: h.unwrap(), v: v)
    }
    
    /// Specifies the size of the background images
    public func backgroundSize<H, V>(h: ExpressableState<H, BackgroundSizeType>, v: ExpressableState<V, BackgroundSizeType>) -> Self {
        backgroundSize(h: h.unwrap(), v: v.unwrap())
    }
}
