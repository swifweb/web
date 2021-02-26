//
//  ControlsAttrable.swift
//  DOM
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation

public protocol ControlsAttrable: DOMElement {
    @discardableResult
    func controls(_ value: Bool) -> Self
    @discardableResult
    func controls<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

extension ControlsAttrable {
    /// Indicates whether the browser should show playback controls to the user.
    ///
    /// Applicable to `<audio>`, `<video>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_controls.asp)
    @discardableResult
    public func controls(_ value: Bool) -> Self {
        setAttribute("controls", value, .short)
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

extension Audio: ControlsAttrable {}
extension Video: ControlsAttrable {}
