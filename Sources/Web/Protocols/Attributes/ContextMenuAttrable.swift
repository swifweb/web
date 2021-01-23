//
//  ContextMenuAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation
import JavaScriptKit

public protocol ContextMenuAttrable {
    @discardableResult
    func contextMenu(_ value: String) -> Self
    @discardableResult
    func contextMenu(_ value: Menu) -> Self
    @discardableResult
    func contextMenu<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

protocol _ContextMenuAttrable: _AnyElement, ContextMenuAttrable {}

extension ContextMenuAttrable {
    /// Defines the ID of a `<menu>` element which will serve as the element's context menu.
    ///
    /// [More info →](https://www.w3schools.com/tags/att_contextmenu.asp)
    @discardableResult
    public func contextMenu(_ value: String) -> Self {
        guard let s = self as? _ContextMenuAttrable else { return self }
        s.domElement.contextmenu = value.jsValue()
        return self
    }
    
    /// Defines the ID of a `<menu>` element which will serve as the element's context menu.
    ///
    /// [More info →](https://www.w3schools.com/tags/att_contextmenu.asp)
    @discardableResult
    public func contextMenu(_ value: Menu) -> Self {
        contextMenu(value.uid)
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

extension BaseElement: _ContextMenuAttrable {}