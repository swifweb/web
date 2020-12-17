//
//  Input.swift
//  WasmApp
//
//  Created by Mihael Isaev on 16.12.2020.
//

import Foundation

open class Input: BaseActiveElement, _ChangeHandleable, _ErrorHandleable, _InvalidHandleable, _InputHandleable, _LoadHandleable, _SelectHandleable, _SearchHandleable {
    var changeClosure: ChangeClosure?
    var changeHandler: (HandledEvent) -> Void = { _ in }
    
    var errorClosure: ErrorClosure?
    var errorHandler: (ProgressEvent) -> Void = { _ in }
    
    var invalidClosure: InvalidClosure?
    var invalidHandler: (HandledEvent) -> Void = { _ in }
    
    var inputClosure: InputClosure?
    var inputHandler: (InputEvent) -> Void = { _ in }
    
    var loadClosure: LoadClosure?
    var loadHandler: (UIEvent) -> Void = { _ in }
    
    var selectClosure: SelectClosure?
    var selectHandler: (UIEvent) -> Void = { _ in }
    
    var searchClosure: SearchClosure?
    var searchHandler: (HandledEvent) -> Void = { _ in }
    
    deinit {
        changeClosure?.release()
        errorClosure?.release()
        invalidClosure?.release()
        inputClosure?.release()
        loadClosure?.release()
        selectClosure?.release()
        searchClosure?.release()
    }
}
