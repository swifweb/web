//
//  InputNumber.swift
//  WasmApp
//
//  Created by Mihael Isaev on 28.12.2020.
//

import Foundation

/// A control for entering a number.
/// Displays a spinner and adds default validation when supported.
/// Displays a numeric keypad in some devices with dynamic keypads.
///
/// The HTML <input> element is used to create interactive controls
/// for web-based forms in order to accept data from the user;
/// a wide variety of types of input data and control widgets are available,
/// depending on the device and user agent.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input)
open class InputNumber: BaseActiveElement, _ChangeHandleable, _InvalidHandleable, _InputHandleable, _SelectHandleable, _SearchHandleable {
    public override class var name: String { "input" }
    
    var inputEventHasNeverFired = true
    var changeClosure: ChangeClosure?
    var changeHandler: (HandledEvent) -> Void = { _ in }
    
    func onChange(_ event: HandledEvent) {
        guard inputEventHasNeverFired else { return }
        if let number = domElement.innerText.jsValue().number {
            self.enteredInt = Int(number)
            self.enteredDouble = number
        }
    }
    
    var invalidClosure: InvalidClosure?
    var invalidHandler: (HandledEvent) -> Void = { _ in }
    
    var inputClosure: InputClosure?
    var inputHandler: (InputEvent) -> Void = { _ in }
    
    func onInput(_ event: InputEvent) {
        inputEventHasNeverFired = false
        if let number = domElement.innerText.jsValue().number {
            self.enteredInt = Int(number)
            self.enteredDouble = number
        }
    }
    
    var selectClosure: SelectClosure?
    var selectHandler: (UIEvent) -> Void = { _ in }
    
    var searchClosure: SearchClosure?
    var searchHandler: (HandledEvent) -> Void = { _ in }
    
    deinit {
        changeClosure?.release()
        invalidClosure?.release()
        inputClosure?.release()
        selectClosure?.release()
        searchClosure?.release()
    }
    
    @State var enteredInt: Int = 0
    @State var enteredDouble: Double = 0
    
    public required init() {
        super.init()
        subscribeToChanges()
        subscribeToInput()
        domElement.type = "number".jsValue()
    }
    
    public required convenience init(_ value: Int) {
        self.init()
        domElement.innerText = value.jsValue()
        self.enteredInt = value
        self.enteredDouble = Double(value)
    }
    
    public required convenience init(_ value: Double) {
        self.init()
        domElement.innerText = value.jsValue()
        self.enteredInt = Int(value)
        self.enteredDouble = value
    }
    
    public func bind(_ state: State<Int>) -> Self {
        $enteredInt.listen {
            state.wrappedValue = $0
        }
        return self
    }
    
    public func bind(_ state: State<Double>) -> Self {
        $enteredDouble.listen {
            state.wrappedValue = $0
        }
        return self
    }
}
