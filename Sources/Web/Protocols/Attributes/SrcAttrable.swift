//
//  SrcAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol SrcAttrable {
    @discardableResult
    func src<U: URLConformable>(_ value: U) -> Self
    @discardableResult
    func src<S>(_ value: S) -> Self where S: StateConvertible, S.Value: URLConformable
}

protocol _SrcAttrable: _AnyElement, SrcAttrable {}

extension SrcAttrable {
    /// The URL of the embeddable content.
    ///
    /// Applicable to `<audio>`, `<embed>`, `<iframe>`,
    /// `<img>`, `<input>`, `<script>`, `<source>`, `<track>`, `<video>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_src.asp)
    @discardableResult
    public func src<U: URLConformable>(_ value: U) -> Self {
        guard let s = self as? _SrcAttrable else { return self }
        s.domElement.src = value.stringValue.jsValue()
        return self
    }
    
    /// The URL of the embeddable content.
    ///
    /// Applicable to `<audio>`, `<embed>`, `<iframe>`,
    /// `<img>`, `<input>`, `<script>`, `<source>`, `<track>`, `<video>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_src.asp)
    @discardableResult
    public func src<S>(_ value: S) -> Self where S: StateConvertible, S.Value: URLConformable {
        src(value.stateValue.wrappedValue)
        value.stateValue.listen { self.src($0) }
        return self
    }
}

extension Audio: _SrcAttrable {}
extension Embed: _SrcAttrable {}
extension IFrame: _SrcAttrable {}
extension Img: _SrcAttrable {}
extension InputImage: _SrcAttrable {}
extension Script: _SrcAttrable {}
extension Source: _SrcAttrable {}
extension Track: _SrcAttrable {}
extension Video: _SrcAttrable {}
