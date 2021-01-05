//
//  PerspectiveOrigin.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 09.07.2020.
//

/// Defines at which position the user is looking at the 3D-positioned element
///
/// ```html
/// perspective-origin: left;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_perspective-origin.asp)
public class PerspectiveOriginProperty: _Property {
    public var propertyKey: PropertyKey<PerspectiveOriginValue> { .perspectiveOrigin }
    public var propertyValue: PerspectiveOriginValue
    var _content = _PropertyContent<PerspectiveOriginValue>()
    
    public init (_ value: PerspectiveOriginValue) {
        propertyValue = value
    }
    
    public init (_ xAxis: XAxis, _ yAxis: YAxis) {
        propertyValue = PerspectiveOriginValue(xAxis, yAxis)
    }
    
    public init (_ xAxis: XAxis) {
        propertyValue = PerspectiveOriginValue(xAxis)
    }
    
    public init (_ yAxis: YAxis) {
        propertyValue = PerspectiveOriginValue(yAxis)
    }
}

extension PropertyKey {
    public static var perspectiveOrigin: PropertyKey<PerspectiveOriginValue> { "perspective-origin".propertyKey() }
}

public struct PerspectiveOriginValue: CustomStringConvertible {
    public let value: String
    
    public init (_ xAxis: XAxis, _ yAxis: YAxis) {
        value = [xAxis.value, yAxis.value].joined(separator: " ")
    }
    
    public init (_ xAxis: XAxis) {
        value = xAxis.value
    }
    
    public init (_ yAxis: YAxis) {
        value = yAxis.value
    }
    
    public var description: String { value }
}
