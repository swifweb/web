//
//  InputRadio.swift
//  WasmApp
//
//  Created by Mihael Isaev on 25.12.2020.
//

import Foundation

/// A radio button, allowing a single value to be selected out of multiple choices with the same name value.
///
/// The HTML `<input>` element is used to create interactive controls
/// for web-based forms in order to accept data from the user;
/// a wide variety of types of input data and control widgets are available,
/// depending on the device and user agent.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input)
open class InputRadio: BaseActiveElement, _ChangeHandleable, _InvalidHandleable {
    public override class var name: String { "input" }
    
    @State public var checked = false
    
    var value: String {
        domElement.value.string ?? ""
    }
    
    var changeClosure: ChangeClosure?
    var changeHandler: (HandledEvent) -> Void = { _ in }
    
    func onChange(_ event: HandledEvent) {
        checked = domElement.checked.boolean ?? false
    }
    
    var invalidClosure: InvalidClosure?
    var invalidHandler: (HandledEvent) -> Void = { _ in }
    
    deinit {
        changeClosure?.release()
        invalidClosure?.release()
    }
    
    public required init() {
        super.init()
        subscribeToChanges()
        domElement.type = "radio".jsValue()
    }
    
    public required convenience init(_ checked: Bool) {
        self.init()
        domElement.checked = checked.jsValue()
        self.checked = checked
        _checked.listen {
            self.domElement.checked = $0.jsValue()
        }
    }
    
    public required convenience init(_ checked: State<Bool>) {
        self.init()
        domElement.checked = checked.wrappedValue.jsValue()
        _checked.wrappedValue = checked.wrappedValue
        _checked.merge(with: checked, leftChanged: { new in
            self.domElement.checked = new.jsValue()
        }, rightChanged: { new in
            self.domElement.checked = new.jsValue()
        })
    }
}

extension InputRadio: _Selectable {}
