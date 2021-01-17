//
//  IFrame.swift
//  WasmApp
//
//  Created by Mihael Isaev on 16.12.2020.
//

import Foundation

/// The HTML Inline Frame element `<iframe>` represents a nested browsing context,
/// embedding another HTML page into the current one.
///
/// ```swift
/// IFrame()
///     .id("inlineFrameExample")
///     .title("Inline Frame Example")
///     .width(300.px)
///     .height(200.px)
///     .src("https://www.openstreetmap.org/")
/// ```
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe)
open class IFrame: BaseElement, _LoadHandleable {
    var loadClosure: LoadClosure?
    var loadHandler: (UIEvent) -> Void = { _ in }
    
    deinit {
        loadClosure?.release()
    }
}
