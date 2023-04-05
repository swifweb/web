//
//  Window.swift
//  DOM
//
//  Created by Mihael Isaev on 16.11.2020.
//

import WebFoundation
import Events

private var _shared: Window?

public class Window: EventListenerCompatibleObject, EventTarget {
    public lazy var storage: Storage = .init()
    public var jsValue: JSValue { domElement }
    
    public static var shared: Window {
        guard let shared = _shared else {
            let shared = Window()
            _shared = shared
            return shared
        }
        return shared
    }
    
    /// Name of the element inside DOM
    public let domElementName = "window"
    
    /// Reference to DOM-object
    public private(set) lazy var domElement = JSObject.global[domElementName]
    
    /// Document
    public private(set) lazy var document = Document(self)
    
    /// Returns true if app is visible
    /// Returns false e.g. when user switch to another tab in the browser
    @State public private(set) var isInForeground = false
    
    /// Returns true if user is interacting inside the window
    /// Return false even if app is wisible on user's screen
    /// but user clicking somewhere outside the app (e.g. even if user click inside developer console)
    @State public private(set) var isActive = false
    
    /// Returns the size of the window's content area (viewport) including scrollbars
    @State public private(set) var innerSize: Size = Size.zero
    
    /// Returns the size of the browser window, including toolbars/scrollbars
    @State public private(set) var outerSize: Size = Size.zero
    
    /// Position on screen
    @State public private(set) var point: Point = Point.zero
    
    /// The length property returns the number of `<iframe>` elements in the current window.
    @State public private(set) var length: Double = 0
    
    /// Track this variable to know wether browser is online or not
    @State public private(set) var isOnline = false
    
    /// Device screen pixel ratio, e.g. `2.0` for retina display
    public var devicePixelRatio: Double { screen?.pixelRatio ?? 1 }
    
    /// Secure context flag
    public private(set) var isSecureContext = false
    
    /// Returns a reference to the window that created the window
    public private(set) lazy var opener = Opener(domElement)
    
    /// Screen
    public private(set) lazy var screen = Screen(domElement)
    
    /// The history object contains the URLs visited by the user (within a browser window).
    ///
    /// The history object is part of the window object and is accessed through the window.history property.
    ///
    /// Note: There is no public standard that applies to the history object, but all major browsers support it.
    @State public private(set) var history = History.shared
    
    /// The localStorage and sessionStorage properties allow to save key/value pairs in a web browser.
    ///
    /// The localStorage object stores data with no expiration date.
    /// The data will not be deleted when the browser is closed, and will be available the next day, week, or year.
    ///
    /// The localStorage property is read-only.
    ///
    /// Tip: Also look at the sessionStorage property which stores data for one session (data is lost when the browser tab is closed).
    public private(set) lazy var localStorage = LocalStorage.shared
    
    /// The location object contains information about the current URL.
    ///
    /// The location object is part of the window object and is accessed through the window.location property.
    ///
    /// Note: There is no public standard that applies to the location object, but all major browsers support it.
    @State public private(set) var location = Location.shared
    
    /// The navigator object contains information about the browser.
    ///
    /// Note: There is no public standard that applies to the navigator object, but all major browsers support it.
    @State public private(set) var navigator = Navigator.shared
    
    /// The localStorage and sessionStorage properties allow to save key/value pairs in a web browser.
    ///
    /// The sessionStorage object stores data for only one session (the data is deleted when the browser tab is closed).
    ///
    /// Tip: Also look at the localStorage property which stores data with no expiration date.
    /// The data will not be deleted when the browser is closed, and will be available the next day, week, or year.
    public private(set) lazy var sessionStorage = SessionStorage.shared
    
    /// We should hold event listeners in this array
    private var eventListeners: [EventListener] = []
    
    /// Dark Mode Detector
    private var darkModeDetector: DarkModeDetector?
    
    /// Dark Mode Flag
    @State public private(set) var isDark = false
    
    /// Event types for window
    public enum Event: String, EventListenerCompatibleType {
        case blur, focus, visibilitychange, beforeunload, resize, online, offline, popstate, storage
    }
    
    /// Alias to event type enum
    public typealias Enum = Event
    
    init () {
        setup()
    }
    
    private var isAppStarted = false
    
    /// Have to be called only once right after App launch
    public func appDidStarted() {
        guard !isAppStarted else { return }
        isAppStarted = true
        notifyFinishLaunching()
        if document.isVisible {
            isActive = true
            notifyBecomeActive()
        }
    }
    
    func setup() {
        #if arch(wasm32)
        isOnline = navigator.onLine
        $isOnline.listenOnlyIfChanged { self.navigator.onLine = $0 }
        darkModeDetector = DarkModeDetector { self.isDark = $0 }
        document.updateVisibility()
        length = domElement.length.number ?? 0
        isSecureContext = domElement.isSecureContext.boolean ?? false
        eventListeners.append(.init(object: self, event: .blur, handleBlurEvent))
        eventListeners.append(.init(object: self, event: .focus, handleFocusEvent))
        eventListeners.append(.init(object: self, event: .visibilitychange, document.updateVisibility))
        eventListeners.append(.init(object: self, event: .beforeunload, notifyWillTerminate))
        eventListeners.append(.init(object: self, event: .resize, updateSize))
        eventListeners.append(.init(object: self, event: .popstate, history.onPopState))
        eventListeners.append(.init(object: self, event: .online, { self.isOnline = true }))
        eventListeners.append(.init(object: self, event: .offline, { self.isOnline = false }))
        eventListeners.append(.init(object: self, event: .storage, handleStorageEvent))
        $isInForeground.listenOnlyIfChanged { [self] in
            switch $0 {
            case true: notifyEnterForeground()
            case false: notifyEnterBackground()
            }
        }
        #endif
    }
    
