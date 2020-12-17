//
//  Div.swift
//  WasmApp
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation

open class Div: BaseActiveElement, _ScrollHandleable {
    var scrollClosure: ScrollClosure?
    var scrollHandler: (UIEvent) -> Void = { _ in }
    
    deinit {
        scrollClosure?.release()
    }
}
