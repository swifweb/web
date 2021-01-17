//
//  InputReset.swift
//  WasmApp
//
//  Created by Mihael Isaev on 25.12.2020.
//

import Foundation

/// A button that resets the contents of the form to default values.
/// Not recommended.
///
/// The HTML `<input>` element is used to create interactive controls
/// for web-based forms in order to accept data from the user;
/// a wide variety of types of input data and control widgets are available,
/// depending on the device and user agent.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input)
open class InputReset: BaseActiveElement {
    public override class var name: String { "input" }
    
    public required init() {
        super.init()
        domElement.type = "reset".jsValue()
    }
}
