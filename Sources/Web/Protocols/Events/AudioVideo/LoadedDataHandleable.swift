//
//  LoadedDataHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol LoadedDataHandleable {
    @discardableResult
    func onLoadedData(_ handler: @escaping () -> Void) -> Self
}

protocol _LoadedDataHandleable: _AnyElement, LoadedDataHandleable {
    typealias LoadedDataClosure = JSClosure
    
    var loadedDataClosure: LoadedDataClosure? { get set }
    var loadedDataHandler: (HandledEvent) -> Void { get set }
}

extension LoadedDataHandleable {
    /// The onloadeddata event occurs when data for the current frame is loaded,
    /// but not enough data to play next frame of the specified audio/video.
    ///
    /// Applicable to <audio> and <video> tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onloadeddata.asp)
    @discardableResult
    public func onLoadedData(_ handler: @escaping (HandledEvent) -> Void) -> Self {
        #if arch(wasm32)
        guard let s = self as? _LoadedDataHandleable else { return self }
        s.loadedDataClosure?.release()
        s.loadedDataClosure = JSClosure { event in
            s.loadedDataHandler(.init(event.jsValue()))
        }
        s.domElement.onloadeddata = s.loadedDataClosure.jsValue()
        s.loadedDataHandler = handler
        #endif
        return self
    }
    
    @discardableResult
    public func onLoadedData(_ handler: @escaping () -> Void) -> Self {
        onLoadedData { _ in handler() }
    }
}
