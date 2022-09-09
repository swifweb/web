//
//  Blob.swift
//  WebFoundation
//
//  Created by Mihael Isaev on 24.02.2021.
//

import JavaScriptKit

/// [More info →](https://developer.mozilla.org/en-US/docs/Web/API/Blob)
public class Blob: JSClass, CustomStringConvertible {
    public let jsValue: JSValue
    public static var instanceConstructor: JSFunction { JSObject.global.Blob.function! }
    
    public var description: String { "Blob(size: \(size)" }
    
    /// The size, in bytes, of the data contained in the Blob object.
    public var size: Int64 {
        Int64(jsValue.size.number ?? 0)
    }
    
    /// A string indicating the MIME type of the data contained in the Blob.
    /// If the type is unknown, this string is empty.
    public var type: String {
        jsValue.type.string ?? ""
    }
    
    public init (_ jsValue: JSValue) {
        #if DEBUG
        assert(jsValue.isInstanceOf(Blob.self), "unable to init Blob with `jsValue` of another type")
        #endif
        self.jsValue = jsValue
    }
    
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/Blob/Blob)
    public init(_ arrayBuffer: ArrayBuffer, _ options: BlobPropertyBag? = nil) {
        self.jsValue = JSObject.global.Blob.function?.new([arrayBuffer.jsValue], options).jsValue() ?? .undefined
    }
    
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/Blob/Blob)
    public init(_ arrayBufferView: [UInt8], _ options: BlobPropertyBag? = nil) {
        self.jsValue = JSObject.global.Blob.function?.new([arrayBufferView.jsValue], options).jsValue() ?? .undefined
    }
    
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/Blob/Blob)
    public init(_ blob: Blob, _ options: BlobPropertyBag? = nil) {
        self.jsValue = JSObject.global.Blob.function?.new([blob.jsValue], options).jsValue() ?? .undefined
    }
    
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/Blob/Blob)
    public init(_ string: String, _ options: BlobPropertyBag? = nil) {
        self.jsValue = JSObject.global.Blob.function?.new([string], options).jsValue() ?? .undefined
    }
    
    /// Returns a new Blob object containing the data in the specified range of bytes of the blob on which it's called.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/Blob/slice)
    ///
    /// - Parameters:
    ///   - start: An index into the `Blob` indicating the first byte to include in the new `Blob`.
    ///   If you specify a negative value, it's treated as an offset from the end of the `Blob` toward the beginning.
    ///   For example, `-10` would be the 10th from last byte in the `Blob`.
    ///   The default value is `0`.
    ///   If you specify a value for start that is larger than the size of the source `Blob`,
    ///   the returned `Blob` has size `0` and contains no data.
    ///
    ///   - end: An index into the `Blob` indicating the first byte that will *not* be included in the new `Blob`
    ///   (i.e. the byte exactly at this index is not included). If you specify a negative value, it's treated as an offset
    ///   from the end of the `Blob` toward the beginning. For example, `-10` would be the 10th from last byte in the `Blob`.
    ///   The default value is size.
    ///
    ///   - contentType: The content type to assign to the new `Blob`
    ///   This will be the value of its `type` property.
    ///   The default value is an empty string.
    ///
    /// - Returns: A new `Blob` object containing the specified subset of the data
    /// contained within the blob on which this method was called. The original blob is not altered.
    public func slice(start: Int64? = nil, end: Int64? = nil, contentType: String? = nil) -> Blob? {
        guard let newBlob = jsValue.slice.function?.callAsFunction(this: jsValue.object, start, end, contentType) else { return nil }
        return .init(newBlob)
    }

    /// Returns a `String` containing the entire contents of the `Blob`.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/Blob/text)
    public func text(_ closure: @escaping (Result<String, Error>) -> Void) {
        guard let promise = jsValue.text.function?.callAsFunction(this: jsValue.object).object else { return }
        JSPromise(promise)?.then(success: { value in
            closure(.success(value.string ?? ""))
            return JSValue.undefined
        }, failure: { error in
            closure(.failure(error))
            return JSValue.undefined
        })
    }
    
    /// Returns a promise that resolves with an `ArrayBuffer` containing the entire contents of the `Blob` as binary data.s
    public func arrayBuffer(_ closure: @escaping (Result<ArrayBuffer, Error>) -> Void) {
        guard let promise = jsValue.arrayBuffer.function?.callAsFunction(this: jsValue.object).object else { return }
        JSPromise(promise)?.then(success: { value in
            closure(.success(ArrayBuffer(value)))
            return JSValue.undefined
        }, failure: { error in
            closure(.failure(error))
            return JSValue.undefined
        })
    }
}
