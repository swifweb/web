//
//  Menu.swift
//  WasmApp
//
//  Created by Mihael Isaev on 16.12.2020.
//

import Foundation

/// The HTML <menu> element represents a group of commands that a user can perform or activate.
/// This includes both list menus, which might appear across the top of a screen,
/// as well as context menus, such as those that might appear underneath a button after it has been clicked.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/menu)
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
