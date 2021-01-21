//
//  ShapeAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol ShapeAttrable {
    @discardableResult
    func shape(_ value: ShapeType) -> Self
    @discardableResult
    func shape(_ value: State<ShapeType>) -> Self
    @discardableResult
    func shape<V>(_ expressable: ExpressableState<V, ShapeType>) -> Self
}

protocol _ShapeAttrable: _AnyElement, ShapeAttrable {}

extension ShapeAttrable {
    /// The shape of the associated hot spot.
    ///
    /// Applicable to <a>, <area>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/area)
    @discardableResult
    public func shape(_ value: ShapeType) -> Self {
        guard let s = self as? _ShapeAttrable else { return self }
        s.domElement.shape = value.value.jsValue()
        return self
    }
    
    /// The shape of the associated hot spot.
    ///
    /// Applicable to <a>, <area>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/area)
    @discardableResult
    public func shape(_ value: State<ShapeType>) -> Self {
        value.listen { self.shape($0) }
        return self
    }
    
    /// The shape of the associated hot spot.
    ///
    /// Applicable to <a>, <area>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/area)
    @discardableResult
    public func shape<V>(_ expressable: ExpressableState<V, ShapeType>) -> Self {
        shape(expressable.unwrap())
    }
}

extension A: _ShapeAttrable {}
extension Area: _ShapeAttrable {}
