//
//  EndedHandleable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol EndedHandleable {
    @discardableResult
    func onEnded(_ handler: @escaping () -> Void) -> Self
}

protocol _EndedHandleable: _AnyElement, EndedHandleable {
    typealias EndedClosure = JSClosure
    
    var endedClosure: EndedClosure? { get set }
    var endedHandler: (HandledEvent) -> Void { get set }
}

extension EndedHandleable {
    /// The onended event occurs when the audio/video has reached the end.
    ///
    /// Applicable to <audio> and <video> tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onended.asp)
    @discardableResult
    public func onEnded(_ handler: @escaping (HandledEvent) -> Void) -> Self {
        guard let s = self as? _EndedHandleable else { return self }
        s.endedClosure?.release()
        s.endedClosure = JSClosure { event in
            s.endedHandler(.init(event.jsValue()))
        }
        s.domElement.onended = s.endedClosure.jsValue()
        s.endedHandler = handler
        return self
    }
    
    @discardableResult
    public func onEnded(_ handler: @escaping () -> Void) -> Self {
        onEnded { _ in handler() }
    }
}
