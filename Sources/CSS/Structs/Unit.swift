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
public enum Unit: String, UniValue {
    /// `Absolute Lengths`
    /// The absolute length units are fixed and a length expressed in any of these will appear as exactly that size.
    ///
    /// Absolute length units are not recommended for use on screen, because screen sizes vary so much.
    /// However, they can be used if the output medium is known, such as for print layout.
    
    /// centimeters
    case cm
    
    /// millimeters
    case mm
    
    /// inches (1in = 96px = 2.54cm)
    case `in`
    
    /// pixels (1px = 1/96th of 1in)
    case px
    
    /// points (1pt = 1/72 of 1in)
    case pt
    
    /// picas (1pc = 12 pt)
    case pc
    
    /// `Relative Lengths`
    /// Relative length units specify a length relative to another length property.
    /// Relative length units scale better between different rendering medium.
    
    /// Fr is a fractional unit and 1fr is for 1 part of the available space
    case fr
    
    /// Relative to the font-size of the element (2em means 2 times the size of the current font)
    case em
    
    /// Relative to the x-height of the current font (rarely used)
    case ex
    
    /// Relative to the width of the "0" (zero)
    case ch
    
    /// Relative to font-size of the root element
    case rem
    
    /// Relative to 1% of the width of the viewport*
    case vw
    
    /// Relative to 1% of the height of the viewport*
    case vh
    
    /// Relative to 1% of viewport's* smaller dimension
    case vmin
    
    /// Relative to 1% of viewport's* larger dimension
    case vmax
    
    /// Relative to the parent element
    case percent = "%"
    
    public var uniValue: Unit { self }
    public var uniStateValue: State<Unit>? { nil }
}
