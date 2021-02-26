//
//  Selectable.swift
//  DOM
//
//  Created by Mihael Isaev on 16.01.2021.
//

public protocol Selectable: DOMElement {}

extension Selectable {
    /// The HTMLInputElement.select() method selects all the text
    /// in a `<textarea>` element or in an `<input>` element that includes a text field.
    public func select() {
        callFunction("select")
    }
}
