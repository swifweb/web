//
//  SelectionRangeable.swift
//  Web
//
//  Created by Mihael Isaev on 16.01.2021.
//

public protocol SelectionRangeable {}

protocol _SelectionRangeable: _AnyElement, SelectionRangeable {}

extension SelectionRangeable {
    /// The HTMLInputElement.setSelectionRange() method sets the start and end positions
    /// of the current text selection in an `<input>` or `<textarea>` element.
    ///
    /// Optionally, in newer browser versions, you can specify the direction
    /// in which selection should be considered to have occurred.
    /// This lets you indicate, for example, that the selection was set
    /// by the user clicking and dragging from the end of the selected text toward the beginning.
    ///
    /// This method updates the HTMLInputElement.selectionStart,
    /// selectionEnd, and selectionDirection properties in one call.
    ///
    /// Note that accordingly to the WHATWG forms spec selectionStart, selectionEnd properties
    /// and setSelectionRange method apply only to inputs of types text, search, URL, tel and password.
    /// Chrome, starting from version 33, throws an exception while accessing
    /// those properties and method on the rest of input types.
    /// For example, on input of type number: "Failed to read the 'selectionStart' property
    /// from 'HTMLInputElement': The input element's type ('number') does not support selection".
    ///
    /// If you wish to select all text of an input element, you can use
    /// the HTMLInputElement.select() method instead.
    ///
    /// - Parameters:
    ///   - selectionStart: The 0-based index of the first selected character.
    ///   An index greater than the length of the element's value is treated as pointing to the end of the value.
    ///   - selectionEnd: The 0-based index of the character after the last selected character.
    ///   An index greater than the length of the element's value is treated as pointing to the end of the value.
    ///   - selectionDirection: Indicating the direction in which the selection is considered to have been performed.
    public func setSelectionRange(selectionStart: Int, selectionEnd: Int, selectionDirection: SelectionDirection? = nil) {
        guard let s = self as? _SelectionRangeable else { return }
        s.domElement.setSelectionRange.function?.callAsFunction(
            this: s.domElement.object,
            selectionStart.jsValue(),
            selectionEnd.jsValue(),
            selectionDirection?.rawValue.jsValue()
        )
    }
}
