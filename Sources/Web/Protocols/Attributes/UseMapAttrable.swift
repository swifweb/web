//
//  UseMapAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol UseMapAttrable {
    @discardableResult
    func useMap(_ value: String) -> Self
    @discardableResult
    func useMap<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

protocol _UseMapAttrable: _AnyElement, UseMapAttrable {}

extension UseMapAttrable {
    /// The usemap attribute specifies an image (or an object) as an image map (an image map is an image with clickable areas).
    ///
    /// The usemap attribute is associated with a `<map>` element's name or id attribute,
    /// and creates a relationship between the `<img>` and the `<map>`.
    ///
    /// Note: The usemap attribute cannot be used if the `<img>` element is a descendant of an `<a>` or `<button>` element.
    ///
    /// Applicable to `<img>`, `<input>`, `<object>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_usemap.asp)
    @discardableResult
    public func useMap(_ value: String) -> Self {
        guard let s = self as? _UseMapAttrable else { return self }
        s.domElement.usemap = value.jsValue()
        return self
    }
    
    /// The usemap attribute specifies an image (or an object) as an image map (an image map is an image with clickable areas).
    ///
    /// The usemap attribute is associated with a `<map>` element's name or id attribute,
    /// and creates a relationship between the `<img>` and the `<map>`.
    ///
    /// Note: The usemap attribute cannot be used if the `<img>` element is a descendant of an `<a>` or `<button>` element.
    ///
    /// Applicable to `<img>`, `<input>`, `<object>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_usemap.asp)
    @discardableResult
    public func useMap<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        useMap(value.stateValue.wrappedValue)
        value.stateValue.listen { self.useMap($0) }
        return self
    }
}

extension Img: _UseMapAttrable {}
extension InputImage: _UseMapAttrable {}
extension Object: _UseMapAttrable {}