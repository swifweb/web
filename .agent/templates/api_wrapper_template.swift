import WebFoundation

/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/TODO)
public final class TODOAPIWrapper {
    private let jsValue: JSValue

    public init(_ jsValue: JSValue) {
        self.jsValue = jsValue
    }

    public static var shared: Self {
        #if arch(wasm32)
        return .init(JSObject.global.TODO)
        #else
        return .init(.undefined)
        #endif
    }

    public var exampleString: String {
        #if arch(wasm32)
        return jsValue.example.string ?? ""
        #else
        return ""
        #endif
    }
}
