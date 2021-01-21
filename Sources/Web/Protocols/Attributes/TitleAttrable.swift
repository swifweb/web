//
//  TitleAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol TitleAttrable {
    @discardableResult
    func title(_ value: String) -> Self
    @discardableResult
    func title(_ value: State<String>) -> Self
    @discardableResult
    func title<V>(_ expressable: ExpressableState<V, String>) -> Self
}

protocol _TitleAttrable: _AnyElement, TitleAttrable {}

extension TitleAttrable {
    /// Text to be displayed in a tooltip when hovering over the element.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/title)
    @discardableResult
    public func title(_ value: String) -> Self {
        guard let s = self as? _TitleAttrable else { return self }
        s.domElement.title = value.jsValue()
        return self
    }
    
    /// Text to be displayed in a tooltip when hovering over the element.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/title)
    @discardableResult
    public func title(_ value: State<String>) -> Self {
        value.listen { self.title($0) }
        return self
    }
    
    /// Text to be displayed in a tooltip when hovering over the element.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/title)
    @discardableResult
    public func title<V>(_ expressable: ExpressableState<V, String>) -> Self {
        title(expressable.unwrap())
    }
}

extension BaseElement: _TitleAttrable {}
