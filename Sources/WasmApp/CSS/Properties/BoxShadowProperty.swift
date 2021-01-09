//
//  BoxShadow.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 10.07.2020.
//

/// Attaches one or more shadows to an element
///
/// ```html
/// box-shadow: 5px 10px #888888;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_box-shadow.asp)
public class BoxShadowProperty: _Property {
    public var propertyKey: PropertyKey<BoxShadowValue> { .boxShadow }
    public var propertyValue: BoxShadowValue
    var _content = _PropertyContent<BoxShadowValue>()
    
    public init<H: UnitValuable, V: UnitValuable>(h: H, v: V, blur: NumericValue? = nil, spread: NumericValue? = nil, color: Color? = nil) {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color)
    }
    
    // MARK: A
    public init <A, V: UnitValuable>(h: A, v: V, blur: NumericValue? = nil, spread: NumericValue? = nil, color: Color? = nil) where A: StateConvertible, A.Value: UnitValuable {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color)
    }
    
    // MARK: B
    public init <B, H: UnitValuable>(h: H, v: B, blur: NumericValue? = nil, spread: NumericValue? = nil, color: Color? = nil) where B: StateConvertible, B.Value: UnitValuable {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color)
    }
    
    // MARK: C
    public init <C, H: UnitValuable, V: UnitValuable>(h: H, v: V, blur: C, spread: NumericValue? = nil, color: Color? = nil) where C: StateConvertible, C.Value == Optional<NumericValue> {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color)
    }
    
    // MARK: D
    public init <D, H: UnitValuable, V: UnitValuable>(h: H, v: V, blur: NumericValue? = nil, spread: D, color: Color? = nil) where D: StateConvertible, D.Value == Optional<NumericValue> {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color)
    }
    
    // MARK: E
    public init <E, H: UnitValuable, V: UnitValuable>(h: H, v: V, blur: NumericValue? = nil, spread: NumericValue? = nil, color: E) where E: StateConvertible, E.Value == Optional<Color> {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color)
    }
    
    // MARK: A B
    public init <A, B>(h: A, v: B, blur: NumericValue? = nil, spread: NumericValue? = nil, color: Color? = nil) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color)
    }
    
    // MARK: A C
    public init <A, C, V: UnitValuable>(h: A, v: V, blur: C, spread: NumericValue? = nil, color: Color? = nil) where A: StateConvertible, A.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue> {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color)
    }
    
    // MARK: A D
    public init <A, D, V: UnitValuable>(h: A, v: V, blur: NumericValue? = nil, spread: D, color: Color? = nil) where A: StateConvertible, A.Value: UnitValuable, D: StateConvertible, D.Value == Optional<NumericValue> {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color)
    }
    
    // MARK: A E
    public init <A, E, V: UnitValuable>(h: A, v: V, blur: NumericValue? = nil, spread: NumericValue? = nil, color: E) where A: StateConvertible, A.Value: UnitValuable, E: StateConvertible, E.Value == Optional<Color> {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color)
    }
    
    // MARK: B C
    public init <B, C, H: UnitValuable>(h: H, v: B, blur: C, spread: NumericValue? = nil, color: Color? = nil) where B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue> {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color)
    }
    
    // MARK: B D
    public init <B, D, H: UnitValuable>(h: H, v: B, blur: NumericValue? = nil, spread: D, color: Color? = nil) where B: StateConvertible, B.Value: UnitValuable, D: StateConvertible, D.Value == Optional<NumericValue> {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color)
    }
    
    // MARK: B E
    public init <B, E, H: UnitValuable>(h: H, v: B, blur: NumericValue? = nil, spread: NumericValue? = nil, color: E) where B: StateConvertible, B.Value: UnitValuable, E: StateConvertible, E.Value == Optional<Color> {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color)
    }
    
    // MARK: C D
    public init <C, D, H: UnitValuable, V: UnitValuable>(h: H, v: V, blur: C, spread: D, color: Color? = nil) where C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue> {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color)
    }
    
    // MARK: C E
    public init <C, E, H: UnitValuable, V: UnitValuable>(h: H, v: V, blur: C, spread: NumericValue? = nil, color: E) where C: StateConvertible, C.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color> {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color)
    }
    
    // MARK: D E
    public init <D, E, H: UnitValuable, V: UnitValuable>(h: H, v: V, blur: NumericValue? = nil, spread: D, color: E) where D: StateConvertible, D.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color> {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color)
    }
    
    // MARK: A B C
    public init <A, B, C>(h: A, v: B, blur: C, spread: NumericValue? = nil, color: Color? = nil) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue> {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color)
    }
    
    // MARK: A B D
    public init <A, B, D>(h: A, v: B, blur: NumericValue? = nil, spread: D, color: Color? = nil) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, D: StateConvertible, D.Value == Optional<NumericValue> {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color)
    }
    
    // MARK: A B E
    public init <A, B, E>(h: A, v: B, blur: NumericValue? = nil, spread: NumericValue? = nil, color: E) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, E: StateConvertible, E.Value == Optional<Color> {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color)
    }
    
    // MARK: B C D
    public init <B, C, D, H: UnitValuable>(h: H, v: B, blur: C, spread: D, color: Color? = nil) where B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue> {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color)
    }
    
    // MARK: B C E
    public init <B, C, E, H: UnitValuable>(h: H, v: B, blur: C, spread: NumericValue? = nil, color: E) where B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color> {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color)
    }
    
    // MARK: A C D
    public init <A, C, D, V: UnitValuable>(h: A, v: V, blur: C, spread: D, color: Color? = nil) where A: StateConvertible, A.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue> {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color)
    }
    
    // MARK: A C E
    public init <A, C, E, V: UnitValuable>(h: A, v: V, blur: C, spread: NumericValue? = nil, color: E) where A: StateConvertible, A.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color> {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color)
    }
    
    // MARK: A B C D
    public init <A, B, C, D>(h: A, v: B, blur: C, spread: D, color: Color? = nil) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue> {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color)
    }
    
    // MARK: A B C E
    public init <A, B, C, E>(h: A, v: B, blur: C, spread: NumericValue? = nil, color: E) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color> {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color)
    }
    
    // MARK: B C D E
    public init <B, C, D, E, H: UnitValuable>(h: H, v: B, blur: C, spread: D, color: E) where B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color> {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color)
    }
    
    // MARK: A B C D E
    public init <A, B, C, D, E>(h: A, v: B, blur: C, spread: D, color: E) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color> {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color)
    }
}

