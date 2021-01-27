//
//  Form.swift
//  Web
//
//  Created by Mihael Isaev on 16.12.2020.
//

import Foundation

public typealias WForm = Form

/// The HTML `<form>` element represents a document section containing interactive controls for submitting information.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/form)
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
    
    /// Resets the values of all elements in a form (same as clicking the Reset button).
    public func reset() {
        callFunction("reset")
    }
    
    /// Submits the form (same as clicking the Submit button).
    public func submit() {
        callFunction("submit")
    }
}
