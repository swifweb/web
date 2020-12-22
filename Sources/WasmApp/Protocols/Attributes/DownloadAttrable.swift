//
//  DownloadAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol DownloadAttrable {
    @discardableResult
    func download(_ value: Bool) -> Self
    @discardableResult
    func download(_ value: State<Bool>) -> Self
    @discardableResult
    func download<V>(_ expressable: ExpressableState<V, Bool>) -> Self
}

protocol _DownloadAttrable: _AnyElement, DownloadAttrable {}

extension DownloadAttrable {
    /// Indicates that the hyperlink is to be used for downloading a resource.
    ///
    /// Applicable to <a>, <area>
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
    /// Applicable to <a>, <area>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_a_download.asp)
    @discardableResult
    public func download(_ value: State<Bool>) -> Self {
        value.listen { self.download($0) }
        return self
    }
    
    /// Indicates that the hyperlink is to be used for downloading a resource.
    ///
    /// Applicable to <a>, <area>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_a_download.asp)
    @discardableResult
    public func download<V>(_ expressable: ExpressableState<V, Bool>) -> Self {
        download(expressable.unwrap())
    }
}

extension A: _DownloadAttrable {}
extension Area: _DownloadAttrable {}
