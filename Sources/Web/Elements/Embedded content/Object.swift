//
//  Object.swift
//  Web
//
//  Created by Mihael Isaev on 16.12.2020.
//

import Foundation

/// The HTML `<object>` element represents an external resource,
/// which can be treated as an image, a nested browsing context,
/// or a resource to be handled by a plugin.
///
/// ```swift
/// Object()
///     .type("application/pdf")
///     .data("/media/examples/In-CC0.pdf")
///     .width(250.px)
///     .height(200.px)
/// ```
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/object)
open class Object: BaseActiveElement, _ErrorHandleable, _ScrollHandleable {
    var errorClosure: ErrorClosure?
    var errorHandler: (ProgressEvent) -> Void = { _ in }
    
    var scrollClosure: ScrollClosure?
    var scrollHandler: (UIEvent) -> Void = { _ in }
    
    deinit {
        errorClosure?.release()
        scrollClosure?.release()
    }
}
