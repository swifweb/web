//
//  InputFile.swift
//  WasmApp
//
//  Created by Mihael Isaev on 25.12.2020.
//

import Foundation

/// A control that lets the user select a file.
/// Use the accept attribute to define the types of files that the control can select.
///
/// The HTML <input> element is used to create interactive controls
/// for web-based forms in order to accept data from the user;
/// a wide variety of types of input data and control widgets are available,
/// depending on the device and user agent.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input)
open class InputFile: BaseActiveElement, _ChangeHandleable, _InvalidHandleable, _SelectHandleable {
    public override class var name: String { "input" }
    
    var changeClosure: ChangeClosure?
    var changeHandler: (HandledEvent) -> Void = { _ in }
    
    func onChange(_ event: HandledEvent) {
        // TODO: update
    }
    
    var invalidClosure: InvalidClosure?
    var invalidHandler: (HandledEvent) -> Void = { _ in }
    
    var selectClosure: SelectClosure?
    var selectHandler: (UIEvent) -> Void = { _ in }
    
    deinit {
        changeClosure?.release()
        invalidClosure?.release()
        selectClosure?.release()
    }
    
    public required init() {
        super.init()
        subscribeToChanges()
        domElement.type = "file".jsValue()
    }
}
