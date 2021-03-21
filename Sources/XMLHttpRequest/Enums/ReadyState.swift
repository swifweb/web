//
//  ReadyState.swift
//  XMLHttpRequest
//
//  Created by Mihael Isaev on 21.03.2021.
//

public enum ReadyState: Int {
    case unknown = -1
    
    /// Client has been created. open() not called yet.
    case unsent = 0
    
    /// open() has been called.
    case opened = 1
    
    /// send() has been called, and headers and status are available.
    case headersReceived = 2
    
    /// Downloading; responseText holds partial data.
    case loading = 3
    
    /// The operation is complete.
    case done = 4
}
