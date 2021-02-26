//
//  SrcAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol SrcAttrable: DOMElement {
    @discardableResult
    func src<U: URLConformable>(_ value: U) -> Self
    @discardableResult
    func src<S>(_ value: S) -> Self where S: StateConvertible, S.Value: URLConformable
}

extension SrcAttrable {
    /// The URL of the embeddable content.
    ///
    /// Applicable to `<audio>`, `<embed>`, `<iframe>`,
    /// `<img>`, `<input>`, `<script>`, `<source>`, `<track>`, `<video>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_src.asp)
    @discardableResult
    public func src<U: URLConformable>(_ value: U) -> Self {
        setAttribute("src", value.stringValue)
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

extension Audio: SrcAttrable {}
extension Embed: SrcAttrable {}
extension IFrame: SrcAttrable {}
extension Img: SrcAttrable {}
extension InputImage: SrcAttrable {}
extension Script: SrcAttrable {}
extension Source: SrcAttrable {}
extension Track: SrcAttrable {}
extension Video: SrcAttrable {}
