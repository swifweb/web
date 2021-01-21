//
//  Style.swift
//  WasmApp
//
//  Created by Mihael Isaev on 16.12.2020.
//

import Foundation

/// The HTML `<style>` element contains style information for a document, or part of a document.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/style)
open class Style: BaseActiveElement, _LoadHandleable {
    var loadClosure: LoadClosure?
    var loadHandler: (UIEvent) -> Void = { _ in }
    
    deinit {
        loadClosure?.release()
    }
}
