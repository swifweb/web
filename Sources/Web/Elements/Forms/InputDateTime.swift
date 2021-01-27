//
//  InputDateTime.swift
//  Web
//
//  Created by Mihael Isaev on 25.12.2020.
//

import Foundation

/// A control for entering a date and time, with no time zone.
/// Opens a date picker or numeric wheels for date- and time-components when active in supporting browsers.
///
/// The HTML `<input>` element is used to create interactive controls
/// for web-based forms in order to accept data from the user;
/// a wide variety of types of input data and control widgets are available,
/// depending on the device and user agent.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input)
open class InputDateTime: BaseActiveElement, _StringInitializable, _ChangeHandleable, _InvalidHandleable, _InputHandleable, _SelectHandleable {
    public override class var name: String { "input" }
    
    @State public var text: String = ""
    
    var inputEventHasNeverFired = true
    var changeClosure: ChangeClosure?
    var changeHandler: (HandledEvent) -> Void = { _ in }
    
    /// Convenience getter
    var _value: String? {
        domElement.value.string
    }
    
    func _updateStateWithValue() {
        guard let value = _value else { return }
        self.text = value
    }
    
    func onChange(_ event: HandledEvent) {
        guard inputEventHasNeverFired else { return }
        _updateStateWithValue()
    }
    
    var inputClosure: InputClosure?
    var inputHandler: (InputEvent) -> Void = { _ in }
    
    func onInput(_ event: InputEvent) {
        inputEventHasNeverFired = false
        _updateStateWithValue()
    }
    
    var invalidClosure: InvalidClosure?
    var invalidHandler: (HandledEvent) -> Void = { _ in }
    
    var selectClosure: SelectClosure?
    var selectHandler: (UIEvent) -> Void = { _ in }
    
    deinit {
        changeClosure?.release()
        invalidClosure?.release()
        inputClosure?.release()
        selectClosure?.release()
    }
    
    public required init() {
        super.init()
        subscribeToChanges()
        subscribeToInput()
        setAttribute("type", "datetime-local")
        setAttribute("value", text)
    }
    
    public required convenience init(_ value: String) {
        self.init()
        setAttribute("value", value)
        self.text = value
        _text.listen { [weak self] in
            self?.setAttribute("value", $0)
        }
    }
    
    public required convenience init(_ value: State<String>) {
        self.init()
        setAttribute("value", value.wrappedValue)
        _text.wrappedValue = value.wrappedValue
        _text.merge(with: value, leftChanged: { [weak self] in
            self?.setAttribute("value", $0)
        }, rightChanged: { [weak self] in
            self?.setAttribute("value", $0)
        })
    }
    
    /// The HTMLInputElement.stepUp() method increments the value
    /// of a numeric type of  `<input>` element by the value of the step attribute,
    /// or the default step value if the step attribute is not explicitly set.
    /// The method, when invoked, increments the value by (step * n),
    /// where n defaults to 1 if not specified, and step defaults
    /// to the default value for step if not specified.
    public func stepUp(_ multiplier: Int = 1) {
        callFunction("stepUp", args: multiplier)
    }
    
    /// This method decrements the value of a numeric type of `<input>` element
    /// by the value of the step attribute or up to n multiples of the step attribute
    /// if a number is passed as the parameter.  The method, when invoked,
    /// decrements the value by (step * n), where n defaults to 1 if not specified,
    /// and step defaults to the default value for step if not specified.
    public func stepDown(_ multiplier: Int = 1) {
        callFunction("stepUp", args: multiplier)
    }
}

extension InputDateTime: _Selectable {}
