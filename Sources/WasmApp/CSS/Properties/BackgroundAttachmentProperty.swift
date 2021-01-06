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
}

extension PropertyKey {
    public static var backgroundAttachment: PropertyKey<BackgroundAttachmentType> { "background-attachment".propertyKey() }
}
