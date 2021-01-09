//
//  InputRange.swift
//  WasmApp
//
//  Created by Mihael Isaev on 28.12.2020.
//

import Foundation

/// A control for entering a number whose exact value is not important.
/// Displays as a range widget defaulting to the middle value.
/// Used in conjunction min and max to define the range of acceptable values.
///
/// The HTML <input> element is used to create interactive controls
/// for web-based forms in order to accept data from the user;
/// a wide variety of types of input data and control widgets are available,
/// depending on the device and user agent.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input)
open class InputRange: BaseActiveElement, _ChangeHandleable, _InputHandleable, _InvalidHandleable {
    public override class var name: String { "input" }
    
    var inputEventHasNeverFired = true
    var changeClosure: ChangeClosure?
    var changeHandler: (HandledEvent) -> Void = { _ in }
    
    func onChange(_ event: HandledEvent) {
        guard inputEventHasNeverFired else { return }
        guard let value = self.domElement.valueAsNumber.number else { return }
        self.currentValue = value
    }
    
    var inputClosure: InputClosure?
    var inputHandler: (InputEvent) -> Void = { _ in }
    
    func onInput(_ event: InputEvent) {
        inputEventHasNeverFired = false
        guard let value = self.domElement.valueAsNumber.number else { return }
        self.currentValue = value
    }
    
    var invalidClosure: InvalidClosure?
    var invalidHandler: (HandledEvent) -> Void = { _ in }
    
    deinit {
        changeClosure?.release()
        invalidClosure?.release()
    }
    
    @State var currentValue: Double = 0
    
    public required init() {
        super.init()
        subscribeToChanges()
        subscribeToInput()
        domElement.type = "range".jsValue()
    }
    
    public required convenience init(_ value: Double) {
        self.init()
        domElement.innerText = value.jsValue()
        self.currentValue = value
    }
    
    public func bind(_ state: State<Double>) -> Self {
        $currentValue.listen {
            state.wrappedValue = $0
        }
        if let value = self.domElement.valueAsNumber.number {
            self.currentValue = value
        }
        return self
    }
}
