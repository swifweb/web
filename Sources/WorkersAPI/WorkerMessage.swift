//
//  File.swift
//  
//
//  Created by Mihael Isaev on 01.03.2021.
//

import Foundation

public protocol WebWorkerAnyEvent: Codable {
    var event: String { get }
}

public struct WebWorkerEventPrototype: WebWorkerAnyEvent {
    public let event: String
    
    init (_ event: String) {
        self.event = event
    }
}

public struct WebWorkerEvent<P: Codable>: WebWorkerAnyEvent {
    public let event: String
    public let payload: P
    
    init (_ event: String, _ payload: P) {
        self.event = event
        self.payload = payload
    }
}

/// Event identifier
public final class WebWorkerEID<P: Codable>: WebWorkerAnyEvent, ExpressibleByStringLiteral {
    public let event: String
    
    public init(stringLiteral value: StringLiteralType) {
        event = value
    }
}
