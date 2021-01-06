//
//  BackgroundAttachmentProperty.swift
//  WasmApp
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// Sets whether a background image scrolls with the rest of the page, or is fixed
///
/// ```html
/// background-attachment: fixed;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_background-attachment.asp)
public class BackgroundAttachmentProperty: _Property {
    public var propertyKey: PropertyKey<BackgroundAttachmentType> { .backgroundAttachment }
    public var propertyValue: BackgroundAttachmentType
    var _content = _PropertyContent<BackgroundAttachmentType>()
    
    public init (_ type: BackgroundAttachmentType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<BackgroundAttachmentType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, BackgroundAttachmentType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Sets whether a background image scrolls with the rest of the page, or is fixed
    public static var backgroundAttachment: PropertyKey<BackgroundAttachmentType> { "background-attachment".propertyKey() }
}

extension Stylesheet {
    /// Sets whether a background image scrolls with the rest of the page, or is fixed
    public typealias BackgroundAttachment = BackgroundAttachmentProperty
}

extension CSSRulable {
    /// Sets whether a background image scrolls with the rest of the page, or is fixed
    public func backgroundAttachment(_ type: BackgroundAttachmentType) -> Self {
        s?._addProperty(.backgroundAttachment, type)
        return self
    }

    /// Sets whether a background image scrolls with the rest of the page, or is fixed
    public func backgroundAttachment(_ type: State<BackgroundAttachmentType>) -> Self {
        s?._addProperty(BackgroundAttachmentProperty(type))
        return self
    }

    /// Sets whether a background image scrolls with the rest of the page, or is fixed
    public func backgroundAttachment<V>(_ type: ExpressableState<V, BackgroundAttachmentType>) -> Self {
        backgroundAttachment(type.unwrap())
    }
}
