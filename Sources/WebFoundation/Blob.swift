//
//  Blob.swift
//  WebFoundation
//
//  Created by Mihael Isaev on 24.02.2021.
//

import JavaScriptKit

/// [More info →](https://developer.mozilla.org/en-US/docs/Web/API/Blob)
public class Blob {
    let object: JSValue
    
    /// The size, in bytes, of the data contained in the Blob object.
    public let size: Int
    
    /// A string indicating the MIME type of the data contained in the Blob.
    /// If the type is unknown, this string is empty.
    public let type: String
    
//    /// Returns a promise that resolves with an ArrayBuffer containing the entire contents of the Blob as binary data.
//    public func arrayBuffer() {}
//
//    /// Returns a new Blob object containing the data in the specified range of bytes of the blob on which it's called.
//    public func slice() {}
//
//    /// Returns a ReadableStream that can be used to read the contents of the Blob.
//    public func stream() {}
//
//    /// Returns a promise that resolves with a USVString containing the entire contents of the Blob interpreted as UTF-8 text.
//    public func text() {}
    
    init (_ object: JSValue) {
        self.object = object
        size = Int(object.size.number ?? 0)
        type = object.type.string ?? ""
    }
}
