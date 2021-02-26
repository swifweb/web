//
//  LoadedMetadataHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Events

public protocol LoadedMetadataHandleable: DOMEventable {
    @discardableResult
    func onLoadedMetadata(_ handler: @escaping () -> Void) -> Self
}

fileprivate class LoadedMetadataContainer: Container<Event>, StorageKey {
    typealias Value = LoadedMetadataContainer
}

extension LoadedMetadataHandleable {
    /// The onloadedmetadata event occurs when meta data for the specified audio/video has been loaded.
    ///
    /// Applicable to `<audio>` and `<video>` tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onloadedmetadata.asp)
    @discardableResult
    public func onLoadedMetadata(_ handler: @escaping (Event) -> Void) -> Self {
        setDOMHandlerIfNeeded("onloadedmetadata", createOrUpdate(LoadedMetadataContainer.self, handler))
    }
    
    @discardableResult
    public func onLoadedMetadata(_ handler: @escaping () -> Void) -> Self {
        onLoadedMetadata { _ in handler() }
    }
}
