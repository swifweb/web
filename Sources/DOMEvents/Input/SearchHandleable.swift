//
//  SearchHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Foundation
import JavaScriptKit

public protocol SearchHandleable: DOMEventable {
    @discardableResult
    func onSearch(_ handler: @escaping () -> Void) -> Self
}

fileprivate class SearchContainer: Container<Event>, StorageKey {
    typealias Value = SearchContainer
}

extension SearchHandleable {
    /// The onsearch event occurs when a user presses the "ENTER" key or clicks the "x" button in an `<input>` element with type="search".
    ///
    /// Applicable to `<input type="search">`
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onsearch.asp)
    @discardableResult
    public func onSearch(_ handler: @escaping (Event, Self) -> Void) -> Self {
        setDOMHandlerIfNeeded("onsearch", createOrUpdate(SearchContainer.self) {
            handler($0, self)
        })
    }
    
    /// The onsearch event occurs when a user presses the "ENTER" key or clicks the "x" button in an `<input>` element with type="search".
    @discardableResult
    public func onSearch(_ handler: @escaping (Event) -> Void) -> Self {
        onSearch { event, _ in
            handler(event)
        }
    }
    
    /// The onsearch event occurs when a user presses the "ENTER" key or clicks the "x" button in an `<input>` element with type="search".
    @discardableResult
    public func onSearch(_ handler: @escaping () -> Void) -> Self {
        onSearch { _ in handler() }
    }
}
