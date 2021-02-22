//
//  SelectHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Foundation
import JavaScriptKit

public protocol SelectHandleable {
    @discardableResult
    func onSelect(_ handler: @escaping () -> Void) -> Self
}

protocol _SelectHandleable: _AnyElement, SelectHandleable {
    typealias SelectClosure = JSClosure
    
    var selectClosure: SelectClosure? { get set }
    var selectHandler: (UIEvent) -> Void { get set }
}

extension SelectHandleable {
    /// The `onselect` event occurs after some text has been selected in an element.
    ///
    /// Applicable to `<input type="file">`, `<input type="password">`, `<input type="text">`, and `<textarea>`
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onselect.asp)
    @discardableResult
    public func onSelect(_ handler: @escaping (UIEvent, Self) -> Void) -> Self {
        #if arch(wasm32)
        guard let s = self as? _SelectHandleable else { return self }
        s.selectClosure?.release()
        s.selectClosure = JSClosure { event in
            s.selectHandler(.init(event.jsValue()))
            return .null
        }
        s.domElement.onselect = s.selectClosure.jsValue()
        s.selectHandler = {
            handler($0, self)
        }
        #endif
        return self
    }
    
    /// The `onselect` event occurs after some text has been selected in an element.
    @discardableResult
    public func onSelect(_ handler: @escaping (UIEvent) -> Void) -> Self {
        onSelect { event, _ in
            handler(event)
        }
    }
    
    /// The `onselect` event occurs after some text has been selected in an element.
    @discardableResult
    public func onSelect(_ handler: @escaping () -> Void) -> Self {
        onSelect { _ in handler() }
    }
}
