//
//  FlexFlowProperty.swift
//  Web
//
//  Created by Mihael Isaev on 06.01.2021.
//

/// A shorthand property for the flex-direction and the flex-wrap properties
///
/// ```html
/// flex-flow: row-reverse wrap;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_flex-flow.asp)
public class FlexFlowProperty: _Property {
    public var propertyKey: PropertyKey<FlexFlowValue> { .flexFlow }
    public var propertyValue: FlexFlowValue
    var _content = _PropertyContent<FlexFlowValue>()
    
    public init (direction: FlexDirectionType, wrap: FlexWrapType) {
        propertyValue = .init(direction: direction, wrap: wrap)
    }
    
    public init <D>(direction: D, wrap: FlexWrapType) where D: StateConvertible, D.Value == FlexDirectionType {
        propertyValue = .init(direction: direction, wrap: wrap)
    }
    
    public init <W>(direction: FlexDirectionType, wrap: W) where W: StateConvertible, W.Value == FlexWrapType {
        propertyValue = .init(direction: direction, wrap: wrap)
    }
    
    public init <D, W>(direction: D, wrap: W) where D: StateConvertible, D.Value == FlexDirectionType, W: StateConvertible, W.Value == FlexWrapType {
        propertyValue = .init(direction: direction, wrap: wrap)
    }
}

extension PropertyKey {
    /// A shorthand property for the flex-direction and the flex-wrap properties
    public static var flexFlow: PropertyKey<FlexFlowValue> { "flex-flow".propertyKey() }
}

public class FlexFlowValue: CustomStringConvertible, _PropertyValueInnerChangeable {
    public var value: String
    
    var _changeHandler = {}
    
    public init (direction: FlexDirectionType, wrap: FlexWrapType) {
        value = [direction.value, wrap.value].joined(separator: " ")
    }
    
    public convenience init <D>(direction: D, wrap: FlexWrapType) where D: StateConvertible, D.Value == FlexDirectionType {
        let direction = direction.stateValue
        self.init(direction: direction.wrappedValue, wrap: wrap)
        direction.listen {
            self.value = [$0.value, wrap.value].joined(separator: " ")
            self._changeHandler()
        }
    }
    
    public convenience init <W>(direction: FlexDirectionType, wrap: W) where W: StateConvertible, W.Value == FlexWrapType {
        let wrap = wrap.stateValue
        self.init(direction: direction, wrap: wrap.wrappedValue)
        wrap.listen {
            self.value = [direction.value, $0.value].joined(separator: " ")
            self._changeHandler()
        }
    }
    
    public convenience init <D, W>(direction: D, wrap: W) where D: StateConvertible, D.Value == FlexDirectionType, W: StateConvertible, W.Value == FlexWrapType {
        let direction = direction.stateValue
        let wrap = wrap.stateValue
        self.init(direction: direction.wrappedValue, wrap: wrap.wrappedValue)
        direction.listen {
            self.value = [$0.value, wrap.wrappedValue.value].joined(separator: " ")
            self._changeHandler()
        }
        wrap.listen {
            self.value = [direction.wrappedValue.value, $0.value].joined(separator: " ")
            self._changeHandler()
        }
    }
    
    public var description: String { value }
}

extension Stylesheet {
    /// A shorthand property for the flex-direction and the flex-wrap properties
    public typealias FlexFlow = FlexFlowProperty
}

extension CSSRulable {
    /// A shorthand property for the flex-direction and the flex-wrap properties
    public func flexFlow(direction: FlexDirectionType, wrap: FlexWrapType) -> Self {
        s?._addProperty(FlexFlowProperty(direction: direction, wrap: wrap))
        return self
    }
    
    /// A shorthand property for the flex-direction and the flex-wrap properties
    public func flexFlow<D>(direction: D, wrap: FlexWrapType) -> Self where D: StateConvertible, D.Value == FlexDirectionType {
        s?._addProperty(FlexFlowProperty(direction: direction, wrap: wrap))
        return self
    }
    
    /// A shorthand property for the flex-direction and the flex-wrap properties
    public func flexFlow<W>(direction: FlexDirectionType, wrap: W) -> Self where W: StateConvertible, W.Value == FlexWrapType {
        s?._addProperty(FlexFlowProperty(direction: direction, wrap: wrap))
        return self
    }
    
    /// A shorthand property for the flex-direction and the flex-wrap properties
    public func flexFlow<D, W>(direction: D, wrap: W) -> Self where D: StateConvertible, D.Value == FlexDirectionType, W: StateConvertible, W.Value == FlexWrapType {
        s?._addProperty(FlexFlowProperty(direction: direction, wrap: wrap))
        return self
    }
}
