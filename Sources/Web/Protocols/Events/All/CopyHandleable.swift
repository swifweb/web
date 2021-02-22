//
//  CopyHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol CopyHandleable {
    @discardableResult
    func onCopy(_ handler: @escaping () -> Void) -> Self
}

protocol _CopyHandleable: _AnyElement, CopyHandleable {
    typealias CopyClosure = JSClosure
    
    var copyClosure: CopyClosure? { get set }
    var copyHandler: (ClipboardEvent) -> Void { get set }
}

extension CopyHandleable {
    /// The `oncopy` event occurs when the user copies the content of an element.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_oncopy.asp)
    @discardableResult
    public func onCopy(_ handler: @escaping (ClipboardEvent) -> Void) -> Self {
        #if arch(wasm32)
        guard let s = self as? _CopyHandleable else { return self }
        s.copyClosure?.release()
        s.copyClosure = JSClosure { event in
            s.copyHandler(.init(event.jsValue()))
            return .null
        }
        s.domElement.oncopy = s.copyClosure.jsValue()
        s.copyHandler = handler
        #endif
        return self
    }
    
    @discardableResult
    public func onCopy(_ handler: @escaping () -> Void) -> Self {
        onCopy { _ in handler() }
    }
}
