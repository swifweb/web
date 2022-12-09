//
//  Unit.swift
//  CSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

import WebFoundation

/// CSS has several different units for expressing a length.
/// Many CSS properties take "length" values, such as width, margin, padding, font-size, etc.
/// Length is a number followed by a length unit, such as 10px, 2em, etc.
/// A whitespace cannot appear between the number and the unit. However, if the value is 0, the unit can be omitted.
/// For some CSS properties, negative lengths are allowed.
/// There are two types of length units: absolute and relative.
///
/// [Learn more](https://www.w3schools.com/cssref/css_units.asp)
public struct Unit: UniValue, _StringPropertyValue, PropertyValueImportantable {
    let value: String
    
    init (_ value: String) {
        self.value = value
    }
    
    /// `Absolute Lengths`
    /// The absolute length units are fixed and a length expressed in any of these will appear as exactly that size.
    ///
    /// Absolute length units are not recommended for use on screen, because screen sizes vary so much.
    /// However, they can be used if the output medium is known, such as for print layout.
    
    /// centimeters
    public static var cm: Self { .init("cm") }
    
    /// millimeters
    public static var mm: Self { .init("mm") }
    
    /// inches (1in = 96px = 2.54cm)
    public static var `in`: Self { .init("in") }
    
    /// pixels (1px = 1/96th of 1in)
    public static var px: Self { .init("px") }
    
    /// points (1pt = 1/72 of 1in)
    public static var pt: Self { .init("pt") }
    
    /// picas (1pc = 12 pt)
    public static var pc: Self { .init("pc") }
    
    /// `Relative Lengths`
    /// Relative length units specify a length relative to another length property.
    /// Relative length units scale better between different rendering medium.
    
    /// Fr is a fractional unit and 1fr is for 1 part of the available space
    public static var fr: Self { .init("fr") }
    
    /// Relative to the font-size of the element (2em means 2 times the size of the current font)
    public static var em: Self { .init("em") }
    
    /// Relative to the x-height of the current font (rarely used)
    public static var ex: Self { .init("ex") }
    
    /// Relative to the width of the "0" (zero)
    public static var ch: Self { .init("ch") }
    
    /// Relative to font-size of the root element
    public static var rem: Self { .init("rem") }
    
    /// Relative to 1% of the width of the viewport*
    public static var vw: Self { .init("vw") }
    
    /// Relative to 1% of the height of the viewport*
    public static var vh: Self { .init("vh") }
    
    /// Relative to 1% of viewport's* smaller dimension
    public static var vmin: Self { .init("vmin") }
    
    /// Relative to 1% of viewport's* larger dimension
    public static var vmax: Self { .init("vmax") }
    
    /// Relative to the parent element
    public static var percent: Self { .init("%") }
    
    public var uniValue: Unit { self }
    public var uniStateValue: State<Unit>? { nil }
    
    public var description: String { value }
}
