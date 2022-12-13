//
//  WebSocket.swift
//  WebSocketAPI
//
//  Created by Mihael Isaev on 20.03.2021.
//

import WebFoundation
import Events

public class WebSocket {
    var jsValue: JSValue
    
    /// Initializer
    ///
    /// - Parameters:
    ///   - url: The URL to which to connect; this should be the URL to which the WebSocket server will respond.
    ///   - protocols: Either a single protocol string or an array of protocol strings.
    ///   These strings are used to indicate sub-protocols, so that a single server can implement multiple WebSocket sub-protocols
    ///   (for example, you might want one server to be able to handle different types of interactions depending on the specified protocol).
    public init (_ url: URLValue, protocols: [String]) {
        jsValue = JSObject.global.WebSocket.function?.new(url.urlValue, protocols.jsValue).jsValue ?? .undefined
    }
    
    /// Initializer
    ///
    /// - Parameters:
    ///   - url: The URL to which to connect; this should be the URL to which the WebSocket server will respond.
    ///   - protocols: Either a single protocol string or an array of protocol strings.
    ///   These strings are used to indicate sub-protocols, so that a single server can implement multiple WebSocket sub-protocols
    ///   (for example, you might want one server to be able to handle different types of interactions depending on the specified protocol).
    public convenience init (_ url: URLValue, protocols: String...) {
        self.init(url, protocols: protocols)
    }
    
    /// The binary data type used by the connection.
    public var binaryType: BinaryType {
        get { jsValue.binaryType.string == "arrayBuffer" ? .arrayBuffer : .blob }
        set { jsValue.binaryType = newValue.rawValue.jsValue } // FUTUREFIX: 'arrayBuffer' is not a valid value for binaryType; binaryType remains unchanged.
    }
    
    /// The number of bytes of queued data.
    public var bufferedAmount: Int64 {
		Int64(jsValue.bufferedAmount.number ?? 0)
    }
    
    /// The extensions selected by the server.
    public var extensions: String {
        jsValue.extensions.string ?? ""
    }
    
    deinit {
        #if JAVASCRIPTKIT_WITHOUT_WEAKREFS
        closeClosures.forEach { $0.release() }
        errorClosures.forEach { $0.release() }
        messageClosures.forEach { $0.release() }
        openClosures.forEach { $0.release() }
        #endif
    }
    
    private var closeClosures: [JSClosure] = []
    
    /// An event listener to be called when the connection is closed.
    @discardableResult
    public func onClose(_ closure: @escaping () -> Void) -> Self {
        onClose { _ in closure() }
    }

    /// An event listener to be called when the connection is closed.
    @discardableResult
    public func onClose(_ closure: @escaping (CloseEvent) -> Void) -> Self {
        let jsClosure = JSClosure  { args in
            if let event = args.first {
                closure(.init(event))
            }
            return JSValue.undefined
        }
        closeClosures.append(jsClosure)
        jsValue.addEventListener.function?.callAsFunction(optionalThis: jsValue.object, "close", jsClosure)
        return self
    }
    
    private var errorClosures: [JSClosure] = []
    
    /// An event listener to be called when an error occurs.
    @discardableResult
    public func onError(_ closure: @escaping () -> Void) -> Self {
        onError { _ in closure() }
    }

    /// An event listener to be called when an error occurs.
    @discardableResult
    public func onError(_ closure: @escaping (JSValue) -> Void) -> Self {
        let jsClosure = JSClosure  { args in
            if let event = args.first {
                closure(event)
            }
            return JSValue.undefined
        }
        errorClosures.append(jsClosure)
        jsValue.addEventListener.function?.callAsFunction(optionalThis: jsValue.object, "error", jsClosure)
        
        return self
    }
    
    private var messageClosures: [JSClosure] = []

    /// An event listener to be called when a message is received from the server.
    @discardableResult
    public func onMessage(_ closure: @escaping (MessageEvent) -> Void) -> Self {
        let jsClosure = JSClosure  { args in
            if let event = args.first {
                closure(.init(event))
            }
            return JSValue.undefined
        }
        messageClosures.append(jsClosure)
        jsValue.addEventListener.function?.callAsFunction(optionalThis: jsValue.object, "message", jsClosure)
        return self
    }
    
    private var openClosures: [JSClosure] = []

    /// An event listener to be called when the connection is opened.
    @discardableResult
    public func onOpen(_ closure: @escaping () -> Void) -> Self {
        onOpen { _ in closure() }
    }
    
    /// An event listener to be called when the connection is opened.
    @discardableResult
    public func onOpen(_ closure: @escaping (Event) -> Void) -> Self {
        let jsClosure = JSClosure  { args in
            if let event = args.first {
                closure(.init(event))
            }
            return JSValue.undefined
        }
        openClosures.append(jsClosure)
        jsValue.addEventListener.function?.callAsFunction(optionalThis: jsValue.object, "open", jsClosure)
        return self
    }
    
    /// The sub-protocol selected by the server.
    public var `protocol`: String {
        jsValue.protocol.string ?? ""
    }
    
    /// The current state of the connection.
    public var readyState: WebSocketState {
        WebSocketState(rawValue: Int(jsValue.readyState.number ?? -1)) ?? .closed
    }
    
    /// The absolute URL of the WebSocket.
    public var url: String {
        jsValue.url.string ?? ""
    }
    
    /// Closes the connection.
    public func close(_ code: Int? = nil, _ reason: String? = nil) {
        var args: [ConvertibleToJSValue] = []
        if let code = code {
            args.append(code)
        }
        if let reason = reason {
            args.append(reason)
        }
        jsValue.close.function?.callAsFunction(optionalThis: jsValue.object, arguments: args)
    }
    
    /// Enqueues data to be transmitted.
    public func send(_ data: String) {
        jsValue.send.function?.callAsFunction(optionalThis: jsValue.object, data)
    }
    
    /// Enqueues data to be transmitted.
    public func send(_ data: Blob) {
        jsValue.send.function?.callAsFunction(optionalThis: jsValue.object, data.jsValue)
    }
    
    /// Enqueues data to be transmitted.
    public func send(_ data: ArrayBuffer) {
        jsValue.send.function?.callAsFunction(optionalThis: jsValue.object, data.jsValue)
    }
}
