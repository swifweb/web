//
//  XMLHttpRequestEventTarget.swift
//  XMLHttpRequest
//
//  Created by Mihael Isaev on 20.03.2021.
//

import WebFoundation
import Events

/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequestEventTarget)
public protocol XMLHttpRequestEventTarget: EventTarget {
    /// Contains the function to call when a request is aborted and the abort event is received by this object.
    func onAbort(_ closure: @escaping () -> Void) -> Self
    
    /// Contains the function to call when a request is aborted and the abort event is received by this object.
    func onAbort(_ closure: @escaping (JSValue) -> Void) -> Self

    /// Contains the function to call when a request encounters an error and the error event is received by this object.
    func onError(_ closure: @escaping () -> Void) -> Self
    
    /// Contains the function to call when a request encounters an error and the error event is received by this object.
    func onError(_ closure: @escaping (JSValue) -> Void) -> Self

    /// Contains the function to call when an HTTP request returns after successfully fetching content and the load event is received by this object.
    func onLoad(_ closure: @escaping () -> Void) -> Self
    
    /// Contains the function to call when an HTTP request returns after successfully fetching content and the load event is received by this object.
    func onLoad(_ closure: @escaping (ProgressEvent) -> Void) -> Self

    /// Contains the function that gets called when the HTTP request first begins loading data and the loadstart event is received by this object.
    func onLoadStart(_ closure: @escaping () -> Void) -> Self
    
    /// Contains the function that gets called when the HTTP request first begins loading data and the loadstart event is received by this object.
    func onLoadStart(_ closure: @escaping (ProgressEvent) -> Void) -> Self

    /// Contains the function that is called periodically with information about the progress of the request and the progress event is received by this object.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequestEventTarget/onprogress)
    func onProgress(_ closure: @escaping (ProgressEvent) -> Void) -> Self

    /// Contains the function that is called if the event times out and the timeout event is received by this object.
    /// This only happens if a timeout has been previously established by setting the value of the XMLHttpRequest object's timeout attribute.
    func onTimeout(_ closure: @escaping () -> Void) -> Self
    
    /// Contains the function that is called if the event times out and the timeout event is received by this object.
    /// This only happens if a timeout has been previously established by setting the value of the XMLHttpRequest object's timeout attribute.
    func onTimeout(_ closure: @escaping (JSValue) -> Void) -> Self

    /// Contains the function that is called when the load is completed, even if the request failed, and the loadend event is received by this object.
    func onLoadEnd(_ closure: @escaping () -> Void) -> Self
    
    /// Contains the function that is called when the load is completed, even if the request failed, and the loadend event is received by this object.
    func onLoadEnd(_ closure: @escaping (JSValue) -> Void) -> Self
}

protocol _XMLHttpRequestEventTarget: XMLHttpRequestEventTarget {
    var jsValue: JSValue { get set }
	var _isForUploading: Bool { get }
    
    var loadStartClosures: [JSClosure] { get set }
    var progressClosures: [JSClosure] { get set }
    var abortClosures: [JSClosure] { get set }
    var errorClosures: [JSClosure] { get set }
    var loadClosures: [JSClosure] { get set }
    var timeoutClosures: [JSClosure] { get set }
    var loadEndClosures: [JSClosure] { get set }
}

extension XMLHttpRequestEventTarget {
    var s: _XMLHttpRequestEventTarget? { self as? _XMLHttpRequestEventTarget }
    
    @discardableResult
    public func onAbort(_ closure: @escaping () -> Void) -> Self {
        onAbort { _ in closure() }
    }

    @discardableResult
    public func onAbort(_ closure: @escaping (JSValue) -> Void) -> Self {
        let jsClosure = JSClosure  { args in
            if let event = args.first {
                closure(event)
            }
            return JSValue.undefined
        }
        s?.abortClosures.append(jsClosure)
		(s?._isForUploading == true ? s?.jsValue.upload : s?.jsValue)?.addEventListener.function?.callAsFunction(this: jsValue.object, "abort", jsClosure)
        return self
    }
    
