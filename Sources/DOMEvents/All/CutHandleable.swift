//
//  CutHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Events

public protocol CutHandleable: DOMEventable {
    @discardableResult
    func onCut(_ handler: @escaping () -> Void) -> Self
}

fileprivate class CutContainer: Container<ClipboardEvent>, StorageKey {
    typealias Value = CutContainer
}

extension CutHandleable {
    /// The oncut event occurs when the user cuts the content of an element.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_oncut.asp)
    @discardableResult
    public func onCut(_ handler: @escaping (Self, ClipboardEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("oncut", createOrUpdate(CutContainer.self) { [weak self] in
            guard let self = self else { return }
            handler(self, $0)
        })
    }
    
    /// The oncut event occurs when the user cuts the content of an element.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_oncut.asp)
    @discardableResult
    public func onCut(_ handler: @escaping (Self) -> Void) -> Self {
        onCut { [weak self] _,_ in
            guard let self = self else { return }
            handler(self)
        }
    }
    
    /// The oncut event occurs when the user cuts the content of an element.
    ///
    /// Applicable to all tags
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_oncut.asp)
    @discardableResult
    public func onCut(_ handler: @escaping () -> Void) -> Self {
        onCut { _ in handler() }
    }
}