extension PropertyKey {
    /// Attaches one or more shadows to an element
    public static var boxShadow: PropertyKey<BoxShadowValue> { "box-shadow".propertyKey() }
}

public class BoxShadowValue: CustomStringConvertible, _PropertyValueInnerChangeable {
    public var value: String
    
    var _changeHandler = {}
    
    private static func makeValue<H: UnitValuable, V: UnitValuable>(h: H, v: V, blur: NumericValue? = nil, spread: NumericValue? = nil, color: Color? = nil) -> String {
        var elements: [String] = [h.description, v.description]
        if let blur = blur {
            elements.append(blur.numericValue)
        }
        if let spread = spread {
            elements.append(spread.numericValue)
        }
        if let color = color {
            elements.append(color.description)
        }
        return elements.joined(separator: " ")
    }
    
    public init<H: UnitValuable, V: UnitValuable>(h: H, v: V, blur: NumericValue? = nil, spread: NumericValue? = nil, color: Color? = nil) {
        value = Self.makeValue(h: h, v: v, blur: blur, spread: spread, color: color)
    }
    
    // MARK: A
    public convenience init <A, V: UnitValuable>(h: A, v: V, blur: NumericValue? = nil, spread: NumericValue? = nil, color: Color? = nil) where A: StateConvertible, A.Value: UnitValuable {
        let h = h.stateValue
        self.init(h: h.wrappedValue, v: v, blur: blur, spread: spread, color: color)
        h.listen {
            self.value = Self.makeValue(h: $0, v: v, blur: blur, spread: spread, color: color)
            self._changeHandler()
        }
    }
    
    // MARK: B
    public convenience init <B, H: UnitValuable>(h: H, v: B, blur: NumericValue? = nil, spread: NumericValue? = nil, color: Color? = nil) where B: StateConvertible, B.Value: UnitValuable {
        let v = v.stateValue
        self.init(h: h, v: v.wrappedValue, blur: blur, spread: spread, color: color)
        v.listen {
            self.value = Self.makeValue(h: h, v: $0, blur: blur, spread: spread, color: color)
            self._changeHandler()
        }
    }
    
