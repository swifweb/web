import WebFoundation

/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/TODO)
public struct TODOCSSValue: CustomStringConvertible, PropertyValueImportantable {
    public let rawValue: String

    public init(_ rawValue: String) {
        self.rawValue = rawValue
    }

    public var description: String {
        rawValue
    }

    public var important: Self {
        .init("\(rawValue) !important")
    }
}
