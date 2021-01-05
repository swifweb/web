//
//  InputHidden.swift
//  WasmApp
//
//  Created by Mihael Isaev on 25.12.2020.
//

import Foundation

/// A control that is not displayed but whose value is submitted to the server.
/// There is an example in the next column, but it's hidden!
///
/// The HTML <input> element is used to create interactive controls
/// for web-based forms in order to accept data from the user;
/// a wide variety of types of input data and control widgets are available,
/// depending on the device and user agent.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input)
open class InputHidden: BaseActiveElement {
    public override class var name: String { "input" }
    
    public required init() {
        super.init()
        domElement.type = "hidden".jsValue()
    }
}
