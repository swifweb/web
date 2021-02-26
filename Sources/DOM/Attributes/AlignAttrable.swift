//
//  AlignAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation

public protocol AlignAttrable: DOMElement {
    @discardableResult
    func align(_ value: AlignType) -> Self
    @discardableResult
    func align<S>(_ value: S) -> Self where S: StateConvertible, S.Value == AlignType
}

extension AlignAttrable {
    /// Specifies the horizontal alignment of the element.
    ///
    /// Applicable to `<applet>`, `<caption>`, `<col>`, `<colgroup>`, `<hr>`,
    /// `<iframe>`, `<img>`, `<table>`, `<tbody>`, `<td>`, `<tfoot>` , `<th>`, `<thead>`, `<tr>`
    ///
    /// [More info →](https://www.w3resource.com/html/attributes/html-align-attribute.php)
    @discardableResult
    public func align(_ value: AlignType) -> Self {
        setAttribute("align", value.value)
        return self
    }
    
    /// Specifies the horizontal alignment of the element.
    ///
    /// Applicable to `<applet>`, `<caption>`, `<col>`, `<colgroup>`, `<hr>`,
    /// `<iframe>`, `<img>`, `<table>`, `<tbody>`, `<td>`, `<tfoot>` , `<th>`, `<thead>`, `<tr>`
    ///
    /// [More info →](https://www.w3resource.com/html/attributes/html-align-attribute.php)
    @discardableResult
    public func align<S>(_ value: S) -> Self where S: StateConvertible, S.Value == AlignType {
        align(value.stateValue.wrappedValue)
        value.stateValue.listen { self.align($0) }
        return self
    }
}

extension Caption: AlignAttrable {}
extension Col: AlignAttrable {}
extension ColGroup: AlignAttrable {}
extension Div: AlignAttrable {}
extension Hr: AlignAttrable {}
extension IFrame: AlignAttrable {}
extension Img: AlignAttrable {}
extension Table: AlignAttrable {}
extension TBody: AlignAttrable {}
extension Td: AlignAttrable {}
extension TFoot: AlignAttrable {}
extension Th: AlignAttrable {}
extension THead: AlignAttrable {}
extension Tr: AlignAttrable {}
