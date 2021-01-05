//
//  Background.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// A shorthand property for all the background-* properties
///
/// ```html
/// background: lightblue url("img_tree.gif") no-repeat fixed center;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_background.asp)
public class BackgroundProperty: _Property {
    public var propertyKey: PropertyKey<BackgroundValue> { .background }
    public var propertyValue: BackgroundValue
    var _content = _PropertyContent<BackgroundValue>()
    
    public init (_ value: BackgroundValue) {
        propertyValue = value
    }
    
    public init (color: ColorType? = nil, src: String? = nil, position: BackgroundPositionType? = nil, size: BackgroundSizeType? = nil, repeat: BackgroundRepeatType? = nil, origin: BackgroundOriginType? = nil, clip: BackgroundClipType? = nil, attachment: BackgroundAttachmentType? = nil) {
        propertyValue = BackgroundValue(color: color, src: src, position: position, size: size, repeat: `repeat`, origin: origin, clip: clip, attachment: attachment)
    }
}

extension PropertyKey {
    public static var background: PropertyKey<BackgroundValue> { "background".propertyKey() }
}

public struct BackgroundValue: CustomStringConvertible {
    public let value: String
    
    public init (color: ColorType? = nil, src: String? = nil, position: BackgroundPositionType? = nil, size: BackgroundSizeType? = nil, repeat: BackgroundRepeatType? = nil, origin: BackgroundOriginType? = nil, clip: BackgroundClipType? = nil, attachment: BackgroundAttachmentType? = nil) {
        value = [color?.description, src, position?.value, size?.value, `repeat`?.value, origin?.value, clip?.value, attachment?.value].compactMap { $0 }.joined(separator: " ")
    }
    
    public var description: String { value }
}

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

/// Specifies the blending mode of each background layer (color/image)
///
/// ```html
/// background-blend-mode: lighten;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_background-blend-mode.asp)
public class BackgroundBlendModeProperty: _Property {
    public var propertyKey: PropertyKey<BackgroundBlendModeType> { .backgroundBlendMode }
    public var propertyValue: BackgroundBlendModeType
    var _content = _PropertyContent<BackgroundBlendModeType>()
    
    public init (_ type: BackgroundBlendModeType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var backgroundBlendMode: PropertyKey<BackgroundBlendModeType> { "background-blend-mode".propertyKey() }
}

/// Defines how far the background (color or image) should extend within an element
///
/// ```html
/// background-clip: padding-box;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_background-clip.asp)
public class BackgroundClipProperty: _Property {
    public var propertyKey: PropertyKey<BackgroundClipType> { .backgroundClip }
    public var propertyValue: BackgroundClipType
    var _content = _PropertyContent<BackgroundClipType>()
    
    public init (_ type: BackgroundClipType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var backgroundClip: PropertyKey<BackgroundClipType> { "background-clip".propertyKey() }
}

/// Specifies the background color of an element
///
/// ```html
/// background-color: coral;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_background-color.asp)
public class BackgroundColorProperty: _Property {
    public var propertyKey: PropertyKey<ColorType> { .backgroundColor }
    public var propertyValue: ColorType
    var _content = _PropertyContent<ColorType>()
    
    public init (_ color: ColorType) {
        propertyValue = color
    }
}

extension PropertyKey {
    public static var backgroundColor: PropertyKey<ColorType> { "background-color".propertyKey() }
}

/// Specifies one or more background images for an element
///
/// ```html
/// background-image: url("paper.gif");
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_background-image.asp)
public class BackgroundImageProperty: _Property {
    public var propertyKey: PropertyKey<String> { .backgroundImage }
    public var propertyValue: String
    var _content = _PropertyContent<String>()
    
    public init (_ src: String) {
        propertyValue = "url(\(src)"
    }
}

extension PropertyKey {
    public static var backgroundImage: PropertyKey<String> { "background-image".propertyKey() }
}

/// Specifies the origin position of a background image
///
/// ```html
/// background-origin: content-box;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_background-origin.asp)
public class BackgroundOriginProperty: _Property {
    public var propertyKey: PropertyKey<BackgroundOriginType> { .backgroundOrigin }
    public var propertyValue: BackgroundOriginType
    var _content = _PropertyContent<BackgroundOriginType>()
    
    public init (_ type: BackgroundOriginType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var backgroundOrigin: PropertyKey<BackgroundOriginType> { "background-origin".propertyKey() }
}

/// Specifies the position of a background image
///
/// ```html
/// background-position: center;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_background-position.asp)
public class BackgroundPositionProperty: _Property {
    public var propertyKey: PropertyKey<BackgroundPositionType> { .backgroundPosition }
    public var propertyValue: BackgroundPositionType
    var _content = _PropertyContent<BackgroundPositionType>()
    
    public init (_ type: BackgroundPositionType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var backgroundPosition: PropertyKey<BackgroundPositionType> { "background-position".propertyKey() }
}

/// Sets if/how a background image will be repeated
///
/// ```html
/// background-repeat: repeat-y;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/pr_background-repeat.asp)
public class BackgroundRepeatProperty: _Property {
    public var propertyKey: PropertyKey<BackgroundRepeatType> { .backgroundRepeat }
    public var propertyValue: BackgroundRepeatType
    var _content = _PropertyContent<BackgroundRepeatType>()
    
    public init (_ type: BackgroundRepeatType) {
        propertyValue = type
    }
}

extension PropertyKey {
    public static var backgroundRepeat: PropertyKey<BackgroundRepeatType> { "background-repeat".propertyKey() }
}

/// Specifies the size of the background images
///
/// ```html
/// background-size: 300px 100px;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_background-size.asp)
public class BackgroundSizeProperty: _Property {
    public var propertyKey: PropertyKey<BackgroundSizeValue> { .backgroundSize }
    public var propertyValue: BackgroundSizeValue
    var _content = _PropertyContent<BackgroundSizeValue>()
    
    public init (_ value: BackgroundSizeValue) {
        propertyValue = value
    }
    
    public init (all: BackgroundSizeType) {
        propertyValue = BackgroundSizeValue(all: all)
    }
    
    public init (h: BackgroundSizeType, v: BackgroundSizeType) {
        propertyValue = BackgroundSizeValue(h: h, v: v)
    }
}

extension PropertyKey {
    public static var backgroundSize: PropertyKey<BackgroundSizeValue> { "background-size".propertyKey() }
}

public struct BackgroundSizeValue: CustomStringConvertible {
    public let value: String
    
    public init (all: BackgroundSizeType) {
        value = all.value
    }
    
    public init (h: BackgroundSizeType, v: BackgroundSizeType) {
        value = [h.value, v.value].joined(separator: " ")
    }
    
    public var description: String { value }
}
