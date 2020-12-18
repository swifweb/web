//
//  Details.swift
//  WasmApp
//
//  Created by Mihael Isaev on 16.12.2020.
//

import Foundation

open class Details: BaseActiveElement, _ToggleHandleable {
    var toggleClosure: ToggleClosure?
    var toggleHandler: (HandledEvent) -> Void = { _ in }
    
    deinit {
        toggleClosure?.release()
    }
}
