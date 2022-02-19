//
//  BlurHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Events

public protocol BlurHandleable: DOMEventable {
    @discardableResult
    func onBlur(_ handler: @escaping () -> Void) -> Self
}

fileprivate class BlurContainer: Container<FocusEvent>, StorageKey {
    typealias Value = BlurContainer
}

extension BlurHandleable {
    /// The onblur event occurs when an object loses focus.
    ///
    /// Applicable to all tags except: <base>, <bdo>, <br>, <head>, <html>, <iframe>, <meta>, <param>, <script>, <style>, and <title>
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onblur.asp)
    @discardableResult
    public func onBlur(_ handler: @escaping (Self, FocusEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("onblur", createOrUpdate(BlurContainer.self) {
            handler(self, $0)
        })
    }
    
    /// The onblur event occurs when an object loses focus.
    ///
    /// Applicable to all tags except: <base>, <bdo>, <br>, <head>, <html>, <iframe>, <meta>, <param>, <script>, <style>, and <title>
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onblur.asp)
    @discardableResult
    public func onBlur(_ handler: @escaping (Self) -> Void) -> Self {
        onBlur { _,_ in handler(self) }
    }
    
    /// The onblur event occurs when an object loses focus.
    ///
    /// Applicable to all tags except: <base>, <bdo>, <br>, <head>, <html>, <iframe>, <meta>, <param>, <script>, <style>, and <title>
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onblur.asp)
    @discardableResult
    public func onBlur(_ handler: @escaping () -> Void) -> Self {
        onBlur { _ in handler() }
    }
}