    // MARK: C
    public convenience init <C, H: UnitValuable, V: UnitValuable>(h: H, v: V, blur: C, spread: NumericValue? = nil, color: Color? = nil) where C: StateConvertible, C.Value == Optional<NumericValue> {
        let blur = blur.stateValue
        self.init(h: h, v: v, blur: blur.wrappedValue, spread: spread, color: color)
        blur.listen {
            self.value = Self.makeValue(h: h, v: v, blur: $0, spread: spread, color: color)
            self._changeHandler()
        }
    }
    
    // MARK: D
    public convenience init <D, H: UnitValuable, V: UnitValuable>(h: H, v: V, blur: NumericValue? = nil, spread: D, color: Color? = nil) where D: StateConvertible, D.Value == Optional<NumericValue> {
        let spread = spread.stateValue
        self.init(h: h, v: v, blur: blur, spread: spread.wrappedValue, color: color)
        spread.listen {
            self.value = Self.makeValue(h: h, v: v, blur: blur, spread: $0, color: color)
            self._changeHandler()
        }
    }
    
    // MARK: E
    public convenience init <E, H: UnitValuable, V: UnitValuable>(h: H, v: V, blur: NumericValue? = nil, spread: NumericValue? = nil, color: E) where E: StateConvertible, E.Value == Optional<Color> {
        let color = color.stateValue
        self.init(h: h, v: v, blur: blur, spread: spread, color: color.wrappedValue)
        color.listen {
            self.value = Self.makeValue(h: h, v: v, blur: blur, spread: spread, color: $0)
            self._changeHandler()
        }
    }
    
