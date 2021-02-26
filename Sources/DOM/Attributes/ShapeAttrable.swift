//
//  ShapeAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol ShapeAttrable: DOMElement {
    @discardableResult
    func shape(_ value: ShapeType) -> Self
    @discardableResult
    func shape<S>(_ value: S) -> Self where S: StateConvertible, S.Value == ShapeType
}

extension ShapeAttrable {
    /// The shape of the associated hot spot.
    ///
    /// Applicable to `<a>`, `<area>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/area)
    @discardableResult
    public func shape(_ value: ShapeType) -> Self {
        setAttribute("shape", value.value)
        return self
    }
    
    /// The shape of the associated hot spot.
    ///
    /// Applicable to `<a>`, `<area>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/area)
    @discardableResult
    public func shape<S>(_ value: S) -> Self where S: StateConvertible, S.Value == ShapeType {
        shape(value.stateValue.wrappedValue)
        value.stateValue.listen { self.shape($0) }
        return self
    }
}

extension A: ShapeAttrable {}
extension Area: ShapeAttrable {}
