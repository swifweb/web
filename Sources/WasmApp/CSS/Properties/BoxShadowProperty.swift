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
/// box-shadow: 5px 5px blue, 10px 10px red, 15px 15px green;
/// box-shadow: 5px 10px inset;
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_box-shadow.asp)
public class BoxShadowProperty: _Property {
    public var propertyKey: PropertyKey<BoxShadowValue> { .boxShadow }
    public var propertyValue: BoxShadowValue
    var _content = _PropertyContent<BoxShadowValue>()
    
    /// Use it for multiple shadows
    public init (_ values: [BoxShadowValue]) {
        propertyValue = BoxShadowValue(values)
    }
    
    /// Use it for multiple shadows
    public init (_ values: BoxShadowValue...) {
        propertyValue = BoxShadowValue(values)
    }
    
    /// Use it for multiple shadows
    public init <V>(_ values: V) where V: StateConvertible, V.Value == [BoxShadowValue] {
        propertyValue = BoxShadowValue(values)
    }
    
    public init <V>(_ values: V) where V: StateConvertible, V.Value == BoxShadowValue {
        propertyValue = BoxShadowValue(values)
    }
    
    public init<H: UnitValuable, V: UnitValuable>(h: H, v: V, blur: NumericValue? = nil, spread: NumericValue? = nil, color: Color? = nil, inset: Bool = false) {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    
    // MARK: A
    public init <A, V: UnitValuable>(h: A, v: V, blur: NumericValue? = nil, spread: NumericValue? = nil, color: Color? = nil, inset: Bool = false) where A: StateConvertible, A.Value: UnitValuable {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    public init <A, V: UnitValuable, I>(h: A, v: V, blur: NumericValue? = nil, spread: NumericValue? = nil, color: Color? = nil, inset: I) where A: StateConvertible, A.Value: UnitValuable, I: StateConvertible, I.Value == Bool {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    
    // MARK: B
    public init <B, H: UnitValuable>(h: H, v: B, blur: NumericValue? = nil, spread: NumericValue? = nil, color: Color? = nil, inset: Bool = false) where B: StateConvertible, B.Value: UnitValuable {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    public init <B, H: UnitValuable, I>(h: H, v: B, blur: NumericValue? = nil, spread: NumericValue? = nil, color: Color? = nil, inset: I) where B: StateConvertible, B.Value: UnitValuable, I: StateConvertible, I.Value == Bool {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    
    // MARK: C
    public init <C, H: UnitValuable, V: UnitValuable>(h: H, v: V, blur: C, spread: NumericValue? = nil, color: Color? = nil, inset: Bool = false) where C: StateConvertible, C.Value == Optional<NumericValue> {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    public init <C, H: UnitValuable, V: UnitValuable, I>(h: H, v: V, blur: C, spread: NumericValue? = nil, color: Color? = nil, inset: I) where C: StateConvertible, C.Value == Optional<NumericValue>, I: StateConvertible, I.Value == Bool {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    
    // MARK: D
    public init <D, H: UnitValuable, V: UnitValuable>(h: H, v: V, blur: NumericValue? = nil, spread: D, color: Color? = nil, inset: Bool = false) where D: StateConvertible, D.Value == Optional<NumericValue> {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    public init <D, H: UnitValuable, V: UnitValuable, I>(h: H, v: V, blur: NumericValue? = nil, spread: D, color: Color? = nil, inset: I) where D: StateConvertible, D.Value == Optional<NumericValue>, I: StateConvertible, I.Value == Bool {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    
    // MARK: E
    public init <E, H: UnitValuable, V: UnitValuable>(h: H, v: V, blur: NumericValue? = nil, spread: NumericValue? = nil, color: E, inset: Bool = false) where E: StateConvertible, E.Value == Optional<Color> {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    public init <E, H: UnitValuable, V: UnitValuable, I>(h: H, v: V, blur: NumericValue? = nil, spread: NumericValue? = nil, color: E, inset: I) where E: StateConvertible, E.Value == Optional<Color>, I: StateConvertible, I.Value == Bool {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    
    // MARK: A B
    public init <A, B>(h: A, v: B, blur: NumericValue? = nil, spread: NumericValue? = nil, color: Color? = nil, inset: Bool = false) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    public init <A, B, I>(h: A, v: B, blur: NumericValue? = nil, spread: NumericValue? = nil, color: Color? = nil, inset: I) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, I: StateConvertible, I.Value == Bool {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    
    // MARK: A C
    public init <A, C, V: UnitValuable>(h: A, v: V, blur: C, spread: NumericValue? = nil, color: Color? = nil, inset: Bool = false) where A: StateConvertible, A.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue> {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    public init <A, C, V: UnitValuable, I>(h: A, v: V, blur: C, spread: NumericValue? = nil, color: Color? = nil, inset: I) where A: StateConvertible, A.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, I: StateConvertible, I.Value == Bool {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    
    // MARK: A D
    public init <A, D, V: UnitValuable>(h: A, v: V, blur: NumericValue? = nil, spread: D, color: Color? = nil, inset: Bool = false) where A: StateConvertible, A.Value: UnitValuable, D: StateConvertible, D.Value == Optional<NumericValue> {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    public init <A, D, V: UnitValuable, I>(h: A, v: V, blur: NumericValue? = nil, spread: D, color: Color? = nil, inset: I) where A: StateConvertible, A.Value: UnitValuable, D: StateConvertible, D.Value == Optional<NumericValue>, I: StateConvertible, I.Value == Bool {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    
    // MARK: A E
    public init <A, E, V: UnitValuable>(h: A, v: V, blur: NumericValue? = nil, spread: NumericValue? = nil, color: E, inset: Bool = false) where A: StateConvertible, A.Value: UnitValuable, E: StateConvertible, E.Value == Optional<Color> {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    public init <A, E, V: UnitValuable, I>(h: A, v: V, blur: NumericValue? = nil, spread: NumericValue? = nil, color: E, inset: I) where A: StateConvertible, A.Value: UnitValuable, E: StateConvertible, E.Value == Optional<Color>, I: StateConvertible, I.Value == Bool {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    
    // MARK: B C
    public init <B, C, H: UnitValuable>(h: H, v: B, blur: C, spread: NumericValue? = nil, color: Color? = nil, inset: Bool = false) where B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue> {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    public init <B, C, H: UnitValuable, I>(h: H, v: B, blur: C, spread: NumericValue? = nil, color: Color? = nil, inset: I) where B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, I: StateConvertible, I.Value == Bool {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    
    // MARK: B D
    public init <B, D, H: UnitValuable>(h: H, v: B, blur: NumericValue? = nil, spread: D, color: Color? = nil, inset: Bool = false) where B: StateConvertible, B.Value: UnitValuable, D: StateConvertible, D.Value == Optional<NumericValue> {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    public init <B, D, H: UnitValuable, I>(h: H, v: B, blur: NumericValue? = nil, spread: D, color: Color? = nil, inset: I) where B: StateConvertible, B.Value: UnitValuable, D: StateConvertible, D.Value == Optional<NumericValue>, I: StateConvertible, I.Value == Bool {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    
    // MARK: B E
    public init <B, E, H: UnitValuable>(h: H, v: B, blur: NumericValue? = nil, spread: NumericValue? = nil, color: E, inset: Bool = false) where B: StateConvertible, B.Value: UnitValuable, E: StateConvertible, E.Value == Optional<Color> {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    public init <B, E, H: UnitValuable, I>(h: H, v: B, blur: NumericValue? = nil, spread: NumericValue? = nil, color: E, inset: I) where B: StateConvertible, B.Value: UnitValuable, E: StateConvertible, E.Value == Optional<Color>, I: StateConvertible, I.Value == Bool {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    
    // MARK: C D
    public init <C, D, H: UnitValuable, V: UnitValuable>(h: H, v: V, blur: C, spread: D, color: Color? = nil, inset: Bool = false) where C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue> {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    public init <C, D, H: UnitValuable, V: UnitValuable, I>(h: H, v: V, blur: C, spread: D, color: Color? = nil, inset: I) where C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue>, I: StateConvertible, I.Value == Bool {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    
    // MARK: C E
    public init <C, E, H: UnitValuable, V: UnitValuable>(h: H, v: V, blur: C, spread: NumericValue? = nil, color: E, inset: Bool = false) where C: StateConvertible, C.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color> {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    public init <C, E, H: UnitValuable, V: UnitValuable, I>(h: H, v: V, blur: C, spread: NumericValue? = nil, color: E, inset: I) where C: StateConvertible, C.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color>, I: StateConvertible, I.Value == Bool {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    
    // MARK: D E
    public init <D, E, H: UnitValuable, V: UnitValuable>(h: H, v: V, blur: NumericValue? = nil, spread: D, color: E, inset: Bool = false) where D: StateConvertible, D.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color> {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    public init <D, E, H: UnitValuable, V: UnitValuable, I>(h: H, v: V, blur: NumericValue? = nil, spread: D, color: E, inset: I) where D: StateConvertible, D.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color>, I: StateConvertible, I.Value == Bool {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    
    // MARK: A B C
    public init <A, B, C>(h: A, v: B, blur: C, spread: NumericValue? = nil, color: Color? = nil, inset: Bool = false) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue> {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    public init <A, B, C, I>(h: A, v: B, blur: C, spread: NumericValue? = nil, color: Color? = nil, inset: I) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, I: StateConvertible, I.Value == Bool {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    
    // MARK: A B D
    public init <A, B, D>(h: A, v: B, blur: NumericValue? = nil, spread: D, color: Color? = nil, inset: Bool = false) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, D: StateConvertible, D.Value == Optional<NumericValue> {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    public init <A, B, D, I>(h: A, v: B, blur: NumericValue? = nil, spread: D, color: Color? = nil, inset: I) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, D: StateConvertible, D.Value == Optional<NumericValue>, I: StateConvertible, I.Value == Bool {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    
    // MARK: A B E
    public init <A, B, E>(h: A, v: B, blur: NumericValue? = nil, spread: NumericValue? = nil, color: E, inset: Bool = false) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, E: StateConvertible, E.Value == Optional<Color> {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    public init <A, B, E, I>(h: A, v: B, blur: NumericValue? = nil, spread: NumericValue? = nil, color: E, inset: I) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, E: StateConvertible, E.Value == Optional<Color>, I: StateConvertible, I.Value == Bool {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    
    // MARK: B C D
    public init <B, C, D, H: UnitValuable>(h: H, v: B, blur: C, spread: D, color: Color? = nil, inset: Bool = false) where B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue> {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    public init <B, C, D, H: UnitValuable, I>(h: H, v: B, blur: C, spread: D, color: Color? = nil, inset: I) where B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue>, I: StateConvertible, I.Value == Bool {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    
    // MARK: B C E
    public init <B, C, E, H: UnitValuable>(h: H, v: B, blur: C, spread: NumericValue? = nil, color: E, inset: Bool = false) where B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color> {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    public init <B, C, E, H: UnitValuable, I>(h: H, v: B, blur: C, spread: NumericValue? = nil, color: E, inset: I) where B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color>, I: StateConvertible, I.Value == Bool {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    
    // MARK: A C D
    public init <A, C, D, V: UnitValuable>(h: A, v: V, blur: C, spread: D, color: Color? = nil, inset: Bool = false) where A: StateConvertible, A.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue> {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    public init <A, C, D, V: UnitValuable, I>(h: A, v: V, blur: C, spread: D, color: Color? = nil, inset: I) where A: StateConvertible, A.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue>, I: StateConvertible, I.Value == Bool {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    
    // MARK: A C E
    public init <A, C, E, V: UnitValuable>(h: A, v: V, blur: C, spread: NumericValue? = nil, color: E, inset: Bool = false) where A: StateConvertible, A.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color> {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    public init <A, C, E, V: UnitValuable, I>(h: A, v: V, blur: C, spread: NumericValue? = nil, color: E, inset: I) where A: StateConvertible, A.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color>, I: StateConvertible, I.Value == Bool {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    
    // MARK: A B C D
    public init <A, B, C, D>(h: A, v: B, blur: C, spread: D, color: Color? = nil, inset: Bool = false) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue> {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    public init <A, B, C, D, I>(h: A, v: B, blur: C, spread: D, color: Color? = nil, inset: I) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue>, I: StateConvertible, I.Value == Bool {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    
    // MARK: A B C E
    public init <A, B, C, E>(h: A, v: B, blur: C, spread: NumericValue? = nil, color: E, inset: Bool = false) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color> {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    public init <A, B, C, E, I>(h: A, v: B, blur: C, spread: NumericValue? = nil, color: E, inset: I) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color>, I: StateConvertible, I.Value == Bool {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    
    // MARK: B C D E
    public init <B, C, D, E, H: UnitValuable>(h: H, v: B, blur: C, spread: D, color: E, inset: Bool = false) where B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color> {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    public init <B, C, D, E, H: UnitValuable, I>(h: H, v: B, blur: C, spread: D, color: E, inset: I) where B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color>, I: StateConvertible, I.Value == Bool {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    
    // MARK: A B C D E
    public init <A, B, C, D, E>(h: A, v: B, blur: C, spread: D, color: E, inset: Bool = false) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color> {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    public init <A, B, C, D, E, I>(h: A, v: B, blur: C, spread: D, color: E, inset: I) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color>, I: StateConvertible, I.Value == Bool {
        propertyValue = BoxShadowValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
}

extension PropertyKey {
    /// Attaches one or more shadows to an element
    public static var boxShadow: PropertyKey<BoxShadowValue> { "box-shadow".propertyKey() }
}

public class BoxShadowValue: CustomStringConvertible, _PropertyValueInnerChangeable {
    public var value: String
    
    var _changeHandler = {}
    
    private static func makeValue<H: UnitValuable, V: UnitValuable>(h: H, v: V, blur: NumericValue? = nil, spread: NumericValue? = nil, color: Color? = nil, inset: Bool) -> String {
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
        if inset {
            elements.append("inset")
        }
        return elements.joined(separator: " ")
    }
    
    private static func makeMultiple(_ values: [BoxShadowValue]) -> String {
        values.map { $0.value }.joined(separator: ", ")
    }
    
    /// Use it for multiple shadows
    public init (_ values: [BoxShadowValue]) {
        value = Self.makeMultiple(values)
    }
    
    /// Use it for multiple shadows
    public convenience init (_ values: BoxShadowValue...) {
        self.init(values)
    }
    
    /// Use it for multiple shadows
    public convenience init <V>(_ values: V) where V: StateConvertible, V.Value == [BoxShadowValue] {
        let values = values.stateValue
        self.init(values.wrappedValue)
        values.listen {
            self.value = Self.makeMultiple($0)
            self._changeHandler()
        }
    }
    
    public convenience init <V>(_ values: V) where V: StateConvertible, V.Value == BoxShadowValue {
        let values = values.stateValue
        self.init(values.wrappedValue)
        values.listen {
            self.value = Self.makeMultiple([$0])
            self._changeHandler()
        }
    }
    
    public init<H: UnitValuable, V: UnitValuable>(h: H, v: V, blur: NumericValue? = nil, spread: NumericValue? = nil, color: Color? = nil, inset: Bool = false) {
        value = Self.makeValue(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset)
    }
    
    // MARK: A
    public convenience init <A, V: UnitValuable>(h: A, v: V, blur: NumericValue? = nil, spread: NumericValue? = nil, color: Color? = nil, inset: Bool = false) where A: StateConvertible, A.Value: UnitValuable {
        let h = h.stateValue
        self.init(h: h.wrappedValue, v: v, blur: blur, spread: spread, color: color, inset: inset)
        h.listen {
            self.value = Self.makeValue(h: $0, v: v, blur: blur, spread: spread, color: color, inset: inset)
            self._changeHandler()
        }
    }
    public convenience init <A, V: UnitValuable, I>(h: A, v: V, blur: NumericValue? = nil, spread: NumericValue? = nil, color: Color? = nil, inset: I) where A: StateConvertible, A.Value: UnitValuable, I: StateConvertible, I.Value == Bool {
        let h = h.stateValue
        let inset = inset.stateValue
        self.init(h: h.wrappedValue, v: v, blur: blur, spread: spread, color: color, inset: inset.wrappedValue)
        h.listen {
            self.value = Self.makeValue(h: $0, v: v, blur: blur, spread: spread, color: color, inset: inset.wrappedValue)
            self._changeHandler()
        }
        inset.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v, blur: blur, spread: spread, color: color, inset: $0)
            self._changeHandler()
        }
    }
    
    // MARK: B
    public convenience init <B, H: UnitValuable>(h: H, v: B, blur: NumericValue? = nil, spread: NumericValue? = nil, color: Color? = nil, inset: Bool = false) where B: StateConvertible, B.Value: UnitValuable {
        let v = v.stateValue
        self.init(h: h, v: v.wrappedValue, blur: blur, spread: spread, color: color, inset: inset)
        v.listen {
            self.value = Self.makeValue(h: h, v: $0, blur: blur, spread: spread, color: color, inset: inset)
            self._changeHandler()
        }
    }
    public convenience init <B, H: UnitValuable, I>(h: H, v: B, blur: NumericValue? = nil, spread: NumericValue? = nil, color: Color? = nil, inset: I) where B: StateConvertible, B.Value: UnitValuable, I: StateConvertible, I.Value == Bool {
        let v = v.stateValue
        let inset = inset.stateValue
        self.init(h: h, v: v.wrappedValue, blur: blur, spread: spread, color: color, inset: inset.wrappedValue)
        v.listen {
            self.value = Self.makeValue(h: h, v: $0, blur: blur, spread: spread, color: color, inset: inset.wrappedValue)
            self._changeHandler()
        }
        inset.listen {
            self.value = Self.makeValue(h: h, v: v.wrappedValue, blur: blur, spread: spread, color: color, inset: $0)
            self._changeHandler()
        }
    }
    
    // MARK: C
    public convenience init <C, H: UnitValuable, V: UnitValuable>(h: H, v: V, blur: C, spread: NumericValue? = nil, color: Color? = nil, inset: Bool = false) where C: StateConvertible, C.Value == Optional<NumericValue> {
        let blur = blur.stateValue
        self.init(h: h, v: v, blur: blur.wrappedValue, spread: spread, color: color, inset: inset)
        blur.listen {
            self.value = Self.makeValue(h: h, v: v, blur: $0, spread: spread, color: color, inset: inset)
            self._changeHandler()
        }
    }
    public convenience init <C, H: UnitValuable, V: UnitValuable, I>(h: H, v: V, blur: C, spread: NumericValue? = nil, color: Color? = nil, inset: I) where C: StateConvertible, C.Value == Optional<NumericValue>, I: StateConvertible, I.Value == Bool {
        let blur = blur.stateValue
        let inset = inset.stateValue
        self.init(h: h, v: v, blur: blur.wrappedValue, spread: spread, color: color, inset: inset.wrappedValue)
        blur.listen {
            self.value = Self.makeValue(h: h, v: v, blur: $0, spread: spread, color: color, inset: inset.wrappedValue)
            self._changeHandler()
        }
        inset.listen {
            self.value = Self.makeValue(h: h, v: v, blur: blur.wrappedValue, spread: spread, color: color, inset: $0)
            self._changeHandler()
        }
    }
    
    // MARK: D
    public convenience init <D, H: UnitValuable, V: UnitValuable>(h: H, v: V, blur: NumericValue? = nil, spread: D, color: Color? = nil, inset: Bool = false) where D: StateConvertible, D.Value == Optional<NumericValue> {
        let spread = spread.stateValue
        self.init(h: h, v: v, blur: blur, spread: spread.wrappedValue, color: color, inset: inset)
        spread.listen {
            self.value = Self.makeValue(h: h, v: v, blur: blur, spread: $0, color: color, inset: inset)
            self._changeHandler()
        }
    }
    public convenience init <D, H: UnitValuable, V: UnitValuable, I>(h: H, v: V, blur: NumericValue? = nil, spread: D, color: Color? = nil, inset: I) where D: StateConvertible, D.Value == Optional<NumericValue>, I: StateConvertible, I.Value == Bool {
        let spread = spread.stateValue
        let inset = inset.stateValue
        self.init(h: h, v: v, blur: blur, spread: spread.wrappedValue, color: color, inset: inset.wrappedValue)
        spread.listen {
            self.value = Self.makeValue(h: h, v: v, blur: blur, spread: $0, color: color, inset: inset.wrappedValue)
            self._changeHandler()
        }
        inset.listen {
            self.value = Self.makeValue(h: h, v: v, blur: blur, spread: spread.wrappedValue, color: color, inset: $0)
            self._changeHandler()
        }
    }
    
    // MARK: E
    public convenience init <E, H: UnitValuable, V: UnitValuable>(h: H, v: V, blur: NumericValue? = nil, spread: NumericValue? = nil, color: E, inset: Bool = false) where E: StateConvertible, E.Value == Optional<Color> {
        let color = color.stateValue
        self.init(h: h, v: v, blur: blur, spread: spread, color: color.wrappedValue, inset: inset)
        color.listen {
            self.value = Self.makeValue(h: h, v: v, blur: blur, spread: spread, color: $0, inset: inset)
            self._changeHandler()
        }
    }
    public convenience init <E, H: UnitValuable, V: UnitValuable, I>(h: H, v: V, blur: NumericValue? = nil, spread: NumericValue? = nil, color: E, inset: I) where E: StateConvertible, E.Value == Optional<Color>, I: StateConvertible, I.Value == Bool {
        let color = color.stateValue
        let inset = inset.stateValue
        self.init(h: h, v: v, blur: blur, spread: spread, color: color.wrappedValue, inset: inset.wrappedValue)
        color.listen {
            self.value = Self.makeValue(h: h, v: v, blur: blur, spread: spread, color: $0, inset: inset.wrappedValue)
            self._changeHandler()
        }
        inset.listen {
            self.value = Self.makeValue(h: h, v: v, blur: blur, spread: spread, color: color.wrappedValue, inset: $0)
            self._changeHandler()
        }
    }
    
    // MARK: A B
    public convenience init <A, B>(h: A, v: B, blur: NumericValue? = nil, spread: NumericValue? = nil, color: Color? = nil, inset: Bool = false) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable {
        let h = h.stateValue
        let v = v.stateValue
        self.init(h: h.wrappedValue, v: v.wrappedValue, blur: blur, spread: spread, color: color, inset: inset)
        h.listen {
            self.value = Self.makeValue(h: $0, v: v.wrappedValue, blur: blur, spread: spread, color: color, inset: inset)
            self._changeHandler()
        }
        v.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: $0, blur: blur, spread: spread, color: color, inset: inset)
            self._changeHandler()
        }
    }
    public convenience init <A, B, I>(h: A, v: B, blur: NumericValue? = nil, spread: NumericValue? = nil, color: Color? = nil, inset: I) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, I: StateConvertible, I.Value == Bool {
        let h = h.stateValue
        let v = v.stateValue
        let inset = inset.stateValue
        self.init(h: h.wrappedValue, v: v.wrappedValue, blur: blur, spread: spread, color: color, inset: inset.wrappedValue)
        h.listen {
            self.value = Self.makeValue(h: $0, v: v.wrappedValue, blur: blur, spread: spread, color: color, inset: inset.wrappedValue)
            self._changeHandler()
        }
        v.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: $0, blur: blur, spread: spread, color: color, inset: inset.wrappedValue)
            self._changeHandler()
        }
        inset.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v.wrappedValue, blur: blur, spread: spread, color: color, inset: $0)
            self._changeHandler()
        }
    }
    
    // MARK: A C
    public convenience init <A, C, V: UnitValuable>(h: A, v: V, blur: C, spread: NumericValue? = nil, color: Color? = nil, inset: Bool = false) where A: StateConvertible, A.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue> {
        let h = h.stateValue
        let blur = blur.stateValue
        self.init(h: h.wrappedValue, v: v, blur: blur.wrappedValue, spread: spread, color: color, inset: inset)
        h.listen {
            self.value = Self.makeValue(h: $0, v: v, blur: blur.wrappedValue, spread: spread, color: color, inset: inset)
            self._changeHandler()
        }
        blur.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v, blur: $0, spread: spread, color: color, inset: inset)
            self._changeHandler()
        }
    }
    public convenience init <A, C, V: UnitValuable, I>(h: A, v: V, blur: C, spread: NumericValue? = nil, color: Color? = nil, inset: I) where A: StateConvertible, A.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, I: StateConvertible, I.Value == Bool {
        let h = h.stateValue
        let blur = blur.stateValue
        let inset = inset.stateValue
        self.init(h: h.wrappedValue, v: v, blur: blur.wrappedValue, spread: spread, color: color, inset: inset.wrappedValue)
        h.listen {
            self.value = Self.makeValue(h: $0, v: v, blur: blur.wrappedValue, spread: spread, color: color, inset: inset.wrappedValue)
            self._changeHandler()
        }
        blur.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v, blur: $0, spread: spread, color: color, inset: inset.wrappedValue)
            self._changeHandler()
        }
        inset.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v, blur: blur.wrappedValue, spread: spread, color: color, inset: $0)
            self._changeHandler()
        }
    }
    
    // MARK: A D
    public convenience init <A, D, V: UnitValuable>(h: A, v: V, blur: NumericValue? = nil, spread: D, color: Color? = nil, inset: Bool = false) where A: StateConvertible, A.Value: UnitValuable, D: StateConvertible, D.Value == Optional<NumericValue> {
        let h = h.stateValue
        let spread = spread.stateValue
        self.init(h: h.wrappedValue, v: v, blur: blur, spread: spread.wrappedValue, color: color, inset: inset)
        h.listen {
            self.value = Self.makeValue(h: $0, v: v, blur: blur, spread: spread.wrappedValue, color: color, inset: inset)
            self._changeHandler()
        }
        spread.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v, blur: blur, spread: $0, color: color, inset: inset)
            self._changeHandler()
        }
    }
    public convenience init <A, D, V: UnitValuable, I>(h: A, v: V, blur: NumericValue? = nil, spread: D, color: Color? = nil, inset: I) where A: StateConvertible, A.Value: UnitValuable, D: StateConvertible, D.Value == Optional<NumericValue>, I: StateConvertible, I.Value == Bool {
        let h = h.stateValue
        let spread = spread.stateValue
        let inset = inset.stateValue
        self.init(h: h.wrappedValue, v: v, blur: blur, spread: spread.wrappedValue, color: color, inset: inset.wrappedValue)
        h.listen {
            self.value = Self.makeValue(h: $0, v: v, blur: blur, spread: spread.wrappedValue, color: color, inset: inset.wrappedValue)
            self._changeHandler()
        }
        spread.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v, blur: blur, spread: $0, color: color, inset: inset.wrappedValue)
            self._changeHandler()
        }
        inset.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v, blur: blur, spread: spread.wrappedValue, color: color, inset: $0)
            self._changeHandler()
        }
    }
    
    // MARK: A E
    public convenience init <A, E, V: UnitValuable>(h: A, v: V, blur: NumericValue? = nil, spread: NumericValue? = nil, color: E, inset: Bool = false) where A: StateConvertible, A.Value: UnitValuable, E: StateConvertible, E.Value == Optional<Color> {
        let h = h.stateValue
        let color = color.stateValue
        self.init(h: h.wrappedValue, v: v, blur: blur, spread: spread, color: color.wrappedValue, inset: inset)
        h.listen {
            self.value = Self.makeValue(h: $0, v: v, blur: blur, spread: spread, color: color.wrappedValue, inset: inset)
            self._changeHandler()
        }
        color.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v, blur: blur, spread: spread, color: $0, inset: inset)
            self._changeHandler()
        }
    }
    public convenience init <A, E, V: UnitValuable, I>(h: A, v: V, blur: NumericValue? = nil, spread: NumericValue? = nil, color: E, inset: I) where A: StateConvertible, A.Value: UnitValuable, E: StateConvertible, E.Value == Optional<Color>, I: StateConvertible, I.Value == Bool {
        let h = h.stateValue
        let color = color.stateValue
        let inset = inset.stateValue
        self.init(h: h.wrappedValue, v: v, blur: blur, spread: spread, color: color.wrappedValue, inset: inset.wrappedValue)
        h.listen {
            self.value = Self.makeValue(h: $0, v: v, blur: blur, spread: spread, color: color.wrappedValue, inset: inset.wrappedValue)
            self._changeHandler()
        }
        color.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v, blur: blur, spread: spread, color: $0, inset: inset.wrappedValue)
            self._changeHandler()
        }
        inset.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v, blur: blur, spread: spread, color: color.wrappedValue, inset: $0)
            self._changeHandler()
        }
    }
    
    // MARK: B C
    public convenience init <B, C, H: UnitValuable>(h: H, v: B, blur: C, spread: NumericValue? = nil, color: Color? = nil, inset: Bool = false) where B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue> {
        let v = v.stateValue
        let blur = blur.stateValue
        self.init(h: h, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread, color: color, inset: inset)
        v.listen {
            self.value = Self.makeValue(h: h, v: $0, blur: blur.wrappedValue, spread: spread, color: color, inset: inset)
            self._changeHandler()
        }
        blur.listen {
            self.value = Self.makeValue(h: h, v: v.wrappedValue, blur: $0, spread: spread, color: color, inset: inset)
            self._changeHandler()
        }
    }
    public convenience init <B, C, H: UnitValuable, I>(h: H, v: B, blur: C, spread: NumericValue? = nil, color: Color? = nil, inset: I) where B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, I: StateConvertible, I.Value == Bool {
        let v = v.stateValue
        let blur = blur.stateValue
        let inset = inset.stateValue
        self.init(h: h, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread, color: color, inset: inset.wrappedValue)
        v.listen {
            self.value = Self.makeValue(h: h, v: $0, blur: blur.wrappedValue, spread: spread, color: color, inset: inset.wrappedValue)
            self._changeHandler()
        }
        blur.listen {
            self.value = Self.makeValue(h: h, v: v.wrappedValue, blur: $0, spread: spread, color: color, inset: inset.wrappedValue)
            self._changeHandler()
        }
        inset.listen {
            self.value = Self.makeValue(h: h, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread, color: color, inset: $0)
            self._changeHandler()
        }
    }
    
    // MARK: B D
    public convenience init <B, D, H: UnitValuable>(h: H, v: B, blur: NumericValue? = nil, spread: D, color: Color? = nil, inset: Bool = false) where B: StateConvertible, B.Value: UnitValuable, D: StateConvertible, D.Value == Optional<NumericValue> {
        let v = v.stateValue
        let spread = spread.stateValue
        self.init(h: h, v: v.wrappedValue, blur: blur, spread: spread.wrappedValue, color: color, inset: inset)
        v.listen {
            self.value = Self.makeValue(h: h, v: $0, blur: blur, spread: spread.wrappedValue, color: color, inset: inset)
            self._changeHandler()
        }
        spread.listen {
            self.value = Self.makeValue(h: h, v: v.wrappedValue, blur: blur, spread: $0, color: color, inset: inset)
            self._changeHandler()
        }
    }
    public convenience init <B, D, H: UnitValuable, I>(h: H, v: B, blur: NumericValue? = nil, spread: D, color: Color? = nil, inset: I) where B: StateConvertible, B.Value: UnitValuable, D: StateConvertible, D.Value == Optional<NumericValue>, I: StateConvertible, I.Value == Bool {
        let v = v.stateValue
        let spread = spread.stateValue
        let inset = inset.stateValue
        self.init(h: h, v: v.wrappedValue, blur: blur, spread: spread.wrappedValue, color: color, inset: inset.wrappedValue)
        v.listen {
            self.value = Self.makeValue(h: h, v: $0, blur: blur, spread: spread.wrappedValue, color: color, inset: inset.wrappedValue)
            self._changeHandler()
        }
        spread.listen {
            self.value = Self.makeValue(h: h, v: v.wrappedValue, blur: blur, spread: $0, color: color, inset: inset.wrappedValue)
            self._changeHandler()
        }
        inset.listen {
            self.value = Self.makeValue(h: h, v: v.wrappedValue, blur: blur, spread: spread.wrappedValue, color: color, inset: $0)
            self._changeHandler()
        }
    }
    
    // MARK: B E
    public convenience init <B, E, H: UnitValuable>(h: H, v: B, blur: NumericValue? = nil, spread: NumericValue? = nil, color: E, inset: Bool = false) where B: StateConvertible, B.Value: UnitValuable, E: StateConvertible, E.Value == Optional<Color> {
        let v = v.stateValue
        let color = color.stateValue
        self.init(h: h, v: v.wrappedValue, blur: blur, spread: spread, color: color.wrappedValue, inset: inset)
        v.listen {
            self.value = Self.makeValue(h: h, v: $0, blur: blur, spread: spread, color: color.wrappedValue, inset: inset)
            self._changeHandler()
        }
        color.listen {
            self.value = Self.makeValue(h: h, v: v.wrappedValue, blur: blur, spread: spread, color: $0, inset: inset)
            self._changeHandler()
        }
    }
    public convenience init <B, E, H: UnitValuable, I>(h: H, v: B, blur: NumericValue? = nil, spread: NumericValue? = nil, color: E, inset: I) where B: StateConvertible, B.Value: UnitValuable, E: StateConvertible, E.Value == Optional<Color>, I: StateConvertible, I.Value == Bool {
        let v = v.stateValue
        let color = color.stateValue
        let inset = inset.stateValue
        self.init(h: h, v: v.wrappedValue, blur: blur, spread: spread, color: color.wrappedValue, inset: inset.wrappedValue)
        v.listen {
            self.value = Self.makeValue(h: h, v: $0, blur: blur, spread: spread, color: color.wrappedValue, inset: inset.wrappedValue)
            self._changeHandler()
        }
        color.listen {
            self.value = Self.makeValue(h: h, v: v.wrappedValue, blur: blur, spread: spread, color: $0, inset: inset.wrappedValue)
            self._changeHandler()
        }
        inset.listen {
            self.value = Self.makeValue(h: h, v: v.wrappedValue, blur: blur, spread: spread, color: color.wrappedValue, inset: $0)
            self._changeHandler()
        }
    }
    
    // MARK: C D
    public convenience init <C, D, H: UnitValuable, V: UnitValuable>(h: H, v: V, blur: C, spread: D, color: Color? = nil, inset: Bool = false) where C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue> {
        let blur = blur.stateValue
        let spread = spread.stateValue
        self.init(h: h, v: v, blur: blur.wrappedValue, spread: spread.wrappedValue, color: color, inset: inset)
        blur.listen {
            self.value = Self.makeValue(h: h, v: v, blur: $0, spread: spread.wrappedValue, color: color, inset: inset)
            self._changeHandler()
        }
        spread.listen {
            self.value = Self.makeValue(h: h, v: v, blur: blur.wrappedValue, spread: $0, color: color, inset: inset)
            self._changeHandler()
        }
    }
    public convenience init <C, D, H: UnitValuable, V: UnitValuable, I>(h: H, v: V, blur: C, spread: D, color: Color? = nil, inset: I) where C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue>, I: StateConvertible, I.Value == Bool {
        let blur = blur.stateValue
        let spread = spread.stateValue
        let inset = inset.stateValue
        self.init(h: h, v: v, blur: blur.wrappedValue, spread: spread.wrappedValue, color: color, inset: inset.wrappedValue)
        blur.listen {
            self.value = Self.makeValue(h: h, v: v, blur: $0, spread: spread.wrappedValue, color: color, inset: inset.wrappedValue)
            self._changeHandler()
        }
        spread.listen {
            self.value = Self.makeValue(h: h, v: v, blur: blur.wrappedValue, spread: $0, color: color, inset: inset.wrappedValue)
            self._changeHandler()
        }
        inset.listen {
            self.value = Self.makeValue(h: h, v: v, blur: blur.wrappedValue, spread: spread.wrappedValue, color: color, inset: $0)
            self._changeHandler()
        }
    }
    
    // MARK: C E
    public convenience init <C, E, H: UnitValuable, V: UnitValuable>(h: H, v: V, blur: C, spread: NumericValue? = nil, color: E, inset: Bool = false) where C: StateConvertible, C.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color> {
        let blur = blur.stateValue
        let color = color.stateValue
        self.init(h: h, v: v, blur: blur.wrappedValue, spread: spread, color: color.wrappedValue, inset: inset)
        blur.listen {
            self.value = Self.makeValue(h: h, v: v, blur: $0, spread: spread, color: color.wrappedValue, inset: inset)
            self._changeHandler()
        }
        color.listen {
            self.value = Self.makeValue(h: h, v: v, blur: blur.wrappedValue, spread: spread, color: $0, inset: inset)
            self._changeHandler()
        }
    }
    public convenience init <C, E, H: UnitValuable, V: UnitValuable, I>(h: H, v: V, blur: C, spread: NumericValue? = nil, color: E, inset: I) where C: StateConvertible, C.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color>, I: StateConvertible, I.Value == Bool {
        let blur = blur.stateValue
        let color = color.stateValue
        let inset = inset.stateValue
        self.init(h: h, v: v, blur: blur.wrappedValue, spread: spread, color: color.wrappedValue, inset: inset.wrappedValue)
        blur.listen {
            self.value = Self.makeValue(h: h, v: v, blur: $0, spread: spread, color: color.wrappedValue, inset: inset.wrappedValue)
            self._changeHandler()
        }
        color.listen {
            self.value = Self.makeValue(h: h, v: v, blur: blur.wrappedValue, spread: spread, color: $0, inset: inset.wrappedValue)
            self._changeHandler()
        }
        inset.listen {
            self.value = Self.makeValue(h: h, v: v, blur: blur.wrappedValue, spread: spread, color: color.wrappedValue, inset: $0)
            self._changeHandler()
        }
    }
    
    // MARK: D E
    public convenience init <D, E, H: UnitValuable, V: UnitValuable>(h: H, v: V, blur: NumericValue? = nil, spread: D, color: E, inset: Bool = false) where D: StateConvertible, D.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color> {
        let spread = spread.stateValue
        let color = color.stateValue
        self.init(h: h, v: v, blur: blur, spread: spread.wrappedValue, color: color.wrappedValue, inset: inset)
        spread.listen {
            self.value = Self.makeValue(h: h, v: v, blur: blur, spread: $0, color: color.wrappedValue, inset: inset)
            self._changeHandler()
        }
        color.listen {
            self.value = Self.makeValue(h: h, v: v, blur: blur, spread: spread.wrappedValue, color: $0, inset: inset)
            self._changeHandler()
        }
    }
    public convenience init <D, E, H: UnitValuable, V: UnitValuable, I>(h: H, v: V, blur: NumericValue? = nil, spread: D, color: E, inset: I) where D: StateConvertible, D.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color>, I: StateConvertible, I.Value == Bool {
        let spread = spread.stateValue
        let color = color.stateValue
        let inset = inset.stateValue
        self.init(h: h, v: v, blur: blur, spread: spread.wrappedValue, color: color.wrappedValue, inset: inset.wrappedValue)
        spread.listen {
            self.value = Self.makeValue(h: h, v: v, blur: blur, spread: $0, color: color.wrappedValue, inset: inset.wrappedValue)
            self._changeHandler()
        }
        color.listen {
            self.value = Self.makeValue(h: h, v: v, blur: blur, spread: spread.wrappedValue, color: $0, inset: inset.wrappedValue)
            self._changeHandler()
        }
        inset.listen {
            self.value = Self.makeValue(h: h, v: v, blur: blur, spread: spread.wrappedValue, color: color.wrappedValue, inset: $0)
            self._changeHandler()
        }
    }
    
    // MARK: A B C
    public convenience init <A, B, C>(h: A, v: B, blur: C, spread: NumericValue? = nil, color: Color? = nil, inset: Bool = false) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue> {
        let h = h.stateValue
        let v = v.stateValue
        let blur = blur.stateValue
        self.init(h: h.wrappedValue, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread, color: color, inset: inset)
        h.listen {
            self.value = Self.makeValue(h: $0, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread, color: color, inset: inset)
            self._changeHandler()
        }
        v.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: $0, blur: blur.wrappedValue, spread: spread, color: color, inset: inset)
            self._changeHandler()
        }
        blur.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v.wrappedValue, blur: $0, spread: spread, color: color, inset: inset)
            self._changeHandler()
        }
    }
    public convenience init <A, B, C, I>(h: A, v: B, blur: C, spread: NumericValue? = nil, color: Color? = nil, inset: I) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, I: StateConvertible, I.Value == Bool {
        let h = h.stateValue
        let v = v.stateValue
        let blur = blur.stateValue
        let inset = inset.stateValue
        self.init(h: h.wrappedValue, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread, color: color, inset: inset.wrappedValue)
        h.listen {
            self.value = Self.makeValue(h: $0, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread, color: color, inset: inset.wrappedValue)
            self._changeHandler()
        }
        v.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: $0, blur: blur.wrappedValue, spread: spread, color: color, inset: inset.wrappedValue)
            self._changeHandler()
        }
        blur.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v.wrappedValue, blur: $0, spread: spread, color: color, inset: inset.wrappedValue)
            self._changeHandler()
        }
        inset.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread, color: color, inset: $0)
            self._changeHandler()
        }
    }
    
    // MARK: A B D
    public convenience init <A, B, D>(h: A, v: B, blur: NumericValue? = nil, spread: D, color: Color? = nil, inset: Bool = false) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, D: StateConvertible, D.Value == Optional<NumericValue> {
        let h = h.stateValue
        let v = v.stateValue
        let spread = spread.stateValue
        self.init(h: h.wrappedValue, v: v.wrappedValue, blur: blur, spread: spread.wrappedValue, color: color, inset: inset)
        h.listen {
            self.value = Self.makeValue(h: $0, v: v.wrappedValue, blur: blur, spread: spread.wrappedValue, color: color, inset: inset)
            self._changeHandler()
        }
        v.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: $0, blur: blur, spread: spread.wrappedValue, color: color, inset: inset)
            self._changeHandler()
        }
        spread.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v.wrappedValue, blur: blur, spread: $0, color: color, inset: inset)
            self._changeHandler()
        }
    }
    public convenience init <A, B, D, I>(h: A, v: B, blur: NumericValue? = nil, spread: D, color: Color? = nil, inset: I) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, D: StateConvertible, D.Value == Optional<NumericValue>, I: StateConvertible, I.Value == Bool {
        let h = h.stateValue
        let v = v.stateValue
        let spread = spread.stateValue
        let inset = inset.stateValue
        self.init(h: h.wrappedValue, v: v.wrappedValue, blur: blur, spread: spread.wrappedValue, color: color, inset: inset.wrappedValue)
        h.listen {
            self.value = Self.makeValue(h: $0, v: v.wrappedValue, blur: blur, spread: spread.wrappedValue, color: color, inset: inset.wrappedValue)
            self._changeHandler()
        }
        v.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: $0, blur: blur, spread: spread.wrappedValue, color: color, inset: inset.wrappedValue)
            self._changeHandler()
        }
        spread.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v.wrappedValue, blur: blur, spread: $0, color: color, inset: inset.wrappedValue)
            self._changeHandler()
        }
        inset.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v.wrappedValue, blur: blur, spread: spread.wrappedValue, color: color, inset: $0)
            self._changeHandler()
        }
    }
    
    // MARK: A B E
    public convenience init <A, B, E>(h: A, v: B, blur: NumericValue? = nil, spread: NumericValue? = nil, color: E, inset: Bool = false) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, E: StateConvertible, E.Value == Optional<Color> {
        let h = h.stateValue
        let v = v.stateValue
        let color = color.stateValue
        self.init(h: h.wrappedValue, v: v.wrappedValue, blur: blur, spread: spread, color: color.wrappedValue, inset: inset)
        h.listen {
            self.value = Self.makeValue(h: $0, v: v.wrappedValue, blur: blur, spread: spread, color: color.wrappedValue, inset: inset)
            self._changeHandler()
        }
        v.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: $0, blur: blur, spread: spread, color: color.wrappedValue, inset: inset)
            self._changeHandler()
        }
        color.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v.wrappedValue, blur: blur, spread: spread, color: $0, inset: inset)
            self._changeHandler()
        }
    }
    public convenience init <A, B, E, I>(h: A, v: B, blur: NumericValue? = nil, spread: NumericValue? = nil, color: E, inset: I) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, E: StateConvertible, E.Value == Optional<Color>, I: StateConvertible, I.Value == Bool {
        let h = h.stateValue
        let v = v.stateValue
        let color = color.stateValue
        let inset = inset.stateValue
        self.init(h: h.wrappedValue, v: v.wrappedValue, blur: blur, spread: spread, color: color.wrappedValue, inset: inset.wrappedValue)
        h.listen {
            self.value = Self.makeValue(h: $0, v: v.wrappedValue, blur: blur, spread: spread, color: color.wrappedValue, inset: inset.wrappedValue)
            self._changeHandler()
        }
        v.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: $0, blur: blur, spread: spread, color: color.wrappedValue, inset: inset.wrappedValue)
            self._changeHandler()
        }
        color.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v.wrappedValue, blur: blur, spread: spread, color: $0, inset: inset.wrappedValue)
            self._changeHandler()
        }
        inset.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v.wrappedValue, blur: blur, spread: spread, color: color.wrappedValue, inset: $0)
            self._changeHandler()
        }
    }
    
    // MARK: B C D
    public convenience init <B, C, D, H: UnitValuable>(h: H, v: B, blur: C, spread: D, color: Color? = nil, inset: Bool = false) where B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue> {
        let v = v.stateValue
        let blur = blur.stateValue
        let spread = spread.stateValue
        self.init(h: h, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread.wrappedValue, color: color, inset: inset)
        v.listen {
            self.value = Self.makeValue(h: h, v: $0, blur: blur.wrappedValue, spread: spread.wrappedValue, color: color, inset: inset)
            self._changeHandler()
        }
        blur.listen {
            self.value = Self.makeValue(h: h, v: v.wrappedValue, blur: $0, spread: spread.wrappedValue, color: color, inset: inset)
            self._changeHandler()
        }
        spread.listen {
            self.value = Self.makeValue(h: h, v: v.wrappedValue, blur: blur.wrappedValue, spread: $0, color: color, inset: inset)
            self._changeHandler()
        }
    }
    public convenience init <B, C, D, H: UnitValuable, I>(h: H, v: B, blur: C, spread: D, color: Color? = nil, inset: I) where B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue>, I: StateConvertible, I.Value == Bool {
        let v = v.stateValue
        let blur = blur.stateValue
        let spread = spread.stateValue
        let inset = inset.stateValue
        self.init(h: h, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread.wrappedValue, color: color, inset: inset.wrappedValue)
        v.listen {
            self.value = Self.makeValue(h: h, v: $0, blur: blur.wrappedValue, spread: spread.wrappedValue, color: color, inset: inset.wrappedValue)
            self._changeHandler()
        }
        blur.listen {
            self.value = Self.makeValue(h: h, v: v.wrappedValue, blur: $0, spread: spread.wrappedValue, color: color, inset: inset.wrappedValue)
            self._changeHandler()
        }
        spread.listen {
            self.value = Self.makeValue(h: h, v: v.wrappedValue, blur: blur.wrappedValue, spread: $0, color: color, inset: inset.wrappedValue)
            self._changeHandler()
        }
        inset.listen {
            self.value = Self.makeValue(h: h, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread.wrappedValue, color: color, inset: $0)
            self._changeHandler()
        }
    }
    
    // MARK: B C E
    public convenience init <B, C, E, H: UnitValuable>(h: H, v: B, blur: C, spread: NumericValue? = nil, color: E, inset: Bool = false) where B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color> {
        let v = v.stateValue
        let blur = blur.stateValue
        let color = color.stateValue
        self.init(h: h, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread, color: color.wrappedValue, inset: inset)
        v.listen {
            self.value = Self.makeValue(h: h, v: $0, blur: blur.wrappedValue, spread: spread, color: color.wrappedValue, inset: inset)
            self._changeHandler()
        }
        blur.listen {
            self.value = Self.makeValue(h: h, v: v.wrappedValue, blur: $0, spread: spread, color: color.wrappedValue, inset: inset)
            self._changeHandler()
        }
        color.listen {
            self.value = Self.makeValue(h: h, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread, color: $0, inset: inset)
            self._changeHandler()
        }
    }
    public convenience init <B, C, E, H: UnitValuable, I>(h: H, v: B, blur: C, spread: NumericValue? = nil, color: E, inset: I) where B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color>, I: StateConvertible, I.Value == Bool {
        let v = v.stateValue
        let blur = blur.stateValue
        let color = color.stateValue
        let inset = inset.stateValue
        self.init(h: h, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread, color: color.wrappedValue, inset: inset.wrappedValue)
        v.listen {
            self.value = Self.makeValue(h: h, v: $0, blur: blur.wrappedValue, spread: spread, color: color.wrappedValue, inset: inset.wrappedValue)
            self._changeHandler()
        }
        blur.listen {
            self.value = Self.makeValue(h: h, v: v.wrappedValue, blur: $0, spread: spread, color: color.wrappedValue, inset: inset.wrappedValue)
            self._changeHandler()
        }
        color.listen {
            self.value = Self.makeValue(h: h, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread, color: $0, inset: inset.wrappedValue)
            self._changeHandler()
        }
        inset.listen {
            self.value = Self.makeValue(h: h, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread, color: color.wrappedValue, inset: $0)
            self._changeHandler()
        }
    }
    
    // MARK: A C D
    public convenience init <A, C, D, V: UnitValuable>(h: A, v: V, blur: C, spread: D, color: Color? = nil, inset: Bool = false) where A: StateConvertible, A.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue> {
        let h = h.stateValue
        let blur = blur.stateValue
        let spread = spread.stateValue
        self.init(h: h.wrappedValue, v: v, blur: blur.wrappedValue, spread: spread.wrappedValue, color: color, inset: inset)
        h.listen {
            self.value = Self.makeValue(h: $0, v: v, blur: blur.wrappedValue, spread: spread.wrappedValue, color: color, inset: inset)
            self._changeHandler()
        }
        blur.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v, blur: $0, spread: spread.wrappedValue, color: color, inset: inset)
            self._changeHandler()
        }
        spread.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v, blur: blur.wrappedValue, spread: $0, color: color, inset: inset)
            self._changeHandler()
        }
    }
    public convenience init <A, C, D, V: UnitValuable, I>(h: A, v: V, blur: C, spread: D, color: Color? = nil, inset: I) where A: StateConvertible, A.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue>, I: StateConvertible, I.Value == Bool {
        let h = h.stateValue
        let blur = blur.stateValue
        let spread = spread.stateValue
        let inset = inset.stateValue
        self.init(h: h.wrappedValue, v: v, blur: blur.wrappedValue, spread: spread.wrappedValue, color: color, inset: inset.wrappedValue)
        h.listen {
            self.value = Self.makeValue(h: $0, v: v, blur: blur.wrappedValue, spread: spread.wrappedValue, color: color, inset: inset.wrappedValue)
            self._changeHandler()
        }
        blur.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v, blur: $0, spread: spread.wrappedValue, color: color, inset: inset.wrappedValue)
            self._changeHandler()
        }
        spread.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v, blur: blur.wrappedValue, spread: $0, color: color, inset: inset.wrappedValue)
            self._changeHandler()
        }
        inset.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v, blur: blur.wrappedValue, spread: spread.wrappedValue, color: color, inset: $0)
            self._changeHandler()
        }
    }
    
    // MARK: A C E
    public convenience init <A, C, E, V: UnitValuable>(h: A, v: V, blur: C, spread: NumericValue? = nil, color: E, inset: Bool = false) where A: StateConvertible, A.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color> {
        let h = h.stateValue
        let blur = blur.stateValue
        let color = color.stateValue
        self.init(h: h.wrappedValue, v: v, blur: blur.wrappedValue, spread: spread, color: color.wrappedValue, inset: inset)
        h.listen {
            self.value = Self.makeValue(h: $0, v: v, blur: blur.wrappedValue, spread: spread, color: color.wrappedValue, inset: inset)
            self._changeHandler()
        }
        blur.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v, blur: $0, spread: spread, color: color.wrappedValue, inset: inset)
            self._changeHandler()
        }
        color.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v, blur: blur.wrappedValue, spread: spread, color: $0, inset: inset)
            self._changeHandler()
        }
    }
    public convenience init <A, C, E, V: UnitValuable, I>(h: A, v: V, blur: C, spread: NumericValue? = nil, color: E, inset: I) where A: StateConvertible, A.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color>, I: StateConvertible, I.Value == Bool {
        let h = h.stateValue
        let blur = blur.stateValue
        let color = color.stateValue
        let inset = inset.stateValue
        self.init(h: h.wrappedValue, v: v, blur: blur.wrappedValue, spread: spread, color: color.wrappedValue, inset: inset.wrappedValue)
        h.listen {
            self.value = Self.makeValue(h: $0, v: v, blur: blur.wrappedValue, spread: spread, color: color.wrappedValue, inset: inset.wrappedValue)
            self._changeHandler()
        }
        blur.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v, blur: $0, spread: spread, color: color.wrappedValue, inset: inset.wrappedValue)
            self._changeHandler()
        }
        color.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v, blur: blur.wrappedValue, spread: spread, color: $0, inset: inset.wrappedValue)
            self._changeHandler()
        }
        inset.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v, blur: blur.wrappedValue, spread: spread, color: color.wrappedValue, inset: $0)
            self._changeHandler()
        }
    }
    
    // MARK: A B C D
    public convenience init <A, B, C, D>(h: A, v: B, blur: C, spread: D, color: Color? = nil, inset: Bool = false) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue> {
        let h = h.stateValue
        let v = v.stateValue
        let blur = blur.stateValue
        let spread = spread.stateValue
        self.init(h: h.wrappedValue, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread.wrappedValue, color: color, inset: inset)
        h.listen {
            self.value = Self.makeValue(h: $0, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread.wrappedValue, color: color, inset: inset)
            self._changeHandler()
        }
        v.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: $0, blur: blur.wrappedValue, spread: spread.wrappedValue, color: color, inset: inset)
            self._changeHandler()
        }
        blur.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v.wrappedValue, blur: $0, spread: spread.wrappedValue, color: color, inset: inset)
            self._changeHandler()
        }
        spread.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v.wrappedValue, blur: blur.wrappedValue, spread: $0, color: color, inset: inset)
            self._changeHandler()
        }
    }
    public convenience init <A, B, C, D, I>(h: A, v: B, blur: C, spread: D, color: Color? = nil, inset: I) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue>, I: StateConvertible, I.Value == Bool {
        let h = h.stateValue
        let v = v.stateValue
        let blur = blur.stateValue
        let spread = spread.stateValue
        let inset = inset.stateValue
        self.init(h: h.wrappedValue, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread.wrappedValue, color: color, inset: inset.wrappedValue)
        h.listen {
            self.value = Self.makeValue(h: $0, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread.wrappedValue, color: color, inset: inset.wrappedValue)
            self._changeHandler()
        }
        v.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: $0, blur: blur.wrappedValue, spread: spread.wrappedValue, color: color, inset: inset.wrappedValue)
            self._changeHandler()
        }
        blur.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v.wrappedValue, blur: $0, spread: spread.wrappedValue, color: color, inset: inset.wrappedValue)
            self._changeHandler()
        }
        spread.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v.wrappedValue, blur: blur.wrappedValue, spread: $0, color: color, inset: inset.wrappedValue)
            self._changeHandler()
        }
        inset.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread.wrappedValue, color: color, inset: $0)
            self._changeHandler()
        }
    }
    
    // MARK: A B C E
    public convenience init <A, B, C, E>(h: A, v: B, blur: C, spread: NumericValue? = nil, color: E, inset: Bool = false) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color> {
        let h = h.stateValue
        let v = v.stateValue
        let blur = blur.stateValue
        let color = color.stateValue
        self.init(h: h.wrappedValue, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread, color: color.wrappedValue, inset: inset)
        h.listen {
            self.value = Self.makeValue(h: $0, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread, color: color.wrappedValue, inset: inset)
            self._changeHandler()
        }
        v.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: $0, blur: blur.wrappedValue, spread: spread, color: color.wrappedValue, inset: inset)
            self._changeHandler()
        }
        blur.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v.wrappedValue, blur: $0, spread: spread, color: color.wrappedValue, inset: inset)
            self._changeHandler()
        }
        color.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread, color: $0, inset: inset)
            self._changeHandler()
        }
    }
    public convenience init <A, B, C, E, I>(h: A, v: B, blur: C, spread: NumericValue? = nil, color: E, inset: I) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color>, I: StateConvertible, I.Value == Bool {
        let h = h.stateValue
        let v = v.stateValue
        let blur = blur.stateValue
        let color = color.stateValue
        let inset = inset.stateValue
        self.init(h: h.wrappedValue, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread, color: color.wrappedValue, inset: inset.wrappedValue)
        h.listen {
            self.value = Self.makeValue(h: $0, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread, color: color.wrappedValue, inset: inset.wrappedValue)
            self._changeHandler()
        }
        v.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: $0, blur: blur.wrappedValue, spread: spread, color: color.wrappedValue, inset: inset.wrappedValue)
            self._changeHandler()
        }
        blur.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v.wrappedValue, blur: $0, spread: spread, color: color.wrappedValue, inset: inset.wrappedValue)
            self._changeHandler()
        }
        color.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread, color: $0, inset: inset.wrappedValue)
            self._changeHandler()
        }
        inset.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread, color: color.wrappedValue, inset: $0)
            self._changeHandler()
        }
    }
    
    // MARK: B C D E
    public convenience init <B, C, D, E, H: UnitValuable>(h: H, v: B, blur: C, spread: D, color: E, inset: Bool = false) where B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color> {
        let v = v.stateValue
        let blur = blur.stateValue
        let spread = spread.stateValue
        let color = color.stateValue
        self.init(h: h, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread.wrappedValue, color: color.wrappedValue, inset: inset)
        v.listen {
            self.value = Self.makeValue(h: h, v: $0, blur: blur.wrappedValue, spread: spread.wrappedValue, color: color.wrappedValue, inset: inset)
            self._changeHandler()
        }
        blur.listen {
            self.value = Self.makeValue(h: h, v: v.wrappedValue, blur: $0, spread: spread.wrappedValue, color: color.wrappedValue, inset: inset)
            self._changeHandler()
        }
        spread.listen {
            self.value = Self.makeValue(h: h, v: v.wrappedValue, blur: blur.wrappedValue, spread: $0, color: color.wrappedValue, inset: inset)
            self._changeHandler()
        }
        color.listen {
            self.value = Self.makeValue(h: h, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread.wrappedValue, color: $0, inset: inset)
            self._changeHandler()
        }
    }
    public convenience init <B, C, D, E, H: UnitValuable, I>(h: H, v: B, blur: C, spread: D, color: E, inset: I) where B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color>, I: StateConvertible, I.Value == Bool {
        let v = v.stateValue
        let blur = blur.stateValue
        let spread = spread.stateValue
        let color = color.stateValue
        let inset = inset.stateValue
        self.init(h: h, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread.wrappedValue, color: color.wrappedValue, inset: inset.wrappedValue)
        v.listen {
            self.value = Self.makeValue(h: h, v: $0, blur: blur.wrappedValue, spread: spread.wrappedValue, color: color.wrappedValue, inset: inset.wrappedValue)
            self._changeHandler()
        }
        blur.listen {
            self.value = Self.makeValue(h: h, v: v.wrappedValue, blur: $0, spread: spread.wrappedValue, color: color.wrappedValue, inset: inset.wrappedValue)
            self._changeHandler()
        }
        spread.listen {
            self.value = Self.makeValue(h: h, v: v.wrappedValue, blur: blur.wrappedValue, spread: $0, color: color.wrappedValue, inset: inset.wrappedValue)
            self._changeHandler()
        }
        color.listen {
            self.value = Self.makeValue(h: h, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread.wrappedValue, color: $0, inset: inset.wrappedValue)
            self._changeHandler()
        }
        inset.listen {
            self.value = Self.makeValue(h: h, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread.wrappedValue, color: color.wrappedValue, inset: $0)
            self._changeHandler()
        }
    }
    
    // MARK: A B C D E
    public convenience init <A, B, C, D, E>(h: A, v: B, blur: C, spread: D, color: E, inset: Bool = false) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color> {
        let h = h.stateValue
        let v = v.stateValue
        let blur = blur.stateValue
        let spread = spread.stateValue
        let color = color.stateValue
        self.init(h: h.wrappedValue, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread.wrappedValue, color: color.wrappedValue, inset: inset)
        h.listen {
            self.value = Self.makeValue(h: $0, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread.wrappedValue, color: color.wrappedValue, inset: inset)
            self._changeHandler()
        }
        v.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: $0, blur: blur.wrappedValue, spread: spread.wrappedValue, color: color.wrappedValue, inset: inset)
            self._changeHandler()
        }
        blur.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v.wrappedValue, blur: $0, spread: spread.wrappedValue, color: color.wrappedValue, inset: inset)
            self._changeHandler()
        }
        spread.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v.wrappedValue, blur: blur.wrappedValue, spread: $0, color: color.wrappedValue, inset: inset)
            self._changeHandler()
        }
        color.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread.wrappedValue, color: $0, inset: inset)
            self._changeHandler()
        }
    }
    public convenience init <A, B, C, D, E, I>(h: A, v: B, blur: C, spread: D, color: E, inset: I) where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color>, I: StateConvertible, I.Value == Bool {
        let h = h.stateValue
        let v = v.stateValue
        let blur = blur.stateValue
        let spread = spread.stateValue
        let color = color.stateValue
        let inset = inset.stateValue
        self.init(h: h.wrappedValue, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread.wrappedValue, color: color.wrappedValue, inset: inset.wrappedValue)
        h.listen {
            self.value = Self.makeValue(h: $0, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread.wrappedValue, color: color.wrappedValue, inset: inset.wrappedValue)
            self._changeHandler()
        }
        v.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: $0, blur: blur.wrappedValue, spread: spread.wrappedValue, color: color.wrappedValue, inset: inset.wrappedValue)
            self._changeHandler()
        }
        blur.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v.wrappedValue, blur: $0, spread: spread.wrappedValue, color: color.wrappedValue, inset: inset.wrappedValue)
            self._changeHandler()
        }
        spread.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v.wrappedValue, blur: blur.wrappedValue, spread: $0, color: color.wrappedValue, inset: inset.wrappedValue)
            self._changeHandler()
        }
        color.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread.wrappedValue, color: $0, inset: inset.wrappedValue)
            self._changeHandler()
        }
        inset.listen {
            self.value = Self.makeValue(h: h.wrappedValue, v: v.wrappedValue, blur: blur.wrappedValue, spread: spread.wrappedValue, color: color.wrappedValue, inset: $0)
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
    /// Use it for multiple shadows
    public func boxShadow(_ values: [BoxShadowValue]) -> Self {
        s?._addProperty(BoxShadowProperty(values))
        return self
    }
    
    /// Use it for multiple shadows
    public func boxShadow(_ values: BoxShadowValue...) -> Self {
        s?._addProperty(BoxShadowProperty(values))
        return self
    }
    
    /// Use it for multiple shadows
    public func boxShadow<V>(_ values: V) -> Self where V: StateConvertible, V.Value == [BoxShadowValue] {
        s?._addProperty(BoxShadowProperty(values))
        return self
    }
    
    public func boxShadow<V>(_ values: V) -> Self where V: StateConvertible, V.Value == BoxShadowValue {
        s?._addProperty(BoxShadowProperty(values))
        return self
    }
    
    /// Attaches one shadow to an element
    public func boxShadow<H: UnitValuable, V: UnitValuable>(h: H, v: V, blur: NumericValue? = nil, spread: NumericValue? = nil, color: Color? = nil, inset: Bool = false) -> Self {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    
    // MARK: A
    /// Attaches one shadow to an element
    public func boxShadow<A, V: UnitValuable>(h: A, v: V, blur: NumericValue? = nil, spread: NumericValue? = nil, color: Color? = nil, inset: Bool = false) -> Self where A: StateConvertible, A.Value: UnitValuable {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    /// Attaches one shadow to an element
    public func boxShadow<A, V: UnitValuable, I>(h: A, v: V, blur: NumericValue? = nil, spread: NumericValue? = nil, color: Color? = nil, inset: I) -> Self where A: StateConvertible, A.Value: UnitValuable, I: StateConvertible, I.Value == Bool {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    
    // MARK: B
    /// Attaches one shadow to an element
    public func boxShadow<B, H: UnitValuable>(h: H, v: B, blur: NumericValue? = nil, spread: NumericValue? = nil, color: Color? = nil, inset: Bool = false) -> Self where B: StateConvertible, B.Value: UnitValuable {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    /// Attaches one shadow to an element
    public func boxShadow<B, H: UnitValuable, I>(h: H, v: B, blur: NumericValue? = nil, spread: NumericValue? = nil, color: Color? = nil, inset: I) -> Self where B: StateConvertible, B.Value: UnitValuable, I: StateConvertible, I.Value == Bool {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    
    // MARK: C
    /// Attaches one shadow to an element
    public func boxShadow<C, H: UnitValuable, V: UnitValuable>(h: H, v: V, blur: C, spread: NumericValue? = nil, color: Color? = nil, inset: Bool = false) -> Self where C: StateConvertible, C.Value == Optional<NumericValue> {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    /// Attaches one shadow to an element
    public func boxShadow<C, H: UnitValuable, V: UnitValuable, I>(h: H, v: V, blur: C, spread: NumericValue? = nil, color: Color? = nil, inset: I) -> Self where C: StateConvertible, C.Value == Optional<NumericValue>, I: StateConvertible, I.Value == Bool {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    
    // MARK: D
    /// Attaches one shadow to an element
    public func boxShadow<D, H: UnitValuable, V: UnitValuable>(h: H, v: V, blur: NumericValue? = nil, spread: D, color: Color? = nil, inset: Bool = false) -> Self where D: StateConvertible, D.Value == Optional<NumericValue> {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    /// Attaches one shadow to an element
    public func boxShadow<D, H: UnitValuable, V: UnitValuable, I>(h: H, v: V, blur: NumericValue? = nil, spread: D, color: Color? = nil, inset: I) -> Self where D: StateConvertible, D.Value == Optional<NumericValue>, I: StateConvertible, I.Value == Bool {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    
    // MARK: E
    /// Attaches one shadow to an element
    public func boxShadow<E, H: UnitValuable, V: UnitValuable>(h: H, v: V, blur: NumericValue? = nil, spread: NumericValue? = nil, color: E, inset: Bool = false) -> Self where E: StateConvertible, E.Value == Optional<Color> {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    /// Attaches one shadow to an element
    public func boxShadow<E, H: UnitValuable, V: UnitValuable, I>(h: H, v: V, blur: NumericValue? = nil, spread: NumericValue? = nil, color: E, inset: I) -> Self where E: StateConvertible, E.Value == Optional<Color>, I: StateConvertible, I.Value == Bool {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    
    // MARK: A B
    /// Attaches one shadow to an element
    public func boxShadow<A, B>(h: A, v: B, blur: NumericValue? = nil, spread: NumericValue? = nil, color: Color? = nil, inset: Bool = false) -> Self where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    /// Attaches one shadow to an element
    public func boxShadow<A, B, I>(h: A, v: B, blur: NumericValue? = nil, spread: NumericValue? = nil, color: Color? = nil, inset: I) -> Self where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, I: StateConvertible, I.Value == Bool {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    
    // MARK: A C
    /// Attaches one shadow to an element
    public func boxShadow<A, C, V: UnitValuable>(h: A, v: V, blur: C, spread: NumericValue? = nil, color: Color? = nil, inset: Bool = false) -> Self where A: StateConvertible, A.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue> {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    /// Attaches one shadow to an element
    public func boxShadow<A, C, V: UnitValuable, I>(h: A, v: V, blur: C, spread: NumericValue? = nil, color: Color? = nil, inset: I) -> Self where A: StateConvertible, A.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, I: StateConvertible, I.Value == Bool {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    
    // MARK: A D
    /// Attaches one shadow to an element
    public func boxShadow<A, D, V: UnitValuable>(h: A, v: V, blur: NumericValue? = nil, spread: D, color: Color? = nil, inset: Bool = false) -> Self where A: StateConvertible, A.Value: UnitValuable, D: StateConvertible, D.Value == Optional<NumericValue> {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    /// Attaches one shadow to an element
    public func boxShadow<A, D, V: UnitValuable, I>(h: A, v: V, blur: NumericValue? = nil, spread: D, color: Color? = nil, inset: I) -> Self where A: StateConvertible, A.Value: UnitValuable, D: StateConvertible, D.Value == Optional<NumericValue>, I: StateConvertible, I.Value == Bool {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    
    // MARK: A E
    /// Attaches one shadow to an element
    public func boxShadow<A, E, V: UnitValuable>(h: A, v: V, blur: NumericValue? = nil, spread: NumericValue? = nil, color: E, inset: Bool = false) -> Self where A: StateConvertible, A.Value: UnitValuable, E: StateConvertible, E.Value == Optional<Color> {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    /// Attaches one shadow to an element
    public func boxShadow<A, E, V: UnitValuable, I>(h: A, v: V, blur: NumericValue? = nil, spread: NumericValue? = nil, color: E, inset: I) -> Self where A: StateConvertible, A.Value: UnitValuable, E: StateConvertible, E.Value == Optional<Color>, I: StateConvertible, I.Value == Bool {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    
    // MARK: B C
    /// Attaches one shadow to an element
    public func boxShadow<B, C, H: UnitValuable>(h: H, v: B, blur: C, spread: NumericValue? = nil, color: Color? = nil, inset: Bool = false) -> Self where B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue> {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    /// Attaches one shadow to an element
    public func boxShadow<B, C, H: UnitValuable, I>(h: H, v: B, blur: C, spread: NumericValue? = nil, color: Color? = nil, inset: I) -> Self where B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, I: StateConvertible, I.Value == Bool {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    
    // MARK: B D
    /// Attaches one shadow to an element
    public func boxShadow<B, D, H: UnitValuable>(h: H, v: B, blur: NumericValue? = nil, spread: D, color: Color? = nil, inset: Bool = false) -> Self where B: StateConvertible, B.Value: UnitValuable, D: StateConvertible, D.Value == Optional<NumericValue> {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    /// Attaches one shadow to an element
    public func boxShadow<B, D, H: UnitValuable, I>(h: H, v: B, blur: NumericValue? = nil, spread: D, color: Color? = nil, inset: I) -> Self where B: StateConvertible, B.Value: UnitValuable, D: StateConvertible, D.Value == Optional<NumericValue>, I: StateConvertible, I.Value == Bool {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    
    // MARK: B E
    /// Attaches one shadow to an element
    public func boxShadow<B, E, H: UnitValuable>(h: H, v: B, blur: NumericValue? = nil, spread: NumericValue? = nil, color: E, inset: Bool = false) -> Self where B: StateConvertible, B.Value: UnitValuable, E: StateConvertible, E.Value == Optional<Color> {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    /// Attaches one shadow to an element
    public func boxShadow<B, E, H: UnitValuable, I>(h: H, v: B, blur: NumericValue? = nil, spread: NumericValue? = nil, color: E, inset: I) -> Self where B: StateConvertible, B.Value: UnitValuable, E: StateConvertible, E.Value == Optional<Color>, I: StateConvertible, I.Value == Bool {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    
    // MARK: C D
    /// Attaches one shadow to an element
    public func boxShadow<C, D, H: UnitValuable, V: UnitValuable>(h: H, v: V, blur: C, spread: D, color: Color? = nil, inset: Bool = false) -> Self where C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue> {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    /// Attaches one shadow to an element
    public func boxShadow<C, D, H: UnitValuable, V: UnitValuable, I>(h: H, v: V, blur: C, spread: D, color: Color? = nil, inset: I) -> Self where C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue>, I: StateConvertible, I.Value == Bool {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    
    // MARK: C E
    /// Attaches one shadow to an element
    public func boxShadow<C, E, H: UnitValuable, V: UnitValuable>(h: H, v: V, blur: C, spread: NumericValue? = nil, color: E, inset: Bool = false) -> Self where C: StateConvertible, C.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color> {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    /// Attaches one shadow to an element
    public func boxShadow<C, E, H: UnitValuable, V: UnitValuable, I>(h: H, v: V, blur: C, spread: NumericValue? = nil, color: E, inset: I) -> Self where C: StateConvertible, C.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color>, I: StateConvertible, I.Value == Bool {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    
    // MARK: D E
    /// Attaches one shadow to an element
    public func boxShadow<D, E, H: UnitValuable, V: UnitValuable>(h: H, v: V, blur: NumericValue? = nil, spread: D, color: E, inset: Bool = false) -> Self where D: StateConvertible, D.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color> {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    /// Attaches one shadow to an element
    public func boxShadow<D, E, H: UnitValuable, V: UnitValuable, I>(h: H, v: V, blur: NumericValue? = nil, spread: D, color: E, inset: I) -> Self where D: StateConvertible, D.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color>, I: StateConvertible, I.Value == Bool {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    
    // MARK: A B C
    /// Attaches one shadow to an element
    public func boxShadow<A, B, C>(h: A, v: B, blur: C, spread: NumericValue? = nil, color: Color? = nil, inset: Bool = false) -> Self where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue> {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    /// Attaches one shadow to an element
    public func boxShadow<A, B, C, I>(h: A, v: B, blur: C, spread: NumericValue? = nil, color: Color? = nil, inset: I) -> Self where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, I: StateConvertible, I.Value == Bool {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    
    // MARK: A B D
    /// Attaches one shadow to an element
    public func boxShadow<A, B, D>(h: A, v: B, blur: NumericValue? = nil, spread: D, color: Color? = nil, inset: Bool = false) -> Self where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, D: StateConvertible, D.Value == Optional<NumericValue> {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    /// Attaches one shadow to an element
    public func boxShadow<A, B, D, I>(h: A, v: B, blur: NumericValue? = nil, spread: D, color: Color? = nil, inset: I) -> Self where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, D: StateConvertible, D.Value == Optional<NumericValue>, I: StateConvertible, I.Value == Bool {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    
    // MARK: A B E
    /// Attaches one shadow to an element
    public func boxShadow<A, B, E>(h: A, v: B, blur: NumericValue? = nil, spread: NumericValue? = nil, color: E, inset: Bool = false) -> Self where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, E: StateConvertible, E.Value == Optional<Color> {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    /// Attaches one shadow to an element
    public func boxShadow<A, B, E, I>(h: A, v: B, blur: NumericValue? = nil, spread: NumericValue? = nil, color: E, inset: I) -> Self where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, E: StateConvertible, E.Value == Optional<Color>, I: StateConvertible, I.Value == Bool {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    
    // MARK: B C D
    /// Attaches one shadow to an element
    public func boxShadow<B, C, D, H: UnitValuable>(h: H, v: B, blur: C, spread: D, color: Color? = nil, inset: Bool = false) -> Self where B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue> {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    /// Attaches one shadow to an element
    public func boxShadow<B, C, D, H: UnitValuable, I>(h: H, v: B, blur: C, spread: D, color: Color? = nil, inset: I) -> Self where B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue>, I: StateConvertible, I.Value == Bool {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    
    // MARK: B C E
    /// Attaches one shadow to an element
    public func boxShadow<B, C, E, H: UnitValuable>(h: H, v: B, blur: C, spread: NumericValue? = nil, color: E, inset: Bool = false) -> Self where B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color> {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    /// Attaches one shadow to an element
    public func boxShadow<B, C, E, H: UnitValuable, I>(h: H, v: B, blur: C, spread: NumericValue? = nil, color: E, inset: I) -> Self where B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color>, I: StateConvertible, I.Value == Bool {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    
    // MARK: A C D
    /// Attaches one shadow to an element
    public func boxShadow<A, C, D, V: UnitValuable>(h: A, v: V, blur: C, spread: D, color: Color? = nil, inset: Bool = false) -> Self where A: StateConvertible, A.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue> {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    /// Attaches one shadow to an element
    public func boxShadow<A, C, D, V: UnitValuable, I>(h: A, v: V, blur: C, spread: D, color: Color? = nil, inset: I) -> Self where A: StateConvertible, A.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue>, I: StateConvertible, I.Value == Bool {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    
    // MARK: A C E
    /// Attaches one shadow to an element
    public func boxShadow<A, C, E, V: UnitValuable>(h: A, v: V, blur: C, spread: NumericValue? = nil, color: E, inset: Bool = false) -> Self where A: StateConvertible, A.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color> {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    /// Attaches one shadow to an element
    public func boxShadow<A, C, E, V: UnitValuable, I>(h: A, v: V, blur: C, spread: NumericValue? = nil, color: E, inset: I) -> Self where A: StateConvertible, A.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color>, I: StateConvertible, I.Value == Bool {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    
    // MARK: A B C D
    /// Attaches one shadow to an element
    public func boxShadow<A, B, C, D>(h: A, v: B, blur: C, spread: D, color: Color? = nil, inset: Bool = false) -> Self where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue> {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    /// Attaches one shadow to an element
    public func boxShadow<A, B, C, D, I>(h: A, v: B, blur: C, spread: D, color: Color? = nil, inset: I) -> Self where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue>, I: StateConvertible, I.Value == Bool {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    
    // MARK: A B C E
    /// Attaches one shadow to an element
    public func boxShadow<A, B, C, E>(h: A, v: B, blur: C, spread: NumericValue? = nil, color: E, inset: Bool = false) -> Self where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color> {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    /// Attaches one shadow to an element
    public func boxShadow<A, B, C, E, I>(h: A, v: B, blur: C, spread: NumericValue? = nil, color: E, inset: I) -> Self where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color>, I: StateConvertible, I.Value == Bool {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    
    // MARK: B C D E
    /// Attaches one shadow to an element
    public func boxShadow<B, C, D, E, H: UnitValuable>(h: H, v: B, blur: C, spread: D, color: E, inset: Bool = false) -> Self where B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color> {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    /// Attaches one shadow to an element
    public func boxShadow<B, C, D, E, H: UnitValuable, I>(h: H, v: B, blur: C, spread: D, color: E, inset: I) -> Self where B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color>, I: StateConvertible, I.Value == Bool {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    
    // MARK: A B C D E
    /// Attaches one shadow to an element
    public func boxShadow<A, B, C, D, E>(h: A, v: B, blur: C, spread: D, color: E, inset: Bool = false) -> Self where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color> {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
    /// Attaches one shadow to an element
    public func boxShadow<A, B, C, D, E, I>(h: A, v: B, blur: C, spread: D, color: E, inset: I) -> Self where A: StateConvertible, A.Value: UnitValuable, B: StateConvertible, B.Value: UnitValuable, C: StateConvertible, C.Value == Optional<NumericValue>, D: StateConvertible, D.Value == Optional<NumericValue>, E: StateConvertible, E.Value == Optional<Color>, I: StateConvertible, I.Value == Bool {
        s?._addProperty(BoxShadowProperty(h: h, v: v, blur: blur, spread: spread, color: color, inset: inset))
        return self
    }
}