    // MARK: A B
    public convenience init <A, B>(h: A, v: B, blur: NumericValue? = nil, spread: NumericValue? = nil, color: Color? = nil) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable {
        let h = h.stateValue
        let v = v.stateValue
        self.init(h: h.wrappedValue, v: v.wrappedValue, blur: blur, spread: spread, color: color)
        h.listen {
            self.value = Self.makeValue(h: $0, v: v.wrappedValue, blur: blur, spread: spread, color: color)
            self._changeHandler()
        }
        v.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: $0, blur: blur, spread: spread, color: color)
            self._changeHandler()
        }
    }
    
    // MARK: A C
    public convenience init <A, C, V: UnitValuable>(h: A, v: V, blur: C, spread: NumericValue? = nil, color: Color? = nil) where A: StateConvertible, A.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue> {
        let h = h.stateValue
        let blur = blur.stateValue
        self.init(h: h.wrappedValue, v: v, blur: blur.wrappedValue, spread: spread, color: color)
        h.listen {
            self.value = Self.makeValue(h: $0, v: v, blur: blur.wrappedValue, spread: spread, color: color)
            self._changeHandler()
        }
        blur.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v, blur: $0, spread: spread, color: color)
            self._changeHandler()
        }
    }
    
    // MARK: A D
    public convenience init <A, D, V: UnitValuable>(h: A, v: V, blur: NumericValue? = nil, spread: D, color: Color? = nil) where A: StateConvertible, A.Value: UnitValuable, D: StateConvertible, D.Value == Optional<NumericValue> {
        let h = h.stateValue
        let spread = spread.stateValue
        self.init(h: h.wrappedValue, v: v, blur: blur, spread: spread.wrappedValue, color: color)
        h.listen {
            self.value = Self.makeValue(h: $0, v: v, blur: blur, spread: spread.wrappedValue, color: color)
            self._changeHandler()
        }
        spread.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v, blur: blur, spread: $0, color: color)
            self._changeHandler()
        }
    }
    
    // MARK: A E
    public convenience init <A, E, V: UnitValuable>(h: A, v: V, blur: NumericValue? = nil, spread: NumericValue? = nil, color: E) where A: StateConvertible, A.Value: UnitValuable, E: StateConvertible, E.Value == Optional<Color> {
        let h = h.stateValue
        let color = color.stateValue
        self.init(h: h.wrappedValue, v: v, blur: blur, spread: spread, color: color.wrappedValue)
        h.listen {
            self.value = Self.makeValue(h: $0, v: v, blur: blur, spread: spread, color: color.wrappedValue)
            self._changeHandler()
        }
        color.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v, blur: blur, spread: spread, color: $0)
            self._changeHandler()
        }
    }
    
    // MARK: B C
    public convenience init <B, C, H: UnitValuable>(h: H, v: B, blur: C, spread: NumericValue? = nil, color: Color? = nil) where B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue> {
        let v = v.stateValue
        let blur = blur.stateValue
        self.init(h: h, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread, color: color)
        v.listen {
            self.value = Self.makeValue(h: h, v: $0, blur: blur.wrappedValue, spread: spread, color: color)
            self._changeHandler()
        }
        blur.listen {
            self.value = Self.makeValue(h: h, v: v.wrappedValue, blur: $0, spread: spread, color: color)
            self._changeHandler()
        }
    }
    
    // MARK: B D
    public convenience init <B, D, H: UnitValuable>(h: H, v: B, blur: NumericValue? = nil, spread: D, color: Color? = nil) where B: StateConvertible, B.Value: UnitValuable, D: StateConvertible, D.Value == Optional<NumericValue> {
        let v = v.stateValue
        let spread = spread.stateValue
        self.init(h: h, v: v.wrappedValue, blur: blur, spread: spread.wrappedValue, color: color)
        v.listen {
            self.value = Self.makeValue(h: h, v: $0, blur: blur, spread: spread.wrappedValue, color: color)
            self._changeHandler()
        }
        spread.listen {
            self.value = Self.makeValue(h: h, v: v.wrappedValue, blur: blur, spread: $0, color: color)
            self._changeHandler()
        }
    }
    
    // MARK: B E
    public convenience init <B, E, H: UnitValuable>(h: H, v: B, blur: NumericValue? = nil, spread: NumericValue? = nil, color: E) where B: StateConvertible, B.Value: UnitValuable, E: StateConvertible, E.Value == Optional<Color> {
        let v = v.stateValue
        let color = color.stateValue
        self.init(h: h, v: v.wrappedValue, blur: blur, spread: spread, color: color.wrappedValue)
        v.listen {
            self.value = Self.makeValue(h: h, v: $0, blur: blur, spread: spread, color: color.wrappedValue)
            self._changeHandler()
        }
        color.listen {
            self.value = Self.makeValue(h: h, v: v.wrappedValue, blur: blur, spread: spread, color: $0)
            self._changeHandler()
        }
    }
    
    // MARK: C D
    public convenience init <C, D, H: UnitValuable, V: UnitValuable>(h: H, v: V, blur: C, spread: D, color: Color? = nil) where C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue> {
        let blur = blur.stateValue
        let spread = spread.stateValue
        self.init(h: h, v: v, blur: blur.wrappedValue, spread: spread.wrappedValue, color: color)
        blur.listen {
            self.value = Self.makeValue(h: h, v: v, blur: $0, spread: spread.wrappedValue, color: color)
            self._changeHandler()
        }
        spread.listen {
            self.value = Self.makeValue(h: h, v: v, blur: blur.wrappedValue, spread: $0, color: color)
            self._changeHandler()
        }
    }
    
    // MARK: C E
    public convenience init <C, E, H: UnitValuable, V: UnitValuable>(h: H, v: V, blur: C, spread: NumericValue? = nil, color: E) where C: StateConvertible, C.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color> {
        let blur = blur.stateValue
        let color = color.stateValue
        self.init(h: h, v: v, blur: blur.wrappedValue, spread: spread, color: color.wrappedValue)
        blur.listen {
            self.value = Self.makeValue(h: h, v: v, blur: $0, spread: spread, color: color.wrappedValue)
            self._changeHandler()
        }
        color.listen {
            self.value = Self.makeValue(h: h, v: v, blur: blur.wrappedValue, spread: spread, color: $0)
            self._changeHandler()
        }
    }
    
    // MARK: D E
    public convenience init <D, E, H: UnitValuable, V: UnitValuable>(h: H, v: V, blur: NumericValue? = nil, spread: D, color: E) where D: StateConvertible, D.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color> {
        let spread = spread.stateValue
        let color = color.stateValue
        self.init(h: h, v: v, blur: blur, spread: spread.wrappedValue, color: color.wrappedValue)
        spread.listen {
            self.value = Self.makeValue(h: h, v: v, blur: blur, spread: $0, color: color.wrappedValue)
            self._changeHandler()
        }
        color.listen {
            self.value = Self.makeValue(h: h, v: v, blur: blur, spread: spread.wrappedValue, color: $0)
            self._changeHandler()
        }
    }
    
    // MARK: A B C
    public convenience init <A, B, C>(h: A, v: B, blur: C, spread: NumericValue? = nil, color: Color? = nil) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue> {
        let h = h.stateValue
        let v = v.stateValue
        let blur = blur.stateValue
        self.init(h: h.wrappedValue, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread, color: color)
        h.listen {
            self.value = Self.makeValue(h: $0, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread, color: color)
            self._changeHandler()
        }
        v.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: $0, blur: blur.wrappedValue, spread: spread, color: color)
            self._changeHandler()
        }
        blur.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v.wrappedValue, blur: $0, spread: spread, color: color)
            self._changeHandler()
        }
    }
    
    // MARK: A B D
    public convenience init <A, B, D>(h: A, v: B, blur: NumericValue? = nil, spread: D, color: Color? = nil) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, D: StateConvertible, D.Value == Optional<NumericValue> {
        let h = h.stateValue
        let v = v.stateValue
        let spread = spread.stateValue
        self.init(h: h.wrappedValue, v: v.wrappedValue, blur: blur, spread: spread.wrappedValue, color: color)
        h.listen {
            self.value = Self.makeValue(h: $0, v: v.wrappedValue, blur: blur, spread: spread.wrappedValue, color: color)
            self._changeHandler()
        }
        v.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: $0, blur: blur, spread: spread.wrappedValue, color: color)
            self._changeHandler()
        }
        spread.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v.wrappedValue, blur: blur, spread: $0, color: color)
            self._changeHandler()
        }
    }
    
    // MARK: A B E
    public convenience init <A, B, E>(h: A, v: B, blur: NumericValue? = nil, spread: NumericValue? = nil, color: E) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, E: StateConvertible, E.Value == Optional<Color> {
        let h = h.stateValue
        let v = v.stateValue
        let color = color.stateValue
        self.init(h: h.wrappedValue, v: v.wrappedValue, blur: blur, spread: spread, color: color.wrappedValue)
        h.listen {
            self.value = Self.makeValue(h: $0, v: v.wrappedValue, blur: blur, spread: spread, color: color.wrappedValue)
            self._changeHandler()
        }
        v.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: $0, blur: blur, spread: spread, color: color.wrappedValue)
            self._changeHandler()
        }
        color.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v.wrappedValue, blur: blur, spread: spread, color: $0)
            self._changeHandler()
        }
    }
    
    // MARK: B C D
    public convenience init <B, C, D, H: UnitValuable>(h: H, v: B, blur: C, spread: D, color: Color? = nil) where B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue> {
        let v = v.stateValue
        let blur = blur.stateValue
        let spread = spread.stateValue
        self.init(h: h, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread.wrappedValue, color: color)
        v.listen {
            self.value = Self.makeValue(h: h, v: $0, blur: blur.wrappedValue, spread: spread.wrappedValue, color: color)
            self._changeHandler()
        }
        blur.listen {
            self.value = Self.makeValue(h: h, v: v.wrappedValue, blur: $0, spread: spread.wrappedValue, color: color)
            self._changeHandler()
        }
        spread.listen {
            self.value = Self.makeValue(h: h, v: v.wrappedValue, blur: blur.wrappedValue, spread: $0, color: color)
            self._changeHandler()
        }
    }
    
    // MARK: B C E
    public convenience init <B, C, E, H: UnitValuable>(h: H, v: B, blur: C, spread: NumericValue? = nil, color: E) where B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color> {
        let v = v.stateValue
        let blur = blur.stateValue
        let color = color.stateValue
        self.init(h: h, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread, color: color.wrappedValue)
        v.listen {
            self.value = Self.makeValue(h: h, v: $0, blur: blur.wrappedValue, spread: spread, color: color.wrappedValue)
            self._changeHandler()
        }
        blur.listen {
            self.value = Self.makeValue(h: h, v: v.wrappedValue, blur: $0, spread: spread, color: color.wrappedValue)
            self._changeHandler()
        }
        color.listen {
            self.value = Self.makeValue(h: h, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread, color: $0)
            self._changeHandler()
        }
    }
    
    // MARK: A C D
    public convenience init <A, C, D, V: UnitValuable>(h: A, v: V, blur: C, spread: D, color: Color? = nil) where A: StateConvertible, A.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue> {
        let h = h.stateValue
        let blur = blur.stateValue
        let spread = spread.stateValue
        self.init(h: h.wrappedValue, v: v, blur: blur.wrappedValue, spread: spread.wrappedValue, color: color)
        h.listen {
            self.value = Self.makeValue(h: $0, v: v, blur: blur.wrappedValue, spread: spread.wrappedValue, color: color)
            self._changeHandler()
        }
        blur.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v, blur: $0, spread: spread.wrappedValue, color: color)
            self._changeHandler()
        }
        spread.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v, blur: blur.wrappedValue, spread: $0, color: color)
            self._changeHandler()
        }
    }
    
    // MARK: A C E
    public convenience init <A, C, E, V: UnitValuable>(h: A, v: V, blur: C, spread: NumericValue? = nil, color: E) where A: StateConvertible, A.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color> {
        let h = h.stateValue
        let blur = blur.stateValue
        let color = color.stateValue
        self.init(h: h.wrappedValue, v: v, blur: blur.wrappedValue, spread: spread, color: color.wrappedValue)
        h.listen {
            self.value = Self.makeValue(h: $0, v: v, blur: blur.wrappedValue, spread: spread, color: color.wrappedValue)
            self._changeHandler()
        }
        blur.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v, blur: $0, spread: spread, color: color.wrappedValue)
            self._changeHandler()
        }
        color.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v, blur: blur.wrappedValue, spread: spread, color: $0)
            self._changeHandler()
        }
    }
    
    // MARK: A B C D
    public convenience init <A, B, C, D>(h: A, v: B, blur: C, spread: D, color: Color? = nil) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue> {
        let h = h.stateValue
        let v = v.stateValue
        let blur = blur.stateValue
        let spread = spread.stateValue
        self.init(h: h.wrappedValue, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread.wrappedValue, color: color)
        h.listen {
            self.value = Self.makeValue(h: $0, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread.wrappedValue, color: color)
            self._changeHandler()
        }
        v.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: $0, blur: blur.wrappedValue, spread: spread.wrappedValue, color: color)
            self._changeHandler()
        }
        blur.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v.wrappedValue, blur: $0, spread: spread.wrappedValue, color: color)
            self._changeHandler()
        }
        spread.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v.wrappedValue, blur: blur.wrappedValue, spread: $0, color: color)
            self._changeHandler()
        }
    }
    
    // MARK: A B C E
    public convenience init <A, B, C, E>(h: A, v: B, blur: C, spread: NumericValue? = nil, color: E) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color> {
        let h = h.stateValue
        let v = v.stateValue
        let blur = blur.stateValue
        let color = color.stateValue
        self.init(h: h.wrappedValue, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread, color: color.wrappedValue)
        h.listen {
            self.value = Self.makeValue(h: $0, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread, color: color.wrappedValue)
            self._changeHandler()
        }
        v.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: $0, blur: blur.wrappedValue, spread: spread, color: color.wrappedValue)
            self._changeHandler()
        }
        blur.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v.wrappedValue, blur: $0, spread: spread, color: color.wrappedValue)
            self._changeHandler()
        }
        color.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread, color: $0)
            self._changeHandler()
        }
    }
    
    // MARK: B C D E
    public convenience init <B, C, D, E, H: UnitValuable>(h: H, v: B, blur: C, spread: D, color: E) where B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color> {
        let v = v.stateValue
        let blur = blur.stateValue
        let spread = spread.stateValue
        let color = color.stateValue
        self.init(h: h, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread.wrappedValue, color: color.wrappedValue)
        v.listen {
            self.value = Self.makeValue(h: h, v: $0, blur: blur.wrappedValue, spread: spread.wrappedValue, color: color.wrappedValue)
            self._changeHandler()
        }
        blur.listen {
            self.value = Self.makeValue(h: h, v: v.wrappedValue, blur: $0, spread: spread.wrappedValue, color: color.wrappedValue)
            self._changeHandler()
        }
        spread.listen {
            self.value = Self.makeValue(h: h, v: v.wrappedValue, blur: blur.wrappedValue, spread: $0, color: color.wrappedValue)
            self._changeHandler()
        }
        color.listen {
            self.value = Self.makeValue(h: h, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread.wrappedValue, color: $0)
            self._changeHandler()
        }
    }
    
    // MARK: A B C D E
    public convenience init <A, B, C, D, E>(h: A, v: B, blur: C, spread: D, color: E) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color> {
        let h = h.stateValue
        let v = v.stateValue
        let blur = blur.stateValue
        let spread = spread.stateValue
        let color = color.stateValue
        self.init(h: h.wrappedValue, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread.wrappedValue, color: color.wrappedValue)
        h.listen {
            self.value = Self.makeValue(h: $0, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread.wrappedValue, color: color.wrappedValue)
            self._changeHandler()
        }
        v.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: $0, blur: blur.wrappedValue, spread: spread.wrappedValue, color: color.wrappedValue)
            self._changeHandler()
        }
        blur.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v.wrappedValue, blur: $0, spread: spread.wrappedValue, color: color.wrappedValue)
            self._changeHandler()
        }
        spread.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v.wrappedValue, blur: blur.wrappedValue, spread: $0, color: color.wrappedValue)
            self._changeHandler()
        }
        color.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread.wrappedValue, color: $0)
            self._changeHandler()
        }
    }
    
    public var description: String { value }
}

