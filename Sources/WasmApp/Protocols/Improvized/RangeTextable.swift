//
//  RangeTextable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 16.01.2021.
//

public protocol RangeTextable {}

protocol _RangeTextable: _AnyElement, RangeTextable {}

extension RangeTextable {
    /// Replaces a range of text in an `<input>` or `<textarea>` element with a new string.
    /// - Parameters:
    ///   - replacement: The string to insert.
    ///   - start: The 0-based index of the first character to replace.
    ///   Defaults to the current selectionStart value (the start of the user's current selection).
    ///   - end: The 0-based index of the character after the last character to replace.
    ///   Defaults to the current selectionEnd value (the end of the user's current selection).
    ///   - selectMode: Defining how the selection should be set after the text has been replaced.
    public func setRangeText(_ replacement: String, start: Int? = nil, end: Int? = nil, selectMode: RangeTextSelectMode? = nil) {
        guard let s = self as? _RangeTextable else { return }
        s.domElement.setRangeText.function?.callAsFunction(
            this: s.domElement.object,
            replacement.jsValue(),
            start?.jsValue(),
            end?.jsValue(),
            selectMode?.rawValue.jsValue()
        )
    }
}
