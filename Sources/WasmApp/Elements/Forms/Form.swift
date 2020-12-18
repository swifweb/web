//
//  Form.swift
//  WasmApp
//
//  Created by Mihael Isaev on 16.12.2020.
//

import Foundation

open class Form: BaseActiveElement, _ResetHandleable, _ScrollHandleable, _SubmitHandleable {
    var resetClosure: ResetClosure?
    var resetHandler: (HandledEvent) -> Void = { _ in }
    
    var scrollClosure: ScrollClosure?
    var scrollHandler: (UIEvent) -> Void = { _ in }
    
    var submitClosure: SubmitClosure?
    var submitHandler: (HandledEvent) -> Void = { _ in }
    
    deinit {
        resetClosure?.release()
        scrollClosure?.release()
        submitClosure?.release()
    }
}