extension Stylesheet {
    /// Attaches one or more shadows to an element
    public typealias BoxShadow = BoxShadowProperty
}

extension CSSRulable {
    /// Attaches one or more shadows to an element
    public func boxShadow<H: UnitValuable, V: UnitValuable>(h: H, v: V, blur: NumericValue? = nil, spread: NumericValue? = nil, color: Color? = nil) -> Self {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color))
        return self
    }
    
    // MARK: A
    public func boxShadow<A, V: UnitValuable>(h: A, v: V, blur: NumericValue? = nil, spread: NumericValue? = nil, color: Color? = nil) -> Self where A: StateConvertible, A.Value: UnitValuable {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color))
        return self
    }
    
    // MARK: B
    public func boxShadow<B, H: UnitValuable>(h: H, v: B, blur: NumericValue? = nil, spread: NumericValue? = nil, color: Color? = nil) -> Self where B: StateConvertible, B.Value: UnitValuable {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color))
        return self
    }
    
    // MARK: C
    public func boxShadow<C, H: UnitValuable, V: UnitValuable>(h: H, v: V, blur: C, spread: NumericValue? = nil, color: Color? = nil) -> Self where C: StateConvertible, C.Value == Optional<NumericValue> {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color))
        return self
    }
    
    // MARK: D
    public func boxShadow<D, H: UnitValuable, V: UnitValuable>(h: H, v: V, blur: NumericValue? = nil, spread: D, color: Color? = nil) -> Self where D: StateConvertible, D.Value == Optional<NumericValue> {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color))
        return self
    }
    
    // MARK: E
    public func boxShadow<E, H: UnitValuable, V: UnitValuable>(h: H, v: V, blur: NumericValue? = nil, spread: NumericValue? = nil, color: E) -> Self where E: StateConvertible, E.Value == Optional<Color> {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color))
        return self
    }
    
    // MARK: A B
    public func boxShadow<A, B>(h: A, v: B, blur: NumericValue? = nil, spread: NumericValue? = nil, color: Color? = nil) -> Self where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color))
        return self
    }
    
    // MARK: A C
    public func boxShadow<A, C, V: UnitValuable>(h: A, v: V, blur: C, spread: NumericValue? = nil, color: Color? = nil) -> Self where A: StateConvertible, A.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue> {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color))
        return self
    }
    
    // MARK: A D
    public func boxShadow<A, D, V: UnitValuable>(h: A, v: V, blur: NumericValue? = nil, spread: D, color: Color? = nil) -> Self where A: StateConvertible, A.Value: UnitValuable, D: StateConvertible, D.Value == Optional<NumericValue> {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color))
        return self
    }
    
    // MARK: A E
    public func boxShadow<A, E, V: UnitValuable>(h: A, v: V, blur: NumericValue? = nil, spread: NumericValue? = nil, color: E) -> Self where A: StateConvertible, A.Value: UnitValuable, E: StateConvertible, E.Value == Optional<Color> {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color))
        return self
    }
    
    // MARK: B C
    public func boxShadow<B, C, H: UnitValuable>(h: H, v: B, blur: C, spread: NumericValue? = nil, color: Color? = nil) -> Self where B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue> {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color))
        return self
    }
    
    // MARK: B D
    public func boxShadow<B, D, H: UnitValuable>(h: H, v: B, blur: NumericValue? = nil, spread: D, color: Color? = nil) -> Self where B: StateConvertible, B.Value: UnitValuable, D: StateConvertible, D.Value == Optional<NumericValue> {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color))
        return self
    }
    
    // MARK: B E
    public func boxShadow<B, E, H: UnitValuable>(h: H, v: B, blur: NumericValue? = nil, spread: NumericValue? = nil, color: E) -> Self where B: StateConvertible, B.Value: UnitValuable, E: StateConvertible, E.Value == Optional<Color> {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color))
        return self
    }
    
    // MARK: C D
    public func boxShadow<C, D, H: UnitValuable, V: UnitValuable>(h: H, v: V, blur: C, spread: D, color: Color? = nil) -> Self where C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue> {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color))
        return self
    }
    
    // MARK: C E
    public func boxShadow<C, E, H: UnitValuable, V: UnitValuable>(h: H, v: V, blur: C, spread: NumericValue? = nil, color: E) -> Self where C: StateConvertible, C.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color> {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color))
        return self
    }
    
    // MARK: D E
    public func boxShadow<D, E, H: UnitValuable, V: UnitValuable>(h: H, v: V, blur: NumericValue? = nil, spread: D, color: E) -> Self where D: StateConvertible, D.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color> {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color))
        return self
    }
    
    // MARK: A B C
    public func boxShadow<A, B, C>(h: A, v: B, blur: C, spread: NumericValue? = nil, color: Color? = nil) -> Self where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue> {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color))
        return self
    }
    
    // MARK: A B D
    public func boxShadow<A, B, D>(h: A, v: B, blur: NumericValue? = nil, spread: D, color: Color? = nil) -> Self where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, D: StateConvertible, D.Value == Optional<NumericValue> {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color))
        return self
    }
    
    // MARK: A B E
    public func boxShadow<A, B, E>(h: A, v: B, blur: NumericValue? = nil, spread: NumericValue? = nil, color: E) -> Self where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, E: StateConvertible, E.Value == Optional<Color> {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color))
        return self
    }
    
    // MARK: B C D
    public func boxShadow<B, C, D, H: UnitValuable>(h: H, v: B, blur: C, spread: D, color: Color? = nil) -> Self where B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue> {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color))
        return self
    }
    
    // MARK: B C E
    public func boxShadow<B, C, E, H: UnitValuable>(h: H, v: B, blur: C, spread: NumericValue? = nil, color: E) -> Self where B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color> {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color))
        return self
    }
    
    // MARK: A C D
    public func boxShadow<A, C, D, V: UnitValuable>(h: A, v: V, blur: C, spread: D, color: Color? = nil) -> Self where A: StateConvertible, A.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue> {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color))
        return self
    }
    
    // MARK: A C E
    public func boxShadow<A, C, E, V: UnitValuable>(h: A, v: V, blur: C, spread: NumericValue? = nil, color: E) -> Self where A: StateConvertible, A.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color> {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color))
        return self
    }
    
    // MARK: A B C D
    public func boxShadow<A, B, C, D>(h: A, v: B, blur: C, spread: D, color: Color? = nil) -> Self where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue> {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color))
        return self
    }
    
    // MARK: A B C E
    public func boxShadow<A, B, C, E>(h: A, v: B, blur: C, spread: NumericValue? = nil, color: E) -> Self where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color> {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color))
        return self
    }
    
    // MARK: B C D E
    public func boxShadow<B, C, D, E, H: UnitValuable>(h: H, v: B, blur: C, spread: D, color: E) -> Self where B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color> {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color))
        return self
    }
    
    // MARK: A B C D E
    public func boxShadow<A, B, C, D, E>(h: A, v: B, blur: C, spread: D, color: E) -> Self where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color> {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color))
        return self
    }
}
