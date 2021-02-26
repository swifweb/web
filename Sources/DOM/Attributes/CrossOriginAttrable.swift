//
//  CrossOriginAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation

public protocol CrossOriginAttrable: DOMElement {
    @discardableResult
    func crossOrigin(_ value: CrossOriginType) -> Self
    @discardableResult
    func crossOrigin<S>(_ value: S) -> Self where S: StateConvertible, S.Value == CrossOriginType
}

extension CrossOriginAttrable {
    /// How the element handles cross-origin requests
    ///
    /// Applicable to `<audio>`, `<img>`, `<link>`, `<script>`, `<video>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/crossorigin)
    @discardableResult
    public func crossOrigin(_ value: CrossOriginType) -> Self {
        setAttribute("crossorigin", value.value)
        return self
    }
    
    /// How the element handles cross-origin requests
    ///
    /// Applicable to `<audio>`, `<img>`, `<link>`, `<script>`, `<video>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/crossorigin)
    @discardableResult
    public func crossOrigin<S>(_ value: S) -> Self where S: StateConvertible, S.Value == CrossOriginType {
        crossOrigin(value.stateValue.wrappedValue)
        value.stateValue.listen { self.crossOrigin($0) }
        return self
    }
}

extension Audio: CrossOriginAttrable {}
extension Img: CrossOriginAttrable {}
extension Link: CrossOriginAttrable {}
extension Script: CrossOriginAttrable {}
extension Video: CrossOriginAttrable {}