    /// `storage` event handler
    private func handleStorageEvent(_ args: [JSValue]) {
        guard let event = args.first else { return }
        if event.object?.storageArea.object == localStorage.domElement.object {
            localStorage.notifyAboutChanges(event)
        } else if event.object?.storageArea.object == sessionStorage.domElement.object {
            sessionStorage.notifyAboutChanges(event)
        }
    }
    
    /// `blur` event handler
    private func handleBlurEvent() {
        guard isActive else { return }
        isActive = false
        notifyResignActive()
    }
    
    /// `focus` event handler
    private func handleFocusEvent() {
        guard !isActive else { return }
        isActive = true
        notifyBecomeActive()
    }
    
    // MARK: Lifecycle Listeners
    
    public func addLifecycleListener(_ listener: WindowLifecycle) {
        finishLaunchingHandlers.append(contentsOf: listener._didFinishLaunching)
        willTerminateHandlers.append(contentsOf: listener._willTerminate)
        becomeActiveHandlers.append(contentsOf: listener._didBecomeActive)
        resignActiveHandlers.append(contentsOf: listener._willResignActive)
        enterBackgroundHandlers.append(contentsOf: listener._didEnterBackground)
        enterForegroundHandlers.append(contentsOf: listener._willEnterForeground)
    }
    
    // MARK: Size
    
    private func updateSize() {
        guard
            let innerWidth = domElement.innerWidth.number,
            let innerHeight = domElement.innerHeight.number,
            let outerWidth = domElement.outerWidth.number,
            let outerHeight = domElement.outerHeight.number
        else { return }
        self.innerSize.width = innerWidth
        self.innerSize.height = innerHeight
        self.outerSize.width = outerWidth
        self.outerSize.height = outerHeight
        self.point.x = domElement.screenLeft.number ?? domElement.screenX.number ?? 0
        self.point.y = domElement.screenTop.number ?? domElement.screenY.number ?? 0
    }
    
    // MARK: Finish Launching

    private var finishLaunchingHandlers: [(() -> Void)] = []
    private func notifyFinishLaunching() {
        finishLaunchingHandlers.forEach { $0() }
    }
    
    public func getComputedStyle(_ element: DOMElement, for key: String) -> String? {
        #if arch(wasm32)
        return domElement.getComputedStyle.function?.callAsFunction(optionalThis: domElement.object, element.domElement)?.object?[key].string
        #else
        return nil
        #endif
    }
    
    /// Called when app just started
    public func onFinishLaunching(_ handler: @escaping () -> Void) -> Self {
        finishLaunchingHandlers.append(handler)
        return self
    }
    
    // MARK: Will Terminate
    
    private var willTerminateHandlers: [(() -> Void)] = []
    private func notifyWillTerminate() {
        willTerminateHandlers.forEach { $0() }
    }
    
    /// Called when app is going to die
    public func onTerminate(_ handler: @escaping () -> Void) -> Self {
        willTerminateHandlers.append(handler)
        return self
    }
    
    // MARK: Become Active
    
    private var becomeActiveHandlers: [(() -> Void)] = []
    private func notifyBecomeActive() {
        becomeActiveHandlers.forEach { $0() }
    }
    
    /// Called when window is active
    public func onBecomeActive(_ handler: @escaping () -> Void) -> Self {
        becomeActiveHandlers.append(handler)
        return self
    }
    
    // MARK: Resign Active

    private var resignActiveHandlers: [(() -> Void)] = []
    private func notifyResignActive() {
        resignActiveHandlers.forEach { $0() }
    }
    
    /// Called when window is not active
    public func onResignActive(_ handler: @escaping () -> Void) -> Self {
        resignActiveHandlers.append(handler)
        return self
    }
    
    // MARK: Enter Background
    
    private var enterBackgroundHandlers: [(() -> Void)] = []
    private func notifyEnterBackground() {
        enterBackgroundHandlers.forEach { $0() }
    }
    
    /// Called when window is going into background, e.g. user switch tab
    public func onEnterBackground(_ handler: @escaping () -> Void) -> Self {
        enterBackgroundHandlers.append(handler)
        return self
    }
    
    // MARK: Enter Foreground

    private var enterForegroundHandlers: [(() -> Void)] = []
    private func notifyEnterForeground() {
        enterForegroundHandlers.forEach { $0() }
    }
    
    /// Called when window is going into foreground, e.g. user switch back to tab with the app
    public func onEnterForeground(_ handler: @escaping () -> Void) -> Self {
        enterForegroundHandlers.append(handler)
        return self
    }

    // MARK: Open URL

    /// The openURL() method opens a new browser window, or a new tab, depending on your browser settings and the parameter values.
    @discardableResult
    public func openURL(
        _ url: URLConformable = "about:blank",
        target: TargetType = .blank,
        options: String = ""
    ) -> JSValue {
        JSObject.global.window.open(url, target.rawValue, options)
    }

    /// The openURL() method opens a new browser window, or a new tab, depending on your browser settings and the parameter values.
    @discardableResult
    public func openURL(
        _ url: URLConformable = "about:blank",
        name: String = "",
        options: String = ""
    ) -> JSValue {
        JSObject.global.window.open(url, name, options)
    }
}
