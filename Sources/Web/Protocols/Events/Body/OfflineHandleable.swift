//
//  OfflineHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol OfflineHandleable {
    @discardableResult
    func onOffline(_ handler: @escaping () -> Void) -> Self
}

protocol _OfflineHandleable: _AnyElement, OfflineHandleable {
    typealias OfflineClosure = JSClosure
    
    var offlineClosure: OfflineClosure? { get set }
    var offlineHandler: (HandledEvent) -> Void { get set }
}

extension OfflineHandleable {
    /// The onoffline event occurs when the browser starts to work offline.
    ///
    /// Applicable to <body> tag
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onoffline.asp)
    @discardableResult
    public func onOffline(_ handler: @escaping (HandledEvent) -> Void) -> Self {
        guard let s = self as? _OfflineHandleable else { return self }
        s.offlineClosure?.release()
        s.offlineClosure = JSClosure { event in
            s.offlineHandler(.init(event.jsValue()))
        }
        s.domElement.onoffline = s.offlineClosure.jsValue()
        s.offlineHandler = handler
        return self
    }
    
    @discardableResult
    public func onOffline(_ handler: @escaping () -> Void) -> Self {
        onOffline { _ in handler() }
    }
}
