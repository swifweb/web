//
//  BlurHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol BlurHandleable {
    @discardableResult
    func onBlur(_ handler: @escaping () -> Void) -> Self
}

protocol _BlurHandleable: _AnyElement, BlurHandleable {
    typealias BlurClosure = JSClosure
    
    var blurClosure: BlurClosure? { get set }
    var blurHandler: (FocusEvent) -> Void { get set }
}

extension BlurHandleable {
    /// The onblur event occurs when an object loses focus.
    ///
    /// Applicable to all tags except: <base>, <bdo>, <br>, <head>, <html>, <iframe>, <meta>, <param>, <script>, <style>, and <title>
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onblur.asp)
    @discardableResult
    public func onBlur(_ handler: @escaping (FocusEvent) -> Void) -> Self {
        guard let s = self as? _BlurHandleable else { return self }
        s.blurClosure?.release()
        s.blurClosure = JSClosure { event in
            s.blurHandler(.init(event.jsValue()))
        }
        s.domElement.onblur = s.blurClosure.jsValue()
        s.blurHandler = handler
        return self
    }
    
    @discardableResult
    public func onBlur(_ handler: @escaping () -> Void) -> Self {
        onBlur { _ in handler() }
    }
}
