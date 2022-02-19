//
//  XMLHttpRequestUpload.swift
//  XMLHttpRequest
//
//  Created by Mihael Isaev on 21.03.2021.
//

import WebFoundation
import Events

/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest/upload)
public class XMLHttpRequestUpload: XMLHttpRequestEventTarget {
    public let jsValue: JSValue
    
    public lazy var storage: Storage = .init()
    
    init (_ jsValue: JSValue) {
        self.jsValue = jsValue
    }
    
    var loadStartClosures: [JSClosure] = []
    var progressClosures: [JSClosure] = []
    var abortClosures: [JSClosure] = []
    var errorClosures: [JSClosure] = []
    var loadClosures: [JSClosure] = []
    var timeoutClosures: [JSClosure] = []
    var loadEndClosures: [JSClosure] = []
}
