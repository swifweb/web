//
//  InputEmail.swift
//  WasmApp
//
//  Created by Mihael Isaev on 28.12.2020.
//

import Foundation

/// A field for editing an email address.
/// Looks like a text input, but has validation parameters and relevant keyboard in supporting browsers and devices with dynamic keyboards.
///
/// The HTML <input> element is used to create interactive controls
/// for web-based forms in order to accept data from the user;
/// a wide variety of types of input data and control widgets are available,
/// depending on the device and user agent.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input)
open class InputEmail: BaseActiveElement, _StringInitializable, _ChangeHandleable, _InvalidHandleable, _InputHandleable, _SelectHandleable, _SearchHandleable {
    public override class var name: String { "input" }
    
    var changeClosure: ChangeClosure?
    var changeHandler: (HandledEvent) -> Void = { _ in }
    
    func onChange(_ event: HandledEvent) {
        if let string = domElement.innerText.jsValue().string {
            self.enteredText = string
        }
    }
    
    var invalidClosure: InvalidClosure?
    var invalidHandler: (HandledEvent) -> Void = { _ in }
    
    var inputClosure: InputClosure?
    var inputHandler: (InputEvent) -> Void = { _ in }
    
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
    
    @State var enteredText = ""
    
    public required init() {
        super.init()
        subscribeToChanges()
        domElement.type = "email".jsValue()
    }
    
    public required convenience init(_ value: String) {
        self.init()
        self.value = value
        self.enteredText = value
    }
    
    public func bind(_ state: State<String>) -> Self {
        $enteredText.listen {
            state.wrappedValue = $0
        }
        return self
    }
}
