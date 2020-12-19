//
//  Img.swift
//  WasmApp
//
//  Created by Mihael Isaev on 16.12.2020.
//

import Foundation

/// The HTML <img> element embeds an image into the document.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/img)
open class Img: BaseActiveElement, _ErrorHandleable, _LoadHandleable {
    var errorClosure: ErrorClosure?
    var errorHandler: (ProgressEvent) -> Void = { _ in }
    
    var loadClosure: LoadClosure?
    var loadHandler: (UIEvent) -> Void = { _ in }
    
    deinit {
        errorClosure?.release()
        loadClosure?.release()
    }
}
