//
//  Link.swift
//  WasmApp
//
//  Created by Mihael Isaev on 16.12.2020.
//

import Foundation

///
///
/// [Learn more ->](<#T##c: Character##Character#>)
open class Link: BaseActiveElement, _ErrorHandleable, _LoadHandleable {
    var errorClosure: ErrorClosure?
    var errorHandler: (ProgressEvent) -> Void = { _ in }
    
    var loadClosure: LoadClosure?
    var loadHandler: (UIEvent) -> Void = { _ in }
    
    deinit {
        errorClosure?.release()
        loadClosure?.release()
    }
}
