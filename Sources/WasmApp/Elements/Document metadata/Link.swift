//
//  Link.swift
//  WasmApp
//
//  Created by Mihael Isaev on 16.12.2020.
//

import Foundation

/// The HTML External Resource Link element `<link>`
/// specifies relationships between the current document and an external resource.
/// This element is most commonly used to link to stylesheets,
/// but is also used to establish site icons (both "favicon" style icons and icons
/// for the home screen and apps on mobile devices) among other things.
///
/// ```swift
/// Link()
///     .href("/media/examples/link-element-example.css")
///     .rel("stylesheet")
/// ```
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/link)
open class Link: BaseActiveElement, _ErrorHandleable, _LoadHandleable {
    var errorClosure: ErrorClosure?
    var errorHandler: (ProgressEvent) -> Void = { _ in }
    
    var loadClosure: LoadClosure?
    var loadHandler: (UIEvent) -> Void = { _ in }
    
    deinit {
        errorClosure?.release()
        loadClosure?.release()
    }
    
    public required init() {
        super.init()
    }
}
