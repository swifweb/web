//
//  PageController.swift
//  Web
//
//  Created by Mihael Isaev on 20.11.2020.
//

import Foundation
import JavaScriptKit
import DOM

@available(*, unavailable, renamed: "PageController")
public typealias ViewController = PageController

open class PageController: BaseContentElement {
    open override class var name: String { "div" }
    
    public var controller: PageController { return self }
    public internal(set) var req: Request?
    
    public var view: JSValue { domElement }
    
    @State public var title = ""
    @State public var metaDescription = ""
    
    public init (@DOM closure: @escaping (PageController) -> DOM.Content) {
        super.init()
        self.parseDOMItem(closure(self).domContentItem)
    }
    
    required public init() {
        super.init()
    }
    
    open override func buildUI() {
        super.buildUI()
        title = WebApp.shared.window.document.title
        $title.listen {
            WebApp.shared.window.document.title = $0
        }
        metaDescription = WebApp.shared.window.document.metaDescription
        $metaDescription.listen {
            WebApp.shared.window.document.metaDescription = $0
        }
    }
    
    var willLoadHandlers: [() -> Void] = []
    var didLoadHandlers: [() -> Void] = []
    var willUnloadHandlers: [() -> Void] = []
    var didUnloadHandlers: [() -> Void] = []
    
    open func willLoad(with req: PageRequest) {
        willLoadHandlers.forEach { $0() }
    }
    open func didLoad(with req: PageRequest) {
        didLoadHandlers.forEach { $0() }
    }
    
    open func willUnload() {
        willUnloadHandlers.forEach { $0() }
    }
    open func didUnload() {
        didUnloadHandlers.forEach { $0() }
    }
    
    @discardableResult
    public func onWillLoad(_ handler: @escaping () -> Void) -> Self {
        willLoadHandlers.append(handler)
        return self
    }
    
    @discardableResult
    public func onWillLoad(_ handler: @escaping (Self) -> Void) -> Self {
        willLoadHandlers.append({
            handler(self)
        })
        return self
    }
    
    @discardableResult
    public func onDidLoad(_ handler: @escaping () -> Void) -> Self {
        didLoadHandlers.append(handler)
        return self
    }
    
    @discardableResult
    public func onDidLoad(_ handler: @escaping (Self) -> Void) -> Self {
        didLoadHandlers.append({
            handler(self)
        })
        return self
    }
    
    @discardableResult
    public func onWillUnload(_ handler: @escaping () -> Void) -> Self {
        willUnloadHandlers.append(handler)
        return self
    }
    
    @discardableResult
    public func onWillUnload(_ handler: @escaping (Self) -> Void) -> Self {
        willUnloadHandlers.append({
            handler(self)
        })
        return self
    }
    
    @discardableResult
    public func onDidUnload(_ handler: @escaping () -> Void) -> Self {
        didUnloadHandlers.append(handler)
        return self
    }
    
    @discardableResult
    public func onDidUnload(_ handler: @escaping (Self) -> Void) -> Self {
        didUnloadHandlers.append({
            handler(self)
        })
        return self
    }
    
    // MARK: History
    
    /// Calls `window.history.pushState` to replace current path
    public func changePath(to path: String) {
        WebApp.shared.window.history.pushState(path: path)
    }
    
    // MARK: - Fragment Router
    
    var fragments: [FragmentRouter] = []
    
    @discardableResult
    func canRespond(_ req: Request, _ rootPath: String) throws -> Bool {
        var canRespond = false
        for fragment in fragments {
            if try fragment.canRespond(req, rootPath) {
                canRespond = true
            }
        }
        return canRespond
    }
    
    // MARK: Alert
    
    public func alert(_ message: String) {
        JSObject.global.alert.function?.callAsFunction(message.jsValue)
    }
}

extension String {
    func deletingPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        return String(self.dropFirst(prefix.count))
    }
}
