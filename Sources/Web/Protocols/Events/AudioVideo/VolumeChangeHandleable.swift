//
//  VolumeChangeHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Foundation
import JavaScriptKit

public protocol VolumeChangeHandleable {
    @discardableResult
    func onVolumeChange(_ handler: @escaping () -> Void) -> Self
}

protocol _VolumeChangeHandleable: _AnyElement, VolumeChangeHandleable {
    typealias VolumeChangeClosure = JSClosure
    
    var volumeChangeClosure: VolumeChangeClosure? { get set }
    var volumeChangeHandler: (HandledEvent) -> Void { get set }
}

extension VolumeChangeHandleable {
    /// The onvolumechange event occurs each time the volume of a video/audio has been changed.
    ///
    /// Applicable to <audio> and <video> tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onvolumechange.asp)
    @discardableResult
    public func onVolumeChange(_ handler: @escaping (HandledEvent) -> Void) -> Self {
        guard let s = self as? _VolumeChangeHandleable else { return self }
        s.volumeChangeClosure?.release()
        s.volumeChangeClosure = JSClosure { event in
            s.volumeChangeHandler(.init(event.jsValue()))
        }
        s.domElement.onvolumechange = s.volumeChangeClosure.jsValue()
        s.volumeChangeHandler = handler
        return self
    }
    
    @discardableResult
    public func onVolumeChange(_ handler: @escaping () -> Void) -> Self {
        onVolumeChange { _ in handler() }
    }
}
