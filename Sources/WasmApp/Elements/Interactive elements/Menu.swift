//
//  Menu.swift
//  WasmApp
//
//  Created by Mihael Isaev on 16.12.2020.
//

import Foundation

///
///
/// [Learn more ->](<#T##c: Character##Character#>)
open class Menu: BaseActiveElement, _ScrollHandleable, _ShowHandleable {
    var scrollClosure: ScrollClosure?
    var scrollHandler: (UIEvent) -> Void = { _ in }
    
    var showClosure: ShowClosure?
    var showHandler: (HandledEvent) -> Void = { _ in }
    
    deinit {
        scrollClosure?.release()
        showClosure?.release()
    }
}
