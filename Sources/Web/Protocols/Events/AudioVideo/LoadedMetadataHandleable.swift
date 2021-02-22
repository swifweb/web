//
//  LoadedMetadataHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol LoadedMetadataHandleable {
    @discardableResult
    func onLoadedMetadata(_ handler: @escaping () -> Void) -> Self
}

protocol _LoadedMetadataHandleable: _AnyElement, LoadedMetadataHandleable {
    typealias LoadedMetadataClosure = JSClosure
    
    var loadedMetadataClosure: LoadedMetadataClosure? { get set }
    var loadedMetadataHandler: (HandledEvent) -> Void { get set }
}

extension LoadedMetadataHandleable {
    /// The onloadedmetadata event occurs when meta data for the specified audio/video has been loaded.
    ///
    /// Applicable to <audio> and <video> tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onloadedmetadata.asp)
    @discardableResult
    public func onLoadedMetadata(_ handler: @escaping (HandledEvent) -> Void) -> Self {
        #if arch(wasm32)
        guard let s = self as? _LoadedMetadataHandleable else { return self }
        s.loadedMetadataClosure?.release()
        s.loadedMetadataClosure = JSClosure { event in
            s.loadedMetadataHandler(.init(event.jsValue()))
            return .null
        }
        s.domElement.onloadedmetadata = s.loadedMetadataClosure.jsValue()
        s.loadedMetadataHandler = handler
        #endif
        return self
    }
    
    @discardableResult
    public func onLoadedMetadata(_ handler: @escaping () -> Void) -> Self {
        onLoadedMetadata { _ in handler() }
    }
}
