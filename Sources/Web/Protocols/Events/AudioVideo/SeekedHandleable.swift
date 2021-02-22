//
//  SeekedHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Foundation
import JavaScriptKit

public protocol SeekedHandleable {
    @discardableResult
    func onSeeked(_ handler: @escaping () -> Void) -> Self
}

protocol _SeekedHandleable: _AnyElement, SeekedHandleable {
    typealias SeekedClosure = JSClosure
    
    var seekedClosure: SeekedClosure? { get set }
    var seekedHandler: (HandledEvent) -> Void { get set }
}

extension SeekedHandleable {
    /// The onseeked event occurs when the user is finished moving/skipping to a new position in the audio/video
    ///
    /// Applicable to <audio> and <video> tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onseeked.asp)
    @discardableResult
    public func onSeeked(_ handler: @escaping (HandledEvent) -> Void) -> Self {
        #if arch(wasm32)
        guard let s = self as? _SeekedHandleable else { return self }
        s.seekedClosure?.release()
        s.seekedClosure = JSClosure { event in
            s.seekedHandler(.init(event.jsValue()))
            return .null
        }
        s.domElement.onseeked = s.seekedClosure.jsValue()
        s.seekedHandler = handler
        #endif
        return self
    }
    
    @discardableResult
    public func onSeeked(_ handler: @escaping () -> Void) -> Self {
        onSeeked { _ in handler() }
    }
}
