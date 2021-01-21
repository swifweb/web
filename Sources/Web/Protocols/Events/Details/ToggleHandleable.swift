//
//  ToggleHandleable.swift
//  Web
//
//  Created by Mihael Isaev on 30.11.2020.
//

import Foundation
import JavaScriptKit

public protocol ToggleHandleable {
    @discardableResult
    func onToggle(_ handler: @escaping () -> Void) -> Self
}

protocol _ToggleHandleable: _AnyElement, ToggleHandleable {
    typealias ToggleClosure = JSClosure
    
    var toggleClosure: ToggleClosure? { get set }
    var toggleHandler: (HandledEvent) -> Void { get set }
}

extension ToggleHandleable {
    /// The `ontoggle` event occurs when the user opens or closes the `<details>` element.
    ///
    /// Applicable to <details> tag
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_ontoggle.asp)
    @discardableResult
    public func onToggle(_ handler: @escaping (HandledEvent) -> Void) -> Self {
        guard let s = self as? _ToggleHandleable else { return self }
        s.toggleClosure?.release()
        s.toggleClosure = JSClosure { event in
            s.toggleHandler(.init(event.jsValue()))
        }
        s.domElement.ontoggle = s.toggleClosure.jsValue()
        s.toggleHandler = handler
        return self
    }
    
    @discardableResult
    public func onToggle(_ handler: @escaping () -> Void) -> Self {
        onToggle { _ in handler() }
    }
}
