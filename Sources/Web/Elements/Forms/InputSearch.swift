//
//  InputSearch.swift
//  Web
//
//  Created by Mihael Isaev on 28.12.2020.
//

import Foundation

/// A single-line text field for entering search strings.
/// Line-breaks are automatically removed from the input value.
/// May include a delete icon in supporting browsers
/// that can be used to clear the field. Displays a search icon
/// instead of enter key on some devices with dynamic keypads.
///
/// The HTML `<input>` element is used to create interactive controls
/// for web-based forms in order to accept data from the user;
/// a wide variety of types of input data and control widgets are available,
/// depending on the device and user agent.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input)
open class InputSearch: BaseActiveElement, _StringInitializable, _ChangeHandleable, _InvalidHandleable, _InputHandleable, _SelectHandleable, _SearchHandleable {
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
    
    var searchClosure: SearchClosure?
    var searchHandler: (HandledEvent) -> Void = { _ in }
    
    deinit {
        changeClosure?.release()
        invalidClosure?.release()
        inputClosure?.release()
        selectClosure?.release()
        searchClosure?.release()
    }
    
    public required init() {
        super.init()
        subscribeToChanges()
        subscribeToInput()
        domElement.type = "search".jsValue()
        domElement.value = text.jsValue()
    }
    
    public required convenience init(_ value: String) {
        self.init()
        domElement.value = value.jsValue()
        self.text = value
        _text.listen {
            self.domElement.value = $0.jsValue()
        }
    }
    
    public required convenience init(_ value: State<String>) {
        self.init()
        domElement.value = value.wrappedValue.jsValue()
        _text.wrappedValue = value.wrappedValue
        _text.merge(with: value, leftChanged: { new in
            self.domElement.value = new.jsValue()
        }, rightChanged: { new in
            self.domElement.value = new.jsValue()
        })
    }
}

extension InputSearch: _Selectable {}
extension InputSearch: _RangeTextable {}
extension InputSearch: _SelectionRangeable {}