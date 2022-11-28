//
//  FocusOutHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Events

public protocol FocusOutHandleable: DOMEventable {
    @discardableResult
    func onFocusOut(_ handler: @escaping () -> Void) -> Self
}

fileprivate class FocusOutContainer: Container<FocusEvent>, StorageKey {
    typealias Value = FocusOutContainer
}

extension FocusOutHandleable {
    /// The onfocusout event occurs when an element is about to lose focus.
    ///
    /// Applicable to all tags except: `<base>`, `<bdo>`, `<br>`, `<head>`, `<html>`, `<iframe>`, `<meta>`, `<param>`, `<script>`, `<style>`, and `<title>`
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onfocusout.asp)
    @discardableResult
    public func onFocusOut(_ handler: @escaping (Self, FocusEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("onfocusout", createOrUpdate(FocusOutContainer.self) { [weak self] in
            guard let self = self else { return }
            handler(self, $0)
        })
    }
    
    /// The onfocusout event occurs when an element is about to lose focus.
    ///
    /// Applicable to all tags except: `<base>`, `<bdo>`, `<br>`, `<head>`, `<html>`, `<iframe>`, `<meta>`, `<param>`, `<script>`, `<style>`, and `<title>`
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onfocusout.asp)
    @discardableResult
    public func onFocusOut(_ handler: @escaping (Self) -> Void) -> Self {
        onFocusOut { [weak self] _,_ in
            guard let self = self else { return }
            handler(self)
        }
    }
    
    /// The onfocusout event occurs when an element is about to lose focus.
    ///
    /// Applicable to all tags except: `<base>`, `<bdo>`, `<br>`, `<head>`, `<html>`, `<iframe>`, `<meta>`, `<param>`, `<script>`, `<style>`, and `<title>`
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onfocusout.asp)
    @discardableResult
    public func onFocusOut(_ handler: @escaping () -> Void) -> Self {
        onFocusOut { _ in handler() }
    }
}
