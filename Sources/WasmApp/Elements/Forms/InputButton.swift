//
//  InputButton.swift
//  WasmApp
//
//  Created by Mihael Isaev on 25.12.2020.
//

import Foundation

/// A push button with no default behavior displaying the value of the value attribute, empty by default.
///
/// The HTML <input> element is used to create interactive controls
/// for web-based forms in order to accept data from the user;
/// a wide variety of types of input data and control widgets are available,
/// depending on the device and user agent.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input)
open class InputButton: BaseActiveElement {
    public override class var name: String { "input" }
    
    public required init() {
        super.init()
        domElement.type = "button".jsValue()
    }
}
