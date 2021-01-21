//
//  ObjectFit.swift
//  Web
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Specifies how the contents of a replaced element should be fitted to the box established by its used height and width
///
/// ```html
/// object-fit: cover;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_object-fit.asp)
public class ObjectFitProperty: _Property {
    public var propertyKey: PropertyKey<ObjectFitType> { .objectFit }
    public var propertyValue: ObjectFitType
    var _content = _PropertyContent<ObjectFitType>()
    
    public init (_ type: ObjectFitType) {
        propertyValue = type
    }
    
    public convenience init (_ type: State<ObjectFitType>) {
        self.init(type.wrappedValue)
        type.listen { self._changed(to: $0) }
    }

    public convenience init <V>(_ type: ExpressableState<V, ObjectFitType>) {
        self.init(type.unwrap())
    }
}

extension PropertyKey {
    /// Specifies how the contents of a replaced element should be fitted to the box established by its used height and width
    public static var objectFit: PropertyKey<ObjectFitType> { "object-fit".propertyKey() }
}

extension Stylesheet {
    /// Specifies how the contents of a replaced element should be fitted to the box established by its used height and width
    public typealias ObjectFit = ObjectFitProperty
}

extension CSSRulable {
    /// Specifies how the contents of a replaced element should be fitted to the box established by its used height and width
    public func objectFit(_ type: ObjectFitType) -> Self {
        s?._addProperty(.objectFit, type)
        return self
    }

    /// Specifies how the contents of a replaced element should be fitted to the box established by its used height and width
    public func objectFit(_ type: State<ObjectFitType>) -> Self {
        s?._addProperty(ObjectFitProperty(type))
        return self
    }

    /// Specifies how the contents of a replaced element should be fitted to the box established by its used height and width
    public func objectFit<V>(_ type: ExpressableState<V, ObjectFitType>) -> Self {
        objectFit(type.unwrap())
    }
}
