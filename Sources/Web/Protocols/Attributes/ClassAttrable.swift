//
//  ClassAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation
import JavaScriptKit

public protocol ClassAttrable {
    @discardableResult
    func `class`(_ value: [String]) -> Self
    @discardableResult
    func `class`(_ value: String...) -> Self
    @discardableResult
    func `class`(_ value: State<String>) -> Self
    @discardableResult
    func `class`<V>(_ expressable: ExpressableState<V, String>) -> Self
    @discardableResult
    func `class`(_ value: State<[String]>) -> Self
    @discardableResult
    func `class`<V>(_ expressable: ExpressableState<V, [String]>) -> Self
}

protocol _ClassAttrable: _AnyElement, ClassAttrable {}

extension ClassAttrable {
    /// The class global attribute is a space-separated list of the case-sensitive classes of the element.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/class)
    @discardableResult
    private func `class`(value: String) -> Self {
        guard let s = self as? _ClassAttrable else { return self }
        s.domElement.class = value.jsValue()
        return self
    }
    
    /// The class global attribute is a space-separated list of the case-sensitive classes of the element.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/class)
    @discardableResult
    public func `class`(_ value: [String]) -> Self {
        `class`(value: value.joined(separator: ","))
    }
    
    /// The class global attribute is a space-separated list of the case-sensitive classes of the element.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/class)
    @discardableResult
    public func `class`(_ value: String...) -> Self {
        `class`(value)
    }
    
    /// The class global attribute is a space-separated list of the case-sensitive classes of the element.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/class)
    @discardableResult
    public func `class`(_ value: State<String>) -> Self {
        value.listen { self.`class`(value: $0) }
        return self
    }
    
    /// The class global attribute is a space-separated list of the case-sensitive classes of the element.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/class)
    @discardableResult
    public func `class`<V>(_ expressable: ExpressableState<V, String>) -> Self {
        `class`(expressable.unwrap())
    }
    
    /// The class global attribute is a space-separated list of the case-sensitive classes of the element.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/class)
    @discardableResult
    public func `class`(_ value: State<[String]>) -> Self {
        value.listen { self.`class`($0) }
        return self
    }
    
    /// The class global attribute is a space-separated list of the case-sensitive classes of the element.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/class)
    @discardableResult
    public func `class`<V>(_ expressable: ExpressableState<V, [String]>) -> Self {
        `class`(expressable.unwrap())
    }
}

extension BaseElement: _ClassAttrable {}
