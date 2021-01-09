//
//  ColorType.swift
//  WasmApp
//
//  Created by Mihael Isaev on 08.07.2020.
//

public enum ColorType: CustomStringConvertible {
    case css(CSSColor)
    case hex(Int)
    case rgb(Int, Int, Int)
    case rgba(Int, Int, Int, Double)
    case hsl(Int, Int, Int)
    case hsla(Int, Int, Int, Double)
    
    public var description: String {
        switch self {
        case .css(let name):
            return name.rawValue
        case .hex(let v):
            return String(format:"#%02X", v)
        case .rgb(let r, let g, let b):
            return "rgb(\(r), \(g), \(b))"
        case .rgba(let r, let g, let b, let a):
            return "rgba(\(r), \(g), \(b), \(a))"
        case .hsl(let hue, let saturation, let lightness):
            return "hsl(\(hue), \(saturation)%, \(lightness)%)"
        case .hsla(let hue, let saturation, let lightness, let alpha):
            return "hsls(\(hue), \(saturation)%, \(lightness)%, \(alpha))"
        }
    }
}
