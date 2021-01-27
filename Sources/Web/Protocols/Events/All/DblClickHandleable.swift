//
//  DblClickHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol DblClickHandleable {
    @discardableResult
    func onDblClick(_ handler: @escaping () -> Void) -> Self
}

protocol _DblClickHandleable: _AnyElement, DblClickHandleable {
    typealias DblClickClosure = JSClosure
    
    var dblClickClosure: DblClickClosure? { get set }
    var dblClickHandler: (MouseEvent) -> Void { get set }
}

extension DblClickHandleable {
    /// The ondblclick event occurs when the user double-clicks on an element.
    ///
    /// Applicable to all tags except: <base>, <bdo>, <br>, <head>, <html>, <iframe>, <meta>, <param>, <script>, <style>, and <title>.
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_ondblclick.asp)
    @discardableResult
    public func onDblClick(_ handler: @escaping (MouseEvent) -> Void) -> Self {
        #if arch(wasm32)
        guard let s = self as? _DblClickHandleable else { return self }
        s.dblClickClosure?.release()
        s.dblClickClosure = JSClosure { event in
            s.dblClickHandler(.init(event.jsValue()))
        }
        s.domElement.ondblclick = s.dblClickClosure.jsValue()
        s.dblClickHandler = handler
        #endif
        return self
    }
    
    @discardableResult
    public func onDblClick(_ handler: @escaping () -> Void) -> Self {
        onDblClick { _ in handler() }
    }
}
