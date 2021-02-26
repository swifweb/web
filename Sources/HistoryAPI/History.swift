//
//  History.swift
//  HistoryAPI
//
//  Created by Mihael Isaev on 17.11.2020.
//

import WebFoundation
import LocationAPI

private var _shared: History?

/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/History)
public final class History: InnerStateChangeable, Equatable {
    public static var shared: History {
        guard let shared = _shared else {
            let shared = History()
            _shared = shared
            return shared
        }
        return shared
    }
    
    /// Name of the element inside DOM
    let domElementName = "history"
    
    /// Reference to DOM-object
    let domElement: JSValue
    
    /// Returns the number of URLs in the history list
    @State public private(set) var length = 0
    
    /// Current state payload
    @State public private(set) var state: ConvertibleToJSValue? = nil
    
    private init () {
        #if arch(wasm32)
        domElement = JSObject.global[domElementName]
        #else
        domElement = JSValue("")
        #endif
        update()
        innerStatesListen()
    }
    
    public init(original: History) {
        domElement = original.domElement
        length = original.length
        state = original.state
    }
    
    private func update() {
        innerStatesManualUpdateStarted()
        #if arch(wasm32)
        length = Int(domElement.length.number ?? 0)
        #endif
        innerStatesManualUpdateFinished()
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
        shared.back()
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
        shared.forward()
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
        shared.go(offset)
    }
    
    /// Calls `go(0)` to refresh the page
    public func refreshPage() {
        go(0)
    }
    
    /// Calls `go(0)` to refresh the page
    public static func refreshPage() {
        shared.refreshPage()
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
        shared.pushState(title: title, path: path)
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
        shared.pushState(data, title: title, path: path)
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
        shared.replaceState(data, title: title, path: path)
    }
    
    public func onPopState(_ args: [JSValue]) {
        let state = args.first?.state.object
        updateState(state)
    }
    
    func updateState(_ state: ConvertibleToJSValue?) {
        update()
        self.state = state
        Location.shared.update()
    }
    
    // MARK: InnerStateChangeable
    
    public lazy var innerStatePrevSelf: History = copy
    public lazy var innerStates: [AnyState] = [_length, _state]
    public var innerStateManualUpdating: Bool = false
    
    public var innerStateChanged: (History, History) -> Void = { _,_ in }
    
    // MARK: Equatable
    
    public static func == (lhs: History, rhs: History) -> Bool {
        lhs.length == rhs.length && lhs.state?.jsValue() == rhs.state?.jsValue()
    }
}
