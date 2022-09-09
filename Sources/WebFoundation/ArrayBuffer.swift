//
//  ArrayBuffer.swift
//  WebFoundation
//
//  Created by Mihael Isaev on 15.03.2021.
//

import JavaScriptKit
import Foundation

/// The `ArrayBuffer` object is used to represent a generic, fixed-length raw binary data buffer.
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/ArrayBuffer)
public final class ArrayBuffer: BufferSource, JSClass, CustomStringConvertible {
    public let jsValue: JSValue
    public static var instanceConstructor: JSFunction { JSObject.global.ArrayBuffer.function! }
    
    public var description: String { "ArrayBuffer(byteLength: \(byteLength)" }
    
    public init (_ jsValue: JSValue) {
        #if DEBUG
        assert(jsValue.isInstanceOf(ArrayBuffer.self), "unable to init ArrayBuffer with `jsValue` of another type")
        #endif
        self.jsValue = jsValue
    }
    
    /// Initializer
    /// - Parameter size: The size, in bytes, of the array buffer to create.
    public init (size: UInt) {
        jsValue = JSObject.global.ArrayBuffer.function?.new(size).jsValue() ?? .undefined
    }
    
    /// This property returns 0 if this `ArrayBuffer` has been detached.
    public var byteLength: UInt {
        UInt(jsValue.byteLength.number ?? 0)
    }
    
    /// Returns a new `ArrayBuffer` whose contents are a copy
    /// of this `ArrayBuffer`'s bytes from `begin`, inclusive, up to `end`, exclusive.
    /// - Parameters:
    ///   - begin: Zero-based byte index at which to begin slicing.
    ///   - end: Byte index before which to end slicing. If end is unspecified, the new ArrayBuffer contains all bytes from begin to the end of this ArrayBuffer. If negative, it will make the Byte index begin from the last Byte.
    /// - Returns: A new ArrayBuffer object.
    public func slice(begin: Int64, end: Int64? = nil) -> ArrayBuffer {
        guard let buffer = jsValue.slice.function?.callAsFunction(this: jsValue.object, begin, end).jsValue() else {
            return .init(size: 0)
        }
        return .init(buffer)
    }
    
    public func array() -> [UInt8] {
        guard let typedArray = JSObject.global.Uint8Array.function?.new(jsValue).jsValue() else { return [] }
        guard let array = JSObject.global.Array.function?.from.function?.callAsFunction(typedArray).array else { return [] }
        return array.map { UInt8($0.number ?? 0) }
    }
    
    public func data() -> Data {
        let bytes = array()
        return Data(bytes: bytes, count: bytes.count)
    }
    
    public func decode<T: Decodable>(as model: T.Type, decoder: JSONDecoder? = nil) throws -> T {
        try (decoder ?? JSONDecoder()).decode(T.self, from: self.data())
    }
}
