//
//  TitleAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol TitleAttrable: DOMElement {
    @discardableResult
    func title(_ value: String) -> Self
    @discardableResult
    func title<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension TitleAttrable {
    /// Text to be displayed in a tooltip when hovering over the element.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/title)
    @discardableResult
    public func title(_ value: String) -> Self {
        setAttribute("title", value)
        return self
    }
    
    /// Text to be displayed in a tooltip when hovering over the element.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/title)
    @discardableResult
    public func title<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        title(value.stateValue.wrappedValue)
        value.stateValue.listen { self.title($0) }
        return self
    }
}

extension BaseElement: TitleAttrable {}
