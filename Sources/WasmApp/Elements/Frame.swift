//
//  Frame.swift
//  WasmApp
//
//  Created by Mihael Isaev on 16.12.2020.
//

import Foundation

open class Frame: BaseActiveElement, _LoadHandleable {
    var loadClosure: LoadClosure?
    var loadHandler: (UIEvent) -> Void = { _ in }
    
    deinit {
        loadClosure?.release()
    }
}
