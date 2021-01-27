//
//  Navigator.swift
//  
//
//  Created by Mihael Isaev on 17.11.2020.
//

import Foundation
import JavaScriptKit

public final class Navigator: StateChangeable, Equatable {
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
    @State public internal(set) var onLine = false
    
    /// Returns for which platform the browser is compiled
    public let platform: String
    
    /// Returns the engine name of the browser
    public let product: String
    
    /// Returns the user-agent header sent by the browser to the server
    public let userAgent: String
    
    init () {
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
        listenStates()
    }
    
    init(original: Navigator) {
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
        manualUpdateStarted()
//        geolocation
        #if arch(wasm32)
        onLine = domElement.onLine.boolean ?? false
        #endif
        manualUpdateFinished()
    }
    
    // MARK: StateChangeable
    
    lazy var prevSelf: Navigator = copy
    lazy var states: [AnyState] = [_geolocation, _onLine]
    var manualUpdating: Bool = false
    
    var changed: (Navigator, Navigator) -> Void = { _,_ in }
    
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
