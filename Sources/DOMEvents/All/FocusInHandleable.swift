//
//  FocusInHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Events

public protocol FocusInHandleable: DOMEventable {
    @discardableResult
    func onFocusIn(_ handler: @escaping () -> Void) -> Self
}

fileprivate class FocusInContainer: Container<FocusEvent>, StorageKey {
    typealias Value = FocusInContainer
}

extension FocusInHandleable {
    /// The onfocusin event occurs when an element is about to get focus.
    ///
    /// Applicable to all tags except: `<base>`, `<bdo>`, `<br>`, `<head>`, `<html>`, `<iframe>`, `<meta>`, `<param>`, `<script>`, `<style>`, and `<title>`
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onfocusin.asp)
    @discardableResult
    public func onFocusIn(_ handler: @escaping (Self, FocusEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("onfocusin", createOrUpdate(FocusInContainer.self) { [weak self] in
            guard let self = self else { return }
            handler(self, $0)
        })
    }
    
    /// The onfocusin event occurs when an element is about to get focus.
    ///
    /// Applicable to all tags except: `<base>`, `<bdo>`, `<br>`, `<head>`, `<html>`, `<iframe>`, `<meta>`, `<param>`, `<script>`, `<style>`, and `<title>`
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onfocusin.asp)
    @discardableResult
    public func onFocusIn(_ handler: @escaping (Self) -> Void) -> Self {
        onFocusIn { [weak self] _,_ in
            guard let self = self else { return }
            handler(self)
        }
    }
    
    /// The onfocusin event occurs when an element is about to get focus.
    ///
    /// Applicable to all tags except: `<base>`, `<bdo>`, `<br>`, `<head>`, `<html>`, `<iframe>`, `<meta>`, `<param>`, `<script>`, `<style>`, and `<title>`
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onfocusin.asp)
    @discardableResult
    public func onFocusIn(_ handler: @escaping () -> Void) -> Self {
        onFocusIn { _ in handler() }
    }
}
