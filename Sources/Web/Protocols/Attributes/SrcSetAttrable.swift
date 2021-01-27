//
//  SrcSetAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol SrcSetAttrable {
    @discardableResult
    func srcSet(_ value: String) -> Self
    @discardableResult
    func srcSet<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

protocol _SrcSetAttrable: _AnyElement, SrcSetAttrable {}

extension SrcSetAttrable {
    /// The srcset attribute specifies the URL of the image to use in different situations.
    ///
    /// Applicable to `<img>`, `<source>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_source_srcset.asp)
    @discardableResult
    public func srcSet(_ value: String) -> Self {
        guard let s = self as? _SrcSetAttrable else { return self }
        s.setAttribute("srcset", value)
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

extension Img: _SrcSetAttrable {}
extension Source: _SrcSetAttrable {}
