//
//  PerspectiveOrigin.swift
//  WasmApp
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
    
    public init (_ xAxis: XAxis, _ yAxis: YAxis) {
        propertyValue = PerspectiveOriginValue(xAxis, yAxis)
    }
    
    public init <X>(_ xAxis: X, _ yAxis: YAxis) where X: StateConvertible, X.Value == XAxis {
        propertyValue = PerspectiveOriginValue(xAxis, yAxis)
    }
    
    public init <Y>(_ xAxis: XAxis, _ yAxis: Y) where Y: StateConvertible, Y.Value == YAxis {
        propertyValue = PerspectiveOriginValue(xAxis, yAxis)
    }
    
    public init <X, Y>(_ xAxis: X, _ yAxis: Y) where X: StateConvertible, X.Value == XAxis, Y: StateConvertible, Y.Value == YAxis {
        propertyValue = PerspectiveOriginValue(xAxis, yAxis)
    }
    
    public init (_ xAxis: XAxis) {
        propertyValue = PerspectiveOriginValue(xAxis)
    }
    
    public init <X>(_ xAxis: X) where X: StateConvertible, X.Value == XAxis {
        propertyValue = PerspectiveOriginValue(xAxis)
    }
    
    public init (_ yAxis: YAxis) {
        propertyValue = PerspectiveOriginValue(yAxis)
    }
    
    public init <Y>(_ yAxis: Y) where Y: StateConvertible, Y.Value == YAxis {
        propertyValue = PerspectiveOriginValue(yAxis)
    }
}

extension PropertyKey {
    /// Defines at which position the user is looking at the 3D-positioned element
    public static var perspectiveOrigin: PropertyKey<PerspectiveOriginValue> { "perspective-origin".propertyKey() }
}

public class PerspectiveOriginValue: CustomStringConvertible, _PropertyValueInnerChangeable {
    public var value: String
    
    var _changeHandler = {}
    
    public init (_ xAxis: XAxis, _ yAxis: YAxis) {
        value = [xAxis.value, yAxis.value].joined(separator: " ")
    }
    
    public convenience init <X>(_ xAxis: X, _ yAxis: YAxis) where X: StateConvertible, X.Value == XAxis {
        let xAxis = xAxis.stateValue
        self.init(xAxis.wrappedValue, yAxis)
        xAxis.listen {
            self.value = [$0.value, yAxis.value].joined(separator: " ")
            self._changeHandler()
        }
    }
    
    public convenience init <Y>(_ xAxis: XAxis, _ yAxis: Y) where Y: StateConvertible, Y.Value == YAxis {
        let yAxis = yAxis.stateValue
        self.init(xAxis, yAxis.wrappedValue)
        yAxis.listen {
            self.value = [xAxis.value, $0.value].joined(separator: " ")
            self._changeHandler()
        }
    }
    
    public convenience init <X, Y>(_ xAxis: X, _ yAxis: Y) where X: StateConvertible, X.Value == XAxis, Y: StateConvertible, Y.Value == YAxis {
        let xAxis = xAxis.stateValue
        let yAxis = yAxis.stateValue
        self.init(xAxis.wrappedValue, yAxis.wrappedValue)
        xAxis.listen {
            self.value = [$0.value, yAxis.wrappedValue.value].joined(separator: " ")
            self._changeHandler()
        }
        yAxis.listen {
            self.value = [xAxis.wrappedValue.value, $0.value].joined(separator: " ")
            self._changeHandler()
        }
    }
    
    public init (_ xAxis: XAxis) {
        value = xAxis.value
    }
    
    public convenience init <X>(_ xAxis: X) where X: StateConvertible, X.Value == XAxis {
        let xAxis = xAxis.stateValue
        self.init(xAxis.wrappedValue)
        xAxis.listen {
            self.value = $0.value
            self._changeHandler()
        }
    }
    
    public init (_ yAxis: YAxis) {
        value = yAxis.value
    }
    
    public convenience init <Y>(_ yAxis: Y) where Y: StateConvertible, Y.Value == YAxis {
        let yAxis = yAxis.stateValue
        self.init(yAxis.wrappedValue)
        yAxis.listen {
            self.value = $0.value
            self._changeHandler()
        }
    }
    
    public var description: String { value }
}

extension Stylesheet {
    /// Defines at which position the user is looking at the 3D-positioned element
    public typealias PerspectiveOrigin = PerspectiveOriginProperty
}

extension CSSRulable {
    /// Defines at which position the user is looking at the 3D-positioned element
    public func perspectiveOrigin(_ xAxis: XAxis, _ yAxis: YAxis) -> Self {
        s?._addProperty(PerspectiveOriginProperty(xAxis, yAxis))
        return self
    }
    
    /// Defines at which position the user is looking at the 3D-positioned element
    public func perspectiveOrigin<X>(_ xAxis: X, _ yAxis: YAxis) -> Self where X: StateConvertible, X.Value == XAxis {
        s?._addProperty(PerspectiveOriginProperty(xAxis, yAxis))
        return self
    }
    
    /// Defines at which position the user is looking at the 3D-positioned element
    public func perspectiveOrigin<Y>(_ xAxis: XAxis, _ yAxis: Y) -> Self where Y: StateConvertible, Y.Value == YAxis {
        s?._addProperty(PerspectiveOriginProperty(xAxis, yAxis))
        return self
    }
    
    /// Defines at which position the user is looking at the 3D-positioned element
    public func perspectiveOrigin<X, Y>(_ xAxis: X, _ yAxis: Y) -> Self where X: StateConvertible, X.Value == XAxis, Y: StateConvertible, Y.Value == YAxis {
        s?._addProperty(PerspectiveOriginProperty(xAxis, yAxis))
        return self
    }
    
    /// Defines at which position the user is looking at the 3D-positioned element
    public func perspectiveOrigin(_ xAxis: XAxis) -> Self {
        s?._addProperty(PerspectiveOriginProperty(xAxis))
        return self
    }
    
    /// Defines at which position the user is looking at the 3D-positioned element
    public func perspectiveOrigin<X>(_ xAxis: X) -> Self where X: StateConvertible, X.Value == XAxis {
        s?._addProperty(PerspectiveOriginProperty(xAxis))
        return self
    }
    
    /// Defines at which position the user is looking at the 3D-positioned element
    public func perspectiveOrigin(_ yAxis: YAxis) -> Self {
        s?._addProperty(PerspectiveOriginProperty(yAxis))
        return self
    }
    
    /// Defines at which position the user is looking at the 3D-positioned element
    public func perspectiveOrigin<Y>(_ yAxis: Y) -> Self where Y: StateConvertible, Y.Value == YAxis {
        s?._addProperty(PerspectiveOriginProperty(yAxis))
        return self
    }
}
