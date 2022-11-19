//
//  Location.swift
//  LocationAPI
//
//  Created by Mihael Isaev on 17.11.2020.
//

import WebFoundation

private var _shared: Location?

/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/Location)
public final class Location: InnerStateChangeable, Equatable {
    public static var shared: Location {
        guard let shared = _shared else {
            let shared = Location()
            _shared = shared
            return shared
        }
        return shared
    }
    
    /// Name of the element inside DOM
    let domElementName = "location"
    
    /// Reference to DOM-object
    let domElement: JSValue
    
    /// Sets or returns the anchor part (#) of a URL
    @State public private(set) var hash = ""
    
    /// Sets or returns the hostname and port number of a URL
    @State public private(set) var host = ""
    
    /// Sets or returns the hostname of a URL
    @State public private(set) var hostname = ""
    
    /// Sets or returns the entire URL
    @State public private(set) var href = ""
    
    /// Returns the protocol, hostname and port number of a URL
    @State public private(set) var origin = ""
    
    /// Sets or returns the path name of a URL
    @State public private(set) var pathname = ""
    
    /// Sets or returns the port number of a URL
    @State public private(set) var port = ""
    
    /// Sets or returns the protocol of a URL
    @State public private(set) var `protocol` = ""
    
    /// Sets or returns the querystring part of a URL
    @State public private(set) var search = ""
    
    private init () {
        #if arch(wasm32)
        domElement = JSObject.global[domElementName]
        #else
        domElement = JSValue("")
        #endif
        update()
        innerStatesListen()
    }
    
    public init(original: Location) {
        domElement = original.domElement
        hash = original.hash
        host = original.host
        hostname = original.hostname
        href = original.href
        origin = original.origin
        pathname = original.pathname
        port = original.port
        `protocol` = original.`protocol`
        search = original.search
    }
    
    public func update() {
        innerStatesManualUpdateStarted()
        #if arch(wasm32)
        hash = domElement.hash.string ?? ""
        host = domElement.host.string ?? ""
        hostname = domElement.hostname.string ?? ""
        href = domElement.href.string ?? ""
        origin = domElement.origin.string ?? ""
        pathname = domElement.pathname.string ?? ""
        port = domElement.port.string ?? ""
        `protocol` = domElement.protocol.string ?? ""
        search = domElement.search.string ?? ""
        #endif
        innerStatesManualUpdateFinished()
    }
    
    /// Loads a new document
    public func assign() {
        domElement.assign.function!.callAsFunction(optionalThis: domElement.object)
    }
    
    /// Reloads the current document
    public func reload() {
        domElement.reload.function!.callAsFunction(optionalThis: domElement.object)
    }
    
    /// Replaces the current document with a new one
    public func replace() {
        domElement.replace.function!.callAsFunction(optionalThis: domElement.object)
    }
    
    // MARK: InnerStateChangeable
    
    public lazy var innerStatePrevSelf: Location = copy
    public lazy var innerStates: [AnyState] = [_hash, _host, _hostname, _href, _origin, _pathname, _port, _protocol, _search]
    public var innerStateManualUpdating: Bool = false
    
    public var innerStateChanged: (Location, Location) -> Void = { _,_ in }
    
    // MARK: Equatable
    
    public static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.hash == rhs.hash
            && lhs.host == rhs.host
            && lhs.hostname == rhs.hostname
            && lhs.href == rhs.href
            && lhs.origin == rhs.origin
            && lhs.pathname == rhs.pathname
            && lhs.port == rhs.port
            && lhs.protocol == rhs.protocol
            && lhs.search == rhs.search
    }
}
