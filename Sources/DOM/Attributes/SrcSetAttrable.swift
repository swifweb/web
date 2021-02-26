//
//  SrcSetAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol SrcSetAttrable: DOMElement {
    @discardableResult
    func srcSet(_ value: String) -> Self
    @discardableResult
    func srcSet<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension SrcSetAttrable {
    /// The srcset attribute specifies the URL of the image to use in different situations.
    ///
    /// Applicable to `<img>`, `<source>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_source_srcset.asp)
    @discardableResult
    public func srcSet(_ value: String) -> Self {
        setAttribute("srcset", value)
        return self
    }
    
    /// The srcset attribute specifies the URL of the image to use in different situations.
    ///
    /// Applicable to `<img>`, `<source>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_source_srcset.asp)
    @discardableResult
    public func srcSet<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        srcSet(value.stateValue.wrappedValue)
        value.stateValue.listen { self.srcSet($0) }
        return self
    }
}

extension Img: SrcSetAttrable {}
extension Source: SrcSetAttrable {}
