//
//  ContextMenuAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation

public protocol ContextMenuAttrable: DOMElement {
    @discardableResult
    func contextMenu(_ value: String) -> Self
    @discardableResult
    func contextMenu(_ value: Menu) -> Self
    @discardableResult
    func contextMenu<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension ContextMenuAttrable {
    /// Defines the ID of a `<menu>` element which will serve as the element's context menu.
    ///
    /// [More info →](https://www.w3schools.com/tags/att_contextmenu.asp)
    @discardableResult
    public func contextMenu(_ value: String) -> Self {
        setAttribute("contextmenu", value)
        return self
    }
    
    /// Defines the ID of a `<menu>` element which will serve as the element's context menu.
    ///
    /// [More info →](https://www.w3schools.com/tags/att_contextmenu.asp)
    @discardableResult
    public func contextMenu(_ value: Menu) -> Self {
        contextMenu(value.properties._id)
    }
    
    /// Defines the ID of a `<menu>` element which will serve as the element's context menu.
    ///
    /// [More info →](https://www.w3schools.com/tags/att_contextmenu.asp)
    @discardableResult
    public func contextMenu<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        contextMenu(value.stateValue.wrappedValue)
        value.stateValue.listen { self.contextMenu($0) }
        return self
    }
}

extension BaseElement: ContextMenuAttrable {}
