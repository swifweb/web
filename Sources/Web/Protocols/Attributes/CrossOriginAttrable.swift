//
//  CrossOriginAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation
import JavaScriptKit

public protocol CrossOriginAttrable {
    @discardableResult
    func crossOrigin(_ value: CrossOriginType) -> Self
    @discardableResult
    func crossOrigin(_ value: State<CrossOriginType>) -> Self
    @discardableResult
    func crossOrigin<V>(_ expressable: ExpressableState<V, CrossOriginType>) -> Self
}

protocol _CrossOriginAttrable: _AnyElement, CrossOriginAttrable {}

extension CrossOriginAttrable {
    /// How the element handles cross-origin requests
    ///
    /// Applicable to <audio>, <img>, <link>, <script>, <video>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/crossorigin)
    @discardableResult
    public func crossOrigin(_ value: CrossOriginType) -> Self {
        guard let s = self as? _CrossOriginAttrable else { return self }
        s.domElement.crossorigin = value.value.jsValue()
        return self
    }
    
    /// How the element handles cross-origin requests
    ///
    /// Applicable to <audio>, <img>, <link>, <script>, <video>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/crossorigin)
    @discardableResult
    public func crossOrigin(_ value: State<CrossOriginType>) -> Self {
        value.listen { self.crossOrigin($0) }
        return self
    }
    
    /// How the element handles cross-origin requests
    ///
    /// Applicable to <audio>, <img>, <link>, <script>, <video>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/crossorigin)
    @discardableResult
    public func crossOrigin<V>(_ expressable: ExpressableState<V, CrossOriginType>) -> Self {
        crossOrigin(expressable.unwrap())
    }
}

extension Audio: _CrossOriginAttrable {}
extension Img: _CrossOriginAttrable {}
extension Link: _CrossOriginAttrable {}
extension Script: _CrossOriginAttrable {}
extension Video: _CrossOriginAttrable {}
