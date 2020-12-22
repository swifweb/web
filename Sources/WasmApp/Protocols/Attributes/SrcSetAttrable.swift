//
//  SrcSetAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol SrcSetAttrable {
    @discardableResult
    func srcSet(_ value: String) -> Self
    @discardableResult
    func srcSet(_ value: State<String>) -> Self
    @discardableResult
    func srcSet<V>(_ expressable: ExpressableState<V, String>) -> Self
}

protocol _SrcSetAttrable: _AnyElement, SrcSetAttrable {}

extension SrcSetAttrable {
    /// The srcset attribute specifies the URL of the image to use in different situations.
    ///
    /// Applicable to <img>, <source>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_source_srcset.asp)
    @discardableResult
    public func srcSet(_ value: String) -> Self {
        guard let s = self as? _SrcSetAttrable else { return self }
        s.domElement.srcset = value.jsValue()
        return self
    }
    
    /// The srcset attribute specifies the URL of the image to use in different situations.
    ///
    /// Applicable to <img>, <source>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_source_srcset.asp)
    @discardableResult
    public func srcSet(_ value: State<String>) -> Self {
        value.listen { self.srcSet($0) }
        return self
    }
    
    /// The srcset attribute specifies the URL of the image to use in different situations.
    ///
    /// Applicable to <img>, <source>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_source_srcset.asp)
    @discardableResult
    public func srcSet<V>(_ expressable: ExpressableState<V, String>) -> Self {
        srcSet(expressable.unwrap())
    }
}

extension Img: _SrcSetAttrable {}
extension Source: _SrcSetAttrable {}
