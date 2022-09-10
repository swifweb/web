//
//  XMLHttpRequest.swift
//  XMLHttpRequest
//
//  Created by Mihael Isaev on 20.03.2021.
//

import WebFoundation
import Foundation
import Events

public final class XMLHttpRequest: _XMLHttpRequestEventTarget {
	public var jsValue: JSValue
	var _isForUploading = false
	
    public lazy var storage: Storage = .init()
    
    /// The constructor initializes an `XMLHttpRequest`.
    ///
    /// It must be called before any other method calls.
	///
	/// Set `uploading`to `true` in order to have correct `progress` events.
	public init (uploading: Bool = false) {
		jsValue = JSObject.global.XMLHttpRequest.function?.new().jsValue().upload ?? .undefined
		_isForUploading = uploading
    }
	
	init (_ value: JSValue, uploading: Bool = false) {
		jsValue = value
		_isForUploading = uploading
	}
    
    public var readyState: ReadyState {
        ReadyState(rawValue: Int(jsValue.readyState.number ?? -1)) ?? .unknown
    }
    
    /// An EventHandler that is called whenever the readyState attribute changes.
    @discardableResult
    public func onReadyStateChange(_ closure: @escaping (ReadyState) -> Void) -> Self {
        let jsClosure = JSClosure  { args in
            closure(self.readyState)
            return JSValue.undefined
        }
        readyStateChangeClosures.append(jsClosure)
        jsValue.addEventListener.function?.callAsFunction(this: jsValue.object, "readystatechange", jsClosure)
        return self
    }
    
    /// Is an enumerated value that defines the response type.
    public var responseType: ResponseType {
        get { ResponseType(rawValue: jsValue.responseType.string ?? "") ?? .default }
        set { jsValue.responseType = newValue.rawValue.jsValue() }
    }
    
    /// Contains the response entity body.
    public var response: Response {
        switch responseType {
        case .arrayBuffer: return .arrayBuffer(.init(jsValue.response))
        case .blob: return .blob(.init(jsValue.response))
        case .default, .text: return .text(jsValue.response.string ?? "")
        case .document: return .document(jsValue.response)
        case .json: return .json(jsValue.response)
        }
    }
    
    /// Contains the response to the request as text, or null if the request was unsuccessful or has not yet been sent.
    public var responseText: String? {
        jsValue.responseText.string
    }
    
    /// The serialized URL of the response or the empty string if the URL is null.
    public var responseURL: String? {
        jsValue.responseURL.string
    }
    
    /// Returns a `Document` containing the response to the request,
    /// or null if the request was unsuccessful, has not yet been sent, or cannot be parsed as XML or HTML.
    ///
    /// Not available in workers.
    public var responseXML: JSValue? {
        let xml = jsValue.responseXML.jsValue()
        guard !xml.isNull else { return nil }
        return xml
    }
    
    /// The status of the response of the request.
    public var status: Int {
        Int(jsValue.status.number ?? -1)
    }
    
    /// Returns a String containing the response string returned by the HTTP server.
    /// Unlike `status`, this includes the entire text of the response message ("200 OK", for example).
    public var statusText: String {
        jsValue.statusText.string ?? ""
    }
    
    /// Representing the number of milliseconds a request can take before automatically being terminated.
    public var timeout: TimeInterval {
        jsValue.timeout.number ?? 0
    }
    
    /// Set request timeout
    /// - Parameter time: Time interval in seconds
    public func setTimeout(_ time: TimeInterval) -> Self {
        jsValue.timeout = (time / 1_000).jsValue()
        return self
    }
	
	/// Representing the upload process.
	///
	/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest/upload)
	public var upload: XMLHttpRequest {
		_isForUploading ? self : .init(jsValue.upload, uploading: true)
	}
    
    private var readyStateChangeClosures: [JSClosure] = []
    var loadStartClosures: [JSClosure] = []
    var progressClosures: [JSClosure] = []
    var abortClosures: [JSClosure] = []
    var errorClosures: [JSClosure] = []
    var loadClosures: [JSClosure] = []
    var timeoutClosures: [JSClosure] = []
    var loadEndClosures: [JSClosure] = []
    
    /// Indicates whether or not cross-site `Access-Control` requests should be made using credentials such as cookies or authorization headers.
    public var withCredentials: Bool {
        jsValue.withCredentials.boolean ?? false
    }
    
    /// Aborts the request if it has already been sent.
    public func abort() {
        jsValue.abort.function?.callAsFunction(this: jsValue.object)
    }
    
    /// Returns all the response headers, separated by CRLF, as a string, or null if no response has been received.
    public func getAllResponseHeaders() -> String {
        jsValue.getAllResponseHeaders.function?.callAsFunction(this: jsValue.object).string ?? ""
    }
    
    /// Returns the string containing the text of the specified header,
    /// or null if either the response has not yet been received or the header doesn't exist in the response.
    public func getResponseHeader(_ headerName: String) -> String? {
        jsValue.getResponseHeader.function?.callAsFunction(this: jsValue.object, headerName).string
    }
    
    /// Initializes a request.
    /// - Parameters:
    ///   - method: The HTTP request method to use, such as "GET", "POST", "PUT", "DELETE", etc.
    ///   - url: Кepresenting the URL to send the request to.
    ///   - user: The optional user name to use for authentication purposes; by default, this is the `null` value.
    ///   - password: The optional password to use for authentication purposes; by default, this is the `null` value.
    @discardableResult
    public func open(method: String, url: URLValue, user: String? = nil, password: String? = nil) -> Self {
        jsValue.open.function?.callAsFunction(this: jsValue.object, method, url.urlValue, true, user, password)
        return self
    }
    
    /// Overrides the MIME type returned by the server.
    @discardableResult
    public func overrideMimeType(_ mimeType: String) -> Self {
        jsValue.overrideMimeType.function?.callAsFunction(this: jsValue.object, mimeType)
        return self
    }
    
    /// Sends the request.
    @discardableResult
    public func send(_ body: Blob) -> Self {
        jsValue.send.function?.callAsFunction(this: jsValue.object, body.jsValue)
        return self
    }
    
    /// Sends the request.
    @discardableResult
    public func send(_ body: BufferSource) -> Self {
        jsValue.send.function?.callAsFunction(this: jsValue.object, body.jsValue)
        return self
    }
    
    /// Sends the request.
    @discardableResult
    public func send(_ body: FormData) -> Self {
        jsValue.send.function?.callAsFunction(this: jsValue.object, body.jsValue)
        return self
    }
    
    /// Sends the request.
    @discardableResult
    public func send(_ body: String? = nil) -> Self {
        jsValue.send.function?.callAsFunction(this: jsValue.object, body)
        return self
    }
    
    /// Sets the value of an HTTP request header.
    ///
    /// You must call `setRequestHeader()` after `open()`, but before `send()`.
    @discardableResult
    public func setRequestHeader(_ name: String, _ value: String) -> Self {
        jsValue.setRequestHeader.function?.callAsFunction(this: jsValue.object, name, value)
        return self
    }
}
