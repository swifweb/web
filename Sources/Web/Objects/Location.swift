//
//  Location.swift
//  
//
//  Created by Mihael Isaev on 17.11.2020.
//

import Foundation
import JavaScriptKit

public final class Location: StateChangeable, Equatable {
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
    
    init () {
        #if arch(wasm32)
        domElement = JSObject.global[domElementName]
        #else
        domElement = JSValue("")
        #endif
        update()
        listenStates()
    }
    
    init(original: Location) {
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
    
    func update() {
        manualUpdateStarted()
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
        manualUpdateFinished()
    }
    
    /// Loads a new document
    public func assign() {
        domElement.assign.function!.callAsFunction(this: domElement.object)
    }
    
    /// Reloads the current document
    public func reload() {
        domElement.reload.function!.callAsFunction(this: domElement.object)
    }
    
    /// Replaces the current document with a new one
    public func replace() {
        domElement.replace.function!.callAsFunction(this: domElement.object)
    }
    
    // MARK: StateChangeable
    
    lazy var prevSelf: Location = copy
    lazy var states: [AnyState] = [_hash, _host, _hostname, _href, _origin, _pathname, _port, _protocol, _search]
    var manualUpdating: Bool = false
    
    var changed: (Location, Location) -> Void = { _,_ in }
    
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
