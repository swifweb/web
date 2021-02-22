//
//  History.swift
//  
//
//  Created by Mihael Isaev on 17.11.2020.
//

import Foundation
import JavaScriptKit

public final class History: StateChangeable, Equatable {
    /// Name of the element inside DOM
    let domElementName = "history"
    
    /// Reference to DOM-object
    let domElement: JSValue
    
    /// Returns the number of URLs in the history list
    @State public private(set) var length = 0
    
    /// Current state payload
    @State public private(set) var state: ConvertibleToJSValue? = nil
    
    init () {
        #if arch(wasm32)
        domElement = JSObject.global[domElementName]
        #else
        domElement = JSValue("")
        #endif
        update()
        listenStates()
    }
    
    init(original: History) {
        domElement = original.domElement
        length = original.length
        state = original.state
    }
    
    private func update() {
        manualUpdateStarted()
        #if arch(wasm32)
        length = Int(domElement.length.number ?? 0)
        #endif
        manualUpdateFinished()
    }
    
    /// The back() method loads the previous URL in the history list.
    ///
    /// This is the same as clicking the "Back button" in your browser.
    ///
    /// Note: This method will not work if the previous page does not exist in the history list.
    ///
    /// Tip: You can also use the history.go() method to load the previous (or next) URL in the history list.
    public func back() {
        domElement.back.function!.callAsFunction(this: domElement.object)
    }
    
    /// The back() method loads the previous URL in the history list.
    ///
    /// This is the same as clicking the "Back button" in your browser.
    ///
    /// Note: This method will not work if the previous page does not exist in the history list.
    ///
    /// Tip: You can also use the history.go() method to load the previous (or next) URL in the history list.
    public static func back() {
        WebApp.current.window.history.back()
    }
    
    /// The forward() method loads the next URL in the history list.
    ///
    /// This is the same as clicking the "Forward button" in your browser, or history.go(1).
    ///
    /// Note: This method will not work if the next page does not exist in the history list.
    public func forward() {
        domElement.forward.function!.callAsFunction(this: domElement.object)
    }
    
    /// The forward() method loads the next URL in the history list.
    ///
    /// This is the same as clicking the "Forward button" in your browser, or history.go(1).
    ///
    /// Note: This method will not work if the next page does not exist in the history list.
    public static func forward() {
        WebApp.current.window.history.forward()
    }
    
    /// The go() method loads a specific URL from the history list.
    ///
    /// Example: go Back 2 Pages
    /// ```swift
    /// go(-2)
    /// ```
    ///
    /// `go(0)` will cause current page refresh
    public func go(_ offset: Int) {
        domElement.go.function!.callAsFunction(this: domElement.object, offset)
    }
    
    /// The go() method loads a specific URL from the history list.
    ///
    /// Example: go Back 2 Pages
    /// ```swift
    /// go(-2)
    /// ```
    ///
    /// `go(0)` will cause current page refresh
    public static func go(_ offset: Int) {
        WebApp.current.window.history.go(offset)
    }
    
    /// Calls `go(0)` to refresh the page
    public func refreshPage() {
        go(0)
    }
    
    /// Calls `go(0)` to refresh the page
    public static func refreshPage() {
        WebApp.current.window.history.refreshPage()
    }
    
    /// Pushes the given data onto the session history stack with the specified title (and, if provided, URL).
    /// The data is treated as opaque by the DOM; you may specify any JavaScript object that can be serialized.
    /// Note that all browsers but Safari currently ignore the title parameter.
    public func pushState(title: String = "", path: String? = nil) {
        let data: String? = nil
        domElement.pushState.function!.callAsFunction(this: domElement.object, data, title, path)
        updateState(data)
    }
    
    /// Pushes the given data onto the session history stack with the specified title (and, if provided, URL).
    /// The data is treated as opaque by the DOM; you may specify any JavaScript object that can be serialized.
    /// Note that all browsers but Safari currently ignore the title parameter.
    public static func pushState(title: String = "", path: String? = nil) {
        WebApp.current.window.history.pushState(title: title, path: path)
    }
    
    /// Pushes the given data onto the session history stack with the specified title (and, if provided, URL).
    /// The data is treated as opaque by the DOM; you may specify any JavaScript object that can be serialized.
    /// Note that all browsers but Safari currently ignore the title parameter.
    public func pushState<D: ConvertibleToJSValue>(_ data: D, title: String = "", path: String? = nil) {
        domElement.pushState.function!.callAsFunction(this: domElement.object, data.jsValue(), title, path)
        updateState(data)
    }
    
    /// Pushes the given data onto the session history stack with the specified title (and, if provided, URL).
    /// The data is treated as opaque by the DOM; you may specify any JavaScript object that can be serialized.
    /// Note that all browsers but Safari currently ignore the title parameter.
    public static func pushState<D: ConvertibleToJSValue>(_ data: D, title: String = "", path: String? = nil) {
        WebApp.current.window.history.pushState(data, title: title, path: path)
    }
    
    /// Updates the most recent entry on the history stack to have the specified data, title, and, if provided, URL.
    /// The data is treated as opaque by the DOM; you may specify any JavaScript object that can be serialized.
    /// Note that all browsers but Safari currently ignore the title
    public func replaceState(_ data: [String: String] = [:], title: String = "", path: String) {
        domElement.replaceState.function!.callAsFunction(this: domElement.object, data.jsValue(), title, path)
    }
    
    /// Updates the most recent entry on the history stack to have the specified data, title, and, if provided, URL.
    /// The data is treated as opaque by the DOM; you may specify any JavaScript object that can be serialized.
    /// Note that all browsers but Safari currently ignore the title
    public static func replaceState(_ data: [String: String] = [:], title: String = "", path: String) {
        WebApp.current.window.history.replaceState(data, title: title, path: path)
    }
    
    func onPopState(_ args: [JSValue]) {
        let state = args.first?.state.object
        updateState(state)
    }
    
    func updateState(_ state: ConvertibleToJSValue?) {
        update()
        self.state = state
        WebApp.shared.window.location.update()
    }
    
    // MARK: StateChangeable
    
    lazy var prevSelf: History = copy
    lazy var states: [AnyState] = [_length, _state]
    var manualUpdating: Bool = false
    
    var changed: (History, History) -> Void = { _,_ in }
    
    // MARK: Equatable
    
    public static func == (lhs: History, rhs: History) -> Bool {
        lhs.length == rhs.length && lhs.state?.jsValue() == rhs.state?.jsValue()
    }
}
