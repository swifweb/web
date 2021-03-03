//
//  WorkerLocation.swift
//  WorkersAPI
//
//  Created by Mihael Isaev on 01.03.2021.
//

import WebFoundation

public struct WorkerLocation {
    /// The anchor part (#) of a URL
    public let hash: String
    
    /// The hostname and port number of a URL
    public let host: String
    
    /// The hostname of a URL
    public let hostname: String
    
    /// The entire URL
    public let href: String
    
    /// The protocol, hostname and port number of a URL
    public let origin: String
    
    /// The path name of a URL
    public let pathname: String
    
    /// The port number of a URL
    public let port: String
    
    /// The protocol of a URL
    public let `protocol`: String
    
    /// The querystring part of a URL
    public let search: String
    
    public init (_ value: JSValue) {
        hash = value.hash.string ?? ""
        host = value.host.string ?? ""
        hostname = value.hostname.string ?? ""
        href = value.href.string ?? ""
        origin = value.origin.string ?? ""
        pathname = value.pathname.string ?? ""
        port = value.port.string ?? ""
        `protocol` = value.`protocol`.string ?? ""
        search = value.search.string ?? ""
    }
}
