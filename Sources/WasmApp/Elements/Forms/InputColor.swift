//
//  InputColor.swift
//  WasmApp
//
//  Created by Mihael Isaev on 25.12.2020.
//

import Foundation

/// A control for specifying a color;
/// opening a color picker when active in supporting browsers.
///
/// The HTML <input> element is used to create interactive controls
/// for web-based forms in order to accept data from the user;
/// a wide variety of types of input data and control widgets are available,
/// depending on the device and user agent.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input)
open class InputColor: BaseActiveElement, _ChangeHandleable, _InvalidHandleable, _InputHandleable {
    public override class var name: String { "input" }
    
    var inputEventHasNeverFired = true
    var changeClosure: ChangeClosure?
    var changeHandler: (HandledEvent) -> Void = { _ in }
    
    func onChange(_ event: HandledEvent) {
        guard inputEventHasNeverFired else { return }
        // TODO: update
    }
    
    var invalidClosure: InvalidClosure?
    var invalidHandler: (HandledEvent) -> Void = { _ in }
    
    var inputClosure: InputClosure?
    var inputHandler: (InputEvent) -> Void = { _ in }
    
    func onInput(_ event: InputEvent) {
        inputEventHasNeverFired = false
        // TODO: update
    }
    
    deinit {
        changeClosure?.release()
        invalidClosure?.release()
        invalidClosure?.release()
    }
    
    public required init() {
        super.init()
        subscribeToChanges()
        subscribeToInput()
        domElement.type = "color".jsValue()
    }
}
