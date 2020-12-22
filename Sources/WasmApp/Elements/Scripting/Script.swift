//
//  Script.swift
//  WasmApp
//
//  Created by Mihael Isaev on 16.12.2020.
//

import Foundation

/// The HTML <script> element is used to embed executable code or data;
/// this is typically used to embed or refer to JavaScript code.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/script)
open class Script: BaseElement, _ErrorHandleable, _LoadHandleable {
    var errorClosure: ErrorClosure?
    var errorHandler: (ProgressEvent) -> Void = { _ in }
    
    var loadClosure: LoadClosure?
    var loadHandler: (UIEvent) -> Void = { _ in }
    
    deinit {
        errorClosure?.release()
        loadClosure?.release()
    }
    
    func addedToDocument() {}
}
