//
//  InputCheckbox.swift
//  WasmApp
//
//  Created by Mihael Isaev on 25.12.2020.
//

import Foundation

/// A check box allowing single values to be selected/deselected.
///
/// The HTML `<input>` element is used to create interactive controls
/// for web-based forms in order to accept data from the user;
/// a wide variety of types of input data and control widgets are available,
/// depending on the device and user agent.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/checkbox)
open class InputCheckbox: BaseActiveElement, _ChangeHandleable, _InvalidHandleable {
    public override class var name: String { "input" }
    
    @State public var checked = false
    @State public var indeterminate = false
    
    var changeClosure: ChangeClosure?
    var changeHandler: (HandledEvent) -> Void = { _ in }
    
    func onChange(_ event: HandledEvent) {
        checked = domElement.checked.boolean ?? false
        indeterminate = domElement.indeterminate.boolean ?? false
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
        domElement.type = "checkbox".jsValue()
    }
    
    public required convenience init(_ checked: Bool, indeterminate: Bool = false) {
        self.init()
        domElement.checked = checked.jsValue()
        domElement.indeterminate = indeterminate.jsValue()
        self.checked = checked
        self.indeterminate = indeterminate
        _checked.listen {
            self.domElement.checked = $0.jsValue()
        }
        _indeterminate.listen {
            self.domElement.indeterminate = $0.jsValue()
        }
    }
    
    public required convenience init(_ checked: State<Bool>, indeterminate: State<Bool>? = nil) {
        self.init()
        domElement.checked = checked.wrappedValue.jsValue()
        _checked.wrappedValue = checked.wrappedValue
        _checked.merge(with: checked, leftChanged: { new in
            self.domElement.checked = new.jsValue()
        }, rightChanged: { new in
            self.domElement.checked = new.jsValue()
        })
        if let indeterminate = indeterminate {
            domElement.indeterminate = indeterminate.wrappedValue.jsValue()
            _indeterminate.wrappedValue = indeterminate.wrappedValue
            _indeterminate.merge(with: indeterminate, leftChanged: { new in
                self.domElement.indeterminate = new.jsValue()
            }, rightChanged: { new in
                self.domElement.indeterminate = new.jsValue()
            })
        }
    }
    
    /// Convenience method to toggle checkbox
    public func toggle() {
        domElement.indeterminate = false.jsValue()
        domElement.checked = (!checked).jsValue()
        indeterminate = false
        checked = !checked
    }
}

extension InputCheckbox: _Selectable {}