    @discardableResult
    public func onError(_ closure: @escaping () -> Void) -> Self {
        onError { _ in closure() }
    }

    @discardableResult
    public func onError(_ closure: @escaping (JSValue) -> Void) -> Self {
        let jsClosure = JSClosure  { args in
            if let event = args.first {
                closure(event)
            }
            return JSValue.undefined
        }
        s?.errorClosures.append(jsClosure)
		(s?._isForUploading == true ? s?.jsValue.upload : s?.jsValue)?.addEventListener.function?.callAsFunction(this: jsValue.object, "error", jsClosure)
        return self
    }
    
    @discardableResult
    public func onLoad(_ closure: @escaping () -> Void) -> Self {
        onLoad { _ in closure() }
    }

    @discardableResult
    public func onLoad(_ closure: @escaping (ProgressEvent) -> Void) -> Self {
        let jsClosure = JSClosure  { args in
            if let event = args.first {
				closure(.init(event))
            }
            return JSValue.undefined
        }
        s?.loadClosures.append(jsClosure)
		(s?._isForUploading == true ? s?.jsValue.upload : s?.jsValue)?.addEventListener.function?.callAsFunction(this: jsValue.object, "load", jsClosure)
        return self
    }
    
    @discardableResult
    public func onLoadStart(_ closure: @escaping () -> Void) -> Self {
        onLoadStart { _ in closure() }
    }
    
    @discardableResult
    public func onLoadStart(_ closure: @escaping (ProgressEvent) -> Void) -> Self {
        let jsClosure = JSClosure  { args in
            if let event = args.first {
				closure(.init(event))
            }
            return JSValue.undefined
        }
        s?.loadStartClosures.append(jsClosure)
		(s?._isForUploading == true ? s?.jsValue.upload : s?.jsValue)?.addEventListener.function?.callAsFunction(this: jsValue.object, "loadstart", jsClosure)
        return self
    }
    
    /// An event listener to be called when the connection is closed.
    @discardableResult
    public func onProgress(_ closure: @escaping (ProgressEvent) -> Void) -> Self {
        let jsClosure = JSClosure  { args in
            if let event = args.first {
                closure(.init(event))
            }
            return JSValue.undefined
        }
        s?.progressClosures.append(jsClosure)
		(s?._isForUploading == true ? s?.jsValue.upload : s?.jsValue)?.addEventListener.function?.callAsFunction(this: jsValue.object, "progress", jsClosure)
        return self
    }
    
    @discardableResult
    public func onTimeout(_ closure: @escaping () -> Void) -> Self {
        onTimeout { _ in closure() }
    }

    @discardableResult
    public func onTimeout(_ closure: @escaping (JSValue) -> Void) -> Self {
        let jsClosure = JSClosure  { args in
            if let event = args.first {
                closure(event)
            }
            return JSValue.undefined
        }
        s?.timeoutClosures.append(jsClosure)
		(s?._isForUploading == true ? s?.jsValue.upload : s?.jsValue)?.addEventListener.function?.callAsFunction(this: jsValue.object, "timeout", jsClosure)
        return self
    }
    
    @discardableResult
    public func onLoadEnd(_ closure: @escaping () -> Void) -> Self {
        onLoadEnd { _ in closure() }
    }

    @discardableResult
    public func onLoadEnd(_ closure: @escaping (JSValue) -> Void) -> Self {
        let jsClosure = JSClosure  { args in
            if let event = args.first {
                closure(event)
            }
            return JSValue.undefined
        }
        s?.loadEndClosures.append(jsClosure)
		(s?._isForUploading == true ? s?.jsValue.upload : s?.jsValue)?.addEventListener.function?.callAsFunction(this: jsValue.object, "loadend", jsClosure)
        return self
    }
}
