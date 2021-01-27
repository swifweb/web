//
//  CutHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol CutHandleable {
    @discardableResult
    func onCut(_ handler: @escaping () -> Void) -> Self
}

protocol _CutHandleable: _AnyElement, CutHandleable {
    typealias CutClosure = JSClosure
    
    var cutClosure: CutClosure? { get set }
    var cutHandler: (ClipboardEvent) -> Void { get set }
}

extension CutHandleable {
    /// The oncut event occurs when the user cuts the content of an element.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_oncut.asp)
    @discardableResult
    public func onCut(_ handler: @escaping (ClipboardEvent) -> Void) -> Self {
        #if arch(wasm32)
        guard let s = self as? _CutHandleable else { return self }
        s.cutClosure?.release()
        s.cutClosure = JSClosure { event in
            s.cutHandler(.init(event.jsValue()))
        }
        s.domElement.oncut = s.cutClosure.jsValue()
        s.cutHandler = handler
        #endif
        return self
    }
    
    @discardableResult
    public func onCut(_ handler: @escaping () -> Void) -> Self {
        onCut { _ in handler() }
    }
}
