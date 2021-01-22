//
//  DownloadAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol DownloadAttrable {
    @discardableResult
    func download(_ value: Bool) -> Self
    @discardableResult
    func download<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

protocol _DownloadAttrable: _AnyElement, DownloadAttrable {}

extension DownloadAttrable {
    /// Indicates that the hyperlink is to be used for downloading a resource.
    ///
    /// Applicable to `<a>`, `<area>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_a_download.asp)
    @discardableResult
    public func download(_ value: Bool) -> Self {
        guard let s = self as? _DownloadAttrable else { return self }
        s.domElement.download = value.jsValue()
        return self
    }
    
    /// Indicates that the hyperlink is to be used for downloading a resource.
    ///
    /// Applicable to `<a>`, `<area>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_a_download.asp)
    @discardableResult
    public func download<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        download(value.stateValue.wrappedValue)
        value.stateValue.listen { self.download($0) }
        return self
    }
}

extension A: _DownloadAttrable {}
extension Area: _DownloadAttrable {}
