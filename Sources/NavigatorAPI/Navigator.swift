//
//  Navigator.swift
//  Navigator
//
//  Created by Mihael Isaev on 17.11.2020.
//

import WebFoundation

private var _shared: Navigator?

/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/Navigator)
public final class Navigator: InnerStateChangeable, Equatable {
    public static var shared: Navigator {
        guard let shared = _shared else {
            let shared = Navigator()
            _shared = shared
            return shared
        }
        return shared
    }
    
    /// Name of the element inside DOM
    let domElementName = "navigator"
    
    /// Reference to DOM-object
    let domElement: JSValue
    
    /// Returns the code name of the browser
    public let appCodeName: String
    
    /// Returns the name of the browser
    public let appName: String
    
    /// Returns the version information of the browser
    public let appVersion: String
    
    /// Determines whether cookies are enabled in the browser
    public let cookieEnabled: Bool
    
    /// Returns a Geolocation object that can be used to locate the user's position
    @State public internal(set) var geolocation: NavigatorGeolocation? = nil
    
    /// Returns the language of the browser
    public let language: String
    
    /// Determines whether the browser is online
    @State public var onLine = false
    
    /// Returns for which platform the browser is compiled
    public let platform: String
    
    /// Returns the engine name of the browser
    public let product: String
    
    /// Returns the user-agent header sent by the browser to the server
    public let userAgent: String
    
    private init () {
        #if arch(wasm32)
        domElement = JSObject.global[domElementName]
        appCodeName = domElement.appCodeName.string ?? ""
        appName = domElement.appName.string ?? ""
        appVersion = domElement.appVersion.string ?? ""
        cookieEnabled = domElement.cookieEnabled.boolean ?? false
        language = domElement.language.string ?? ""
        platform = domElement.platform.string ?? ""
        product = domElement.product.string ?? ""
        userAgent = domElement.userAgent.string ?? ""
        #else
        domElement = JSValue("")
        appCodeName = ""
        appName = ""
        appVersion = ""
        cookieEnabled = false
        language = ""
        platform = ""
        product = ""
        userAgent = ""
        #endif
        update()
        innerStatesListen()
    }
    
    public init(original: Navigator) {
        domElement = original.domElement
        appCodeName = original.appCodeName
        appName = original.appName
        appVersion = original.appVersion
        cookieEnabled = original.cookieEnabled
        language = original.language
        platform = original.platform
        product = original.product
        userAgent = original.userAgent
        geolocation = original.geolocation
        onLine = original.onLine
    }
    
    private func update() {
        innerStatesManualUpdateStarted()
//        geolocation
        #if arch(wasm32)
        onLine = domElement.onLine.boolean ?? false
        #endif
        innerStatesManualUpdateFinished()
    }
    
    // MARK: InnerStateChangeable
    
    public lazy var innerStatePrevSelf: Navigator = copy
    public lazy var innerStates: [AnyState] = [_geolocation, _onLine]
    public var innerStateManualUpdating: Bool = false
    
    public var innerStateChanged: (Navigator, Navigator) -> Void = { _,_ in }
    
    // MARK: Equatable
    
    public static func == (lhs: Navigator, rhs: Navigator) -> Bool {
        lhs.appCodeName == rhs.appCodeName
            && lhs.appName == rhs.appName
            && lhs.appVersion == rhs.appVersion
            && lhs.cookieEnabled == rhs.cookieEnabled
            && lhs.language == rhs.language
            && lhs.platform == rhs.platform
            && lhs.product == rhs.product
            && lhs.userAgent == rhs.userAgent
            && lhs.geolocation == rhs.geolocation
            && lhs.onLine == rhs.onLine
    }
}
