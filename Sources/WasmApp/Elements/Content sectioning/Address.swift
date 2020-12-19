//
//  Address.swift
//  WasmApp
//
//  Created by Mihael Isaev on 16.12.2020.
//

import Foundation

/// The HTML <address> element indicates that the enclosed HTML
/// provides contact information for a person or people, or for an organization.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/address)
open class Address: BaseActiveElement, _ScrollHandleable {
    var scrollClosure: ScrollClosure?
    var scrollHandler: (UIEvent) -> Void = { _ in }
    
    deinit {
        scrollClosure?.release()
    }
}
