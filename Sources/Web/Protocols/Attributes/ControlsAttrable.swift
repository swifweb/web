//
//  ControlsAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation
import JavaScriptKit

public protocol ControlsAttrable {
    @discardableResult
    func controls(_ value: Bool) -> Self
    @discardableResult
    func controls<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

protocol _ControlsAttrable: _AnyElement, ControlsAttrable {}

extension ControlsAttrable {
    /// Indicates whether the browser should show playback controls to the user.
    ///
    /// Applicable to `<audio>`, `<video>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_controls.asp)
    @discardableResult
    public func controls(_ value: Bool) -> Self {
        guard let s = self as? _ControlsAttrable else { return self }
        s.domElement.controls = value.jsValue()
        return self
    }
    
    /// Indicates whether the browser should show playback controls to the user.
    ///
    /// Applicable to `<audio>`, `<video>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_controls.asp)
    @discardableResult
    public func controls<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        controls(value.stateValue.wrappedValue)
        value.stateValue.listen { self.controls($0) }
        return self
    }
}

extension Audio: _ControlsAttrable {}
extension Video: _ControlsAttrable {}
