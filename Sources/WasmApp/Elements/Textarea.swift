//
//  Textarea.swift
//  WasmApp
//
//  Created by Mihael Isaev on 16.12.2020.
//

import Foundation

open class Textarea: BaseActiveElement, _ChangeHandleable, _InputHandleable, _ScrollHandleable, _SelectHandleable {
    var changeClosure: ChangeClosure?
    var changeHandler: (HandledEvent) -> Void = { _ in }
    
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
}
