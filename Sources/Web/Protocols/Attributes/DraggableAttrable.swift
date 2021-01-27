//
//  DraggableAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol DraggableAttrable {
    @discardableResult
    func draggable(_ value: Bool) -> Self
    @discardableResult
    func draggable<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

protocol _DraggableAttrable: _AnyElement, DraggableAttrable {}

extension DraggableAttrable {
    /// Defines whether the element can be dragged.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/draggable)
    @discardableResult
    public func draggable(_ value: Bool) -> Self {
        guard let s = self as? _DraggableAttrable else { return self }
        s.setAttribute("draggable", value, .full)
        return self
    }
    
    /// Defines whether the element can be dragged.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/draggable)
    @discardableResult
    public func draggable<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        draggable(value.stateValue.wrappedValue)
        value.stateValue.listen { self.draggable($0) }
        return self
    }
}

extension BaseElement: _DraggableAttrable {}
