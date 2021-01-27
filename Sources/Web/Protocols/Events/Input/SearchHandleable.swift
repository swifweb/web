//
//  SearchHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Foundation
import JavaScriptKit

public protocol SearchHandleable {
    @discardableResult
    func onSearch(_ handler: @escaping () -> Void) -> Self
}

protocol _SearchHandleable: _AnyElement, SearchHandleable {
    typealias SearchClosure = JSClosure
    
    var searchClosure: SearchClosure? { get set }
    var searchHandler: (HandledEvent) -> Void { get set }
}

extension SearchHandleable {
    /// The onsearch event occurs when a user presses the "ENTER" key or clicks the "x" button in an `<input>` element with type="search".
    ///
    /// Applicable to `<input type="search">`
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onsearch.asp)
    @discardableResult
    public func onSearch(_ handler: @escaping (HandledEvent, Self) -> Void) -> Self {
        #if arch(wasm32)
        guard let s = self as? _SearchHandleable else { return self }
        s.searchClosure?.release()
        s.searchClosure = JSClosure { event in
            s.searchHandler(.init(event.jsValue()))
        }
        s.domElement.onsearch = s.searchClosure.jsValue()
        s.searchHandler = {
            handler($0, self)
        }
        #endif
        return self
    }
    
    /// The onsearch event occurs when a user presses the "ENTER" key or clicks the "x" button in an `<input>` element with type="search".
    @discardableResult
    public func onSearch(_ handler: @escaping (HandledEvent) -> Void) -> Self {
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
