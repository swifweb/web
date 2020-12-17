//
//  THead.swift
//  WasmApp
//
//  Created by Mihael Isaev on 16.12.2020.
//

import Foundation

open class THead: BaseActiveElement, _ScrollHandleable {
    var scrollClosure: ScrollClosure?
    var scrollHandler: (UIEvent) -> Void = { _ in }
    
    deinit {
        scrollClosure?.release()
    }
}
