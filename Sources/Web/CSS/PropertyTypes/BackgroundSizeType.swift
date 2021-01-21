//
//  BackgroundSizeType.swift
//  Web
//
//  Created by Mihael Isaev on 10.07.2020.
//

public final class BackgroundSizeType: Autoable, Initialable, Inheritable, Lengthable, Percentable, CustomStringConvertible, _PropertyValueInnerChangeable {
    @State public var value = ""
    
    var _changeHandler = {}
    
    required public init (_ value: String) {
        self.value = value
        $value.listen {
            self._changeHandler()
        }
    }
    
    convenience init (_ value: Double, _ unit: Unit) {
        self.init(UnitValue(value, unit).description)
    }
    
    convenience init (_ value: State<Double>, _ unit: Unit) {
        self.init(value.wrappedValue, unit)
        value.listen {
            self.value = UnitValue($0.value, unit).description
        }
    }
    
    convenience init (_ value: Double, _ unit: State<Unit>) {
        self.init(value, unit.wrappedValue)
        unit.listen {
            self.value = UnitValue(value, $0).description
        }
    }
    
    convenience init (_ value: State<Double>, _ unit: State<Unit>) {
        self.init(value.wrappedValue, unit.wrappedValue)
        value.listen {
            self.value = UnitValue($0.value, unit.wrappedValue).description
        }
        unit.listen {
            self.value = UnitValue(value.wrappedValue, $0).description
        }
    }
    
    convenience init <V>(_ value: ExpressableState<V, Double>, _ unit: Unit) {
        self.init(value.unwrap(), unit)
    }
    
    convenience init <V>(_ value: ExpressableState<V, Double>, _ unit: State<Unit>) {
        self.init(value.unwrap(), unit)
    }
    
    convenience init <V>(_ value: Double, _ unit: ExpressableState<V, Unit>) {
        self.init(value, unit.unwrap())
    }
    
    convenience init <V>(_ value: State<Double>, _ unit: ExpressableState<V, Unit>) {
        self.init(value, unit.unwrap())
    }
    
    convenience init <V, U>(_ value: ExpressableState<V, Double>, _ unit: ExpressableState<U, Unit>) {
        self.init(value.unwrap(), unit.unwrap())
    }
    
    /// Resize the background image to cover the entire container,
    /// even if it has to stretch the image or cut a little bit off one of the edges
    public static var cover: Self { .init("cover") }
    
    /// Resize the background image to make sure the image is fully visible
    public static var contain: Self { .init("contain") }
    
    public var description: String { value }
}
