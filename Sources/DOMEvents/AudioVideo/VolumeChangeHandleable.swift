//
//  VolumeChangeHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Events

public protocol VolumeChangeHandleable: DOMEventable {
    @discardableResult
    func onVolumeChange(_ handler: @escaping () -> Void) -> Self
}

fileprivate class VolumeChangeContainer: Container<Event>, StorageKey {
    typealias Value = VolumeChangeContainer
}

extension VolumeChangeHandleable {
    /// The onvolumechange event occurs each time the volume of a video/audio has been changed.
    ///
    /// Applicable to `<audio>` and `<video>` tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onvolumechange.asp)
    @discardableResult
    public func onVolumeChange(_ handler: @escaping (Event) -> Void) -> Self {
        setDOMHandlerIfNeeded("onvolumechange", createOrUpdate(VolumeChangeContainer.self, handler))
    }
    
    @discardableResult
    public func onVolumeChange(_ handler: @escaping () -> Void) -> Self {
        onVolumeChange { _ in handler() }
    }
}
