//
//  Textarea.swift
//  Web
//
//  Created by Mihael Isaev on 16.12.2020.
//

import Foundation

/// The HTML `<textarea>` element represents a multi-line plain-text editing control,
/// useful when you want to allow users to enter a sizeable amount of free-form text,
/// for example a comment on a review or feedback form.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/textarea)
open class TextArea: BaseActiveElement, _ChangeHandleable, _InputHandleable, _ScrollHandleable, _SelectHandleable, _StringInitializable {
    @State public var text: String = ""
    
    var inputEventHasNeverFired = true
    var changeClosure: ChangeClosure?
    var changeHandler: (HandledEvent) -> Void = { _ in }
    
    /// Convenience getter
    var _value: String? {
        #if arch(wasm32)
        return domElement.value.string
        #else
        return nil
        #endif
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
    
    var scrollClosure: ScrollClosure?
    var scrollHandler: (UIEvent) -> Void = { _ in }
    
    var selectClosure: SelectClosure?
    var selectHandler: (UIEvent) -> Void = { _ in }
    
    deinit {
        changeClosure?.release()
        inputClosure?.release()
        scrollClosure?.release()
        selectClosure?.release()
    }
    
    public required init() {
        super.init()
        subscribeToChanges()
        subscribeToInput()
        setAttribute("type", "text")
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
}
