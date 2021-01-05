//
//  CaptureAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation
import JavaScriptKit

public protocol CaptureAttrable {
    @discardableResult
    func capture(_ value: CaptureType) -> Self
    @discardableResult
    func capture(_ value: State<CaptureType>) -> Self
    @discardableResult
    func capture<V>(_ expressable: ExpressableState<V, CaptureType>) -> Self
}

protocol _CaptureAttrable: _AnyElement, CaptureAttrable {}

extension CaptureAttrable {
    /// Specifies the horizontal alignment of the element.
    ///
    /// Applicable to <applet>, <caption>, <col>, <colgroup>, <hr>,
    /// <iframe>, <img>, <table>, <tbody>, <td>, <tfoot> , <th>, <thead>, <tr>
    ///
    /// [More info →](https://www.w3resource.com/html/attributes/html-align-attribute.php)
    @discardableResult
    public func capture(_ value: CaptureType) -> Self {
        guard let s = self as? _CaptureAttrable else { return self }
        s.domElement.capture = value.value.jsValue()
        return self
    }
    
    /// Specifies the horizontal alignment of the element.
    ///
    /// Applicable to <applet>, <caption>, <col>, <colgroup>, <hr>,
    /// <iframe>, <img>, <table>, <tbody>, <td>, <tfoot> , <th>, <thead>, <tr>
    ///
    /// [More info →](https://www.w3resource.com/html/attributes/html-align-attribute.php)
    @discardableResult
    public func capture(_ value: State<CaptureType>) -> Self {
        value.listen { self.capture($0) }
        return self
    }
    
    /// The definition of 'media capture' in that specification.spec, specifies a new file can be captured.
    ///
    /// Applicable to <input>
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/capture)
    @discardableResult
    public func capture<V>(_ expressable: ExpressableState<V, CaptureType>) -> Self {
        capture(expressable.unwrap())
    }
}

extension InputFile: _CaptureAttrable {}
