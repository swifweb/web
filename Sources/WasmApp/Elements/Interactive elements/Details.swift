//
//  Details.swift
//  WasmApp
//
//  Created by Mihael Isaev on 16.12.2020.
//

import Foundation

/// The HTML Details Element (<details>) creates a disclosure widget
/// in which information is visible only when the widget is toggled into an "open" state.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/details)
open class Details: BaseActiveElement, _ToggleHandleable {
    var toggleClosure: ToggleClosure?
    var toggleHandler: (HandledEvent) -> Void = { _ in }
    
    deinit {
        toggleClosure?.release()
    }
}
