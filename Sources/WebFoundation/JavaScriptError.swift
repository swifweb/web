import JavaScriptKit

/// A Swift error that preserves the JavaScript value associated with a rejected
/// promise or a JavaScript-backed bridge failure.
///
/// The underlying JavaScript value is thread-affine. Access jsValue only from
/// the JavaScript execution context that owns it. The textual description is
/// captured when the error is created and can be inspected independently.
public struct JavaScriptError: Error, CustomStringConvertible {
    public nonisolated(unsafe) let jsValue: JSValue
    public let description: String

    package init(_ jsValue: JSValue) {
        self.jsValue = jsValue
        if let error = JSError(from: jsValue) {
            self.description = error.description
        } else {
            self.description = String(describing: jsValue)
        }
    }

    package init(message: String) {
        self.init(JSError(message: message).jsValue)
    }
}
