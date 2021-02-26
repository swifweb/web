//
//  LoadedDataHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Events

public protocol LoadedDataHandleable: DOMEventable {
    @discardableResult
    func onLoadedData(_ handler: @escaping () -> Void) -> Self
}

fileprivate class LoadedDataContainer: Container<Event>, StorageKey {
    typealias Value = LoadedDataContainer
}

extension LoadedDataHandleable {
    /// The onloadeddata event occurs when data for the current frame is loaded,
    /// but not enough data to play next frame of the specified audio/video.
    ///
    /// Applicable to `<audio>` and `<video>` tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onloadeddata.asp)
    @discardableResult
    public func onLoadedData(_ handler: @escaping (Event) -> Void) -> Self {
        setDOMHandlerIfNeeded("onloadeddata", createOrUpdate(LoadedDataContainer.self, handler))
    }
    
    @discardableResult
    public func onLoadedData(_ handler: @escaping () -> Void) -> Self {
        onLoadedData { _ in handler() }
    }
}
