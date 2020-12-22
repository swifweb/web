//
//  AlignAttrable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation
import JavaScriptKit

public protocol AlignAttrable {
    @discardableResult
    func align(_ value: AlignType) -> Self
    @discardableResult
    func align(_ value: State<AlignType>) -> Self
    @discardableResult
    func align<V>(_ expressable: ExpressableState<V, AlignType>) -> Self
}

protocol _AlignAttrable: _AnyElement, AlignAttrable {}

extension AlignAttrable {
    /// Specifies the horizontal alignment of the element.
    ///
    /// Applicable to <applet>, <caption>, <col>, <colgroup>, <hr>,
    /// <iframe>, <img>, <table>, <tbody>, <td>, <tfoot> , <th>, <thead>, <tr>
    ///
    /// [More info →](https://www.w3resource.com/html/attributes/html-align-attribute.php)
    @discardableResult
    public func align(_ value: AlignType) -> Self {
        guard let s = self as? _AlignAttrable else { return self }
        s.domElement.align = value.value.jsValue()
        return self
    }
    
    /// Specifies the horizontal alignment of the element.
    ///
    /// Applicable to <applet>, <caption>, <col>, <colgroup>, <hr>,
    /// <iframe>, <img>, <table>, <tbody>, <td>, <tfoot> , <th>, <thead>, <tr>
    ///
    /// [More info →](https://www.w3resource.com/html/attributes/html-align-attribute.php)
    @discardableResult
    public func align(_ value: State<AlignType>) -> Self {
        value.listen { self.align($0) }
        return self
    }
    
    /// Specifies the horizontal alignment of the element.
    ///
    /// Applicable to <applet>, <caption>, <col>, <colgroup>, <div>, <hr>,
    /// <iframe>, <img>, <table>, <tbody>, <td>, <tfoot> , <th>, <thead>, <tr>
    ///
    /// [More info →](https://www.w3resource.com/html/attributes/html-align-attribute.php)
    @discardableResult
    public func align<V>(_ expressable: ExpressableState<V, AlignType>) -> Self {
        align(expressable.unwrap())
    }
}

extension Caption: _AlignAttrable {}
extension Col: _AlignAttrable {}
extension ColGroup: _AlignAttrable {}
extension Div: _AlignAttrable {}
extension Hr: _AlignAttrable {}
extension IFrame: _AlignAttrable {}
extension Img: _AlignAttrable {}
extension Table: _AlignAttrable {}
extension TBody: _AlignAttrable {}
extension Td: _AlignAttrable {}
extension TFoot: _AlignAttrable {}
extension Th: _AlignAttrable {}
extension THead: _AlignAttrable {}
extension Tr: _AlignAttrable {}
