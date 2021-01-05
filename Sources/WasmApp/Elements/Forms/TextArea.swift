//
//  Textarea.swift
//  WasmApp
//
//  Created by Mihael Isaev on 16.12.2020.
//

import Foundation

/// The HTML <textarea> element represents a multi-line plain-text editing control,
/// useful when you want to allow users to enter a sizeable amount of free-form text,
/// for example a comment on a review or feedback form.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/textarea)
open class TextArea: BaseActiveElement, _ChangeHandleable, _InputHandleable, _ScrollHandleable, _SelectHandleable, _StringInitializable {
    var changeClosure: ChangeClosure?
    var changeHandler: (HandledEvent) -> Void = { _ in }
    
    func onChange(_ event: HandledEvent) {
        enteredText = value
    }
    
    var inputClosure: InputClosure?
    var inputHandler: (InputEvent) -> Void = { _ in }
    
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
    
    @State var enteredText = ""
    
    public required init() {
        super.init()
        subscribeToChanges()
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
