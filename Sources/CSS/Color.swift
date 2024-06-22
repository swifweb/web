//
//  Color.swift
//  CSS
//
//  Created by Mihael Isaev on 29.11.2020.
//

import WebFoundation

protocol _PropertyValueInnerChangeable: AnyObject {
    var _changeHandler: () -> Void { get set }
}

public typealias WColor = Color
open class Color: CustomStringConvertible, _PropertyValueInnerChangeable, Hashable, ExpressibleByIntegerLiteral, PropertyValueImportantable {
    @State public var value: ColorType = .css(.black)
    
    var _changeHandler = {}
    
    /// Adds **!important** to the value
    public var important: Self { .init(value.important) }
    
    public required init (_ value: ColorType) {
        self.value = value
    }
    
    public convenience init (_ value: State<ColorType>) {
        self.init(value.wrappedValue)
        value.listen {
            self.value = $0
            self._changeHandler()
        }
    }
    
    public required init(integerLiteral value: IntegerLiteralType) {
        self.value = .hex(value)
    }
    
    public init<I>(_ hex: I) where I: UniValue, I.UniValue == Int {
        value = .hex(hex.uniValue)
        hex.uniStateValue?.listen {
            self.value = .hex($0)
            self._changeHandler()
        }
    }
    
    public init <R, G, B, A>(r: R, g: G, b: B, a: A)
    where R: UniValue, G: UniValue, B: UniValue, A: UniValue,
              R.UniValue == Int, G.UniValue == Int, B.UniValue == Int, A.UniValue == Double {
        value = .rgba(r.uniValue, g.uniValue, b.uniValue, a.uniValue)
        r.uniStateValue?.listen { [weak self] in
            self?.value = .rgba($0, g.uniValue, b.uniValue, a.uniValue)
        }
        g.uniStateValue?.listen { [weak self] in
            self?.value = .rgba(r.uniValue, $0, b.uniValue, a.uniValue)
        }
        b.uniStateValue?.listen { [weak self] in
            self?.value = .rgba(r.uniValue, g.uniValue, $0, a.uniValue)
        }
        a.uniStateValue?.listen { [weak self] in
            self?.value = .rgba(r.uniValue, g.uniValue, b.uniValue, $0)
        }
    }
    
    public convenience init <R, G, B>(r: R, g: G, b: B)
    where R: UniValue, G: UniValue, B: UniValue,
              R.UniValue == Int, G.UniValue == Int, B.UniValue == Int {
        self.init(r: r, g:g, b: b, a: 1)
    }
    
    public init <H, S, L, A>(h: H, s: S, l: L, a: A)
    where H: UniValue, S: UniValue, L: UniValue, A: UniValue,
              H.UniValue == Double, S.UniValue == Double, L.UniValue == Double, A.UniValue == Double {
        value = .hsla(h.uniValue, s.uniValue, l.uniValue, a.uniValue)
        h.uniStateValue?.listen { [weak self] in
            self?.value = .hsla($0, s.uniValue, l.uniValue, a.uniValue)
        }
        s.uniStateValue?.listen { [weak self] in
            self?.value = .hsla(h.uniValue, $0, l.uniValue, a.uniValue)
        }
        l.uniStateValue?.listen { [weak self] in
            self?.value = .hsla(h.uniValue, s.uniValue, $0, a.uniValue)
        }
        a.uniStateValue?.listen { [weak self] in
            self?.value = .hsla(h.uniValue, s.uniValue, l.uniValue, $0)
        }
    }
    
    public convenience init <H, S, L>(h: H, s: S, l: L)
    where H: UniValue, S: UniValue, L: UniValue,
              H.UniValue == Double, S.UniValue == Double, L.UniValue == Double {
        self.init(h: h, s: s, l: l, a: 1)
    }
    
    public static func hex<I>(_ value: I) -> Color where I: UniValue, I.UniValue == Int { .init(value) }
    public static func rgb<R, G, B>(_ r: R, _ g: G, _ b: B) -> Color
    where R: UniValue, G: UniValue, B: UniValue,
              R.UniValue == Int, G.UniValue == Int, B.UniValue == Int
              { .init(r: r, g: g, b: b) }
    public static func rgba<R, G, B, A>(_ r: R, _ g: G, _ b: B, _ a: A) -> Color
    where R: UniValue, G: UniValue, B: UniValue, A: UniValue,
              R.UniValue == Int, G.UniValue == Int, B.UniValue == Int, A.UniValue == Double
              { .init(r: r, g: g, b: b, a: a) }
    public static func hsl<H, S, L>(_ h: H, _ s: S, _ l: L) -> Color
    where H: UniValue, S: UniValue, L: UniValue,
              H.UniValue == Double, S.UniValue == Double, L.UniValue == Double
              { .init(h: h, s: s, l: l) }
    public static func hsla<H, S, L, A>(_ h: H, _ s: S, _ l: L, _  a: A) -> Color
    where H: UniValue, S: UniValue, L: UniValue, A: UniValue,
              H.UniValue == Double, S.UniValue == Double, L.UniValue == Double, A.UniValue == Double
              { .init(h: h, s: s, l: l, a: a) }
    
    public static var aliceBlue: Color { .init(.css(.aliceBlue)) }
    public static var antiqueWhite: Color { .init(.css(.antiqueWhite)) }
    public static var aqua: Color { .init(.css(.aqua)) }
    public static var aquamarine: Color { .init(.css(.aquamarine)) }
    public static var azure: Color { .init(.css(.azure)) }
    public static var beige: Color { .init(.css(.beige)) }
    public static var bisque: Color { .init(.css(.bisque)) }
    public static var black: Color { .init(.css(.black)) }
    public static var blanchedAlmond: Color { .init(.css(.blanchedAlmond)) }
    public static var blue: Color { .init(.css(.blue)) }
    public static var blueViolet: Color { .init(.css(.blueViolet)) }
    public static var brown: Color { .init(.css(.brown)) }
    public static var burlyWood: Color { .init(.css(.burlyWood)) }
    public static var cadetBlue: Color { .init(.css(.cadetBlue)) }
    public static var chartreuse: Color { .init(.css(.chartreuse)) }
    public static var chocolate: Color { .init(.css(.chocolate)) }
    public static var coral: Color { .init(.css(.coral)) }
    public static var cornflowerBlue: Color { .init(.css(.cornflowerBlue)) }
    public static var cornsilk: Color { .init(.css(.cornsilk)) }
    public static var crimson: Color { .init(.css(.crimson)) }
    public static var cyan: Color { .init(.css(.cyan)) }
    public static var darkBlue: Color { .init(.css(.darkBlue)) }
    public static var darkCyan: Color { .init(.css(.darkCyan)) }
    public static var darkGoldenRod: Color { .init(.css(.darkGoldenRod)) }
    public static var darkGray: Color { .init(.css(.darkGray)) }
    public static var darkGrey: Color { .init(.css(.darkGrey)) }
    public static var darkGreen: Color { .init(.css(.darkGreen)) }
    public static var darkKhaki: Color { .init(.css(.darkKhaki)) }
    public static var darkMagenta: Color { .init(.css(.darkMagenta)) }
    public static var darkOliveGreen: Color { .init(.css(.darkOliveGreen)) }
    public static var darkOrange: Color { .init(.css(.darkorange)) }
    public static var darkOrchid: Color { .init(.css(.darkOrchid)) }
    public static var darkRed: Color { .init(.css(.darkRed)) }
    public static var darkSalmon: Color { .init(.css(.darkSalmon)) }
    public static var darkSeaGreen: Color { .init(.css(.darkSeaGreen)) }
    public static var darkSlateBlue: Color { .init(.css(.darkSlateBlue)) }
    public static var darkSlateGray: Color { .init(.css(.darkSlateGray)) }
    public static var darkSlateGrey: Color { .init(.css(.darkSlateGrey)) }
    public static var darkTurquoise: Color { .init(.css(.darkTurquoise)) }
    public static var darkViolet: Color { .init(.css(.darkViolet)) }
    public static var deepPink: Color { .init(.css(.deepPink)) }
    public static var deepSkyBlue: Color { .init(.css(.deepSkyBlue)) }
    public static var dimGray: Color { .init(.css(.dimGray)) }
    public static var dimGrey: Color { .init(.css(.dimGrey)) }
    public static var dodgerBlue: Color { .init(.css(.dodgerBlue)) }
    public static var fireBrick: Color { .init(.css(.fireBrick)) }
    public static var floralWhite: Color { .init(.css(.floralWhite)) }
    public static var forestGreen: Color { .init(.css(.forestGreen)) }
    public static var fuchsia: Color { .init(.css(.fuchsia)) }
    public static var gainsboro: Color { .init(.css(.gainsboro)) }
    public static var ghostWhite: Color { .init(.css(.ghostWhite)) }
    public static var gold: Color { .init(.css(.gold)) }
    public static var goldenRod: Color { .init(.css(.goldenRod)) }
    public static var gray: Color { .init(.css(.gray)) }
    public static var grey: Color { .init(.css(.grey)) }
    public static var green: Color { .init(.css(.green)) }
    public static var greenYellow: Color { .init(.css(.greenYellow)) }
    public static var honeyDew: Color { .init(.css(.honeyDew)) }
    public static var hotPink: Color { .init(.css(.hotPink)) }
    public static var indianRed: Color { .init(.css(.indianRed)) }
    public static var indigo: Color { .init(.css(.indigo)) }
    public static var ivory: Color { .init(.css(.ivory)) }
    public static var khaki: Color { .init(.css(.khaki)) }
    public static var lavender: Color { .init(.css(.lavender)) }
    public static var lavenderBlush: Color { .init(.css(.lavenderBlush)) }
    public static var lawnGreen: Color { .init(.css(.lawnGreen)) }
    public static var lemonChiffon: Color { .init(.css(.lemonChiffon)) }
    public static var lightBlue: Color { .init(.css(.lightBlue)) }
    public static var lightCoral: Color { .init(.css(.lightCoral)) }
    public static var lightCyan: Color { .init(.css(.lightCyan)) }
    public static var lightGoldenRodYellow: Color { .init(.css(.lightGoldenRodYellow)) }
    public static var lightGray: Color { .init(.css(.lightGray)) }
    public static var lightGrey: Color { .init(.css(.lightGrey)) }
    public static var lightGreen: Color { .init(.css(.lightGreen)) }
    public static var lightPink: Color { .init(.css(.lightPink)) }
    public static var lightSalmon: Color { .init(.css(.lightSalmon)) }
    public static var lightSeaGreen: Color { .init(.css(.lightSeaGreen)) }
    public static var lightSkyBlue: Color { .init(.css(.lightSkyBlue)) }
    public static var lightSlateGray: Color { .init(.css(.lightSlateGray)) }
    public static var lightSlateGrey: Color { .init(.css(.lightSlateGrey)) }
    public static var lightSteelBlue: Color { .init(.css(.lightSteelBlue)) }
    public static var lightYellow: Color { .init(.css(.lightYellow)) }
    public static var lime: Color { .init(.css(.lime)) }
    public static var limeGreen: Color { .init(.css(.limeGreen)) }
    public static var linen: Color { .init(.css(.linen)) }
    public static var magenta: Color { .init(.css(.magenta)) }
    public static var maroon: Color { .init(.css(.maroon)) }
    public static var mediumAquaMarine: Color { .init(.css(.mediumAquaMarine)) }
    public static var mediumBlue: Color { .init(.css(.mediumBlue)) }
    public static var mediumOrchid: Color { .init(.css(.mediumOrchid)) }
    public static var mediumPurple: Color { .init(.css(.mediumPurple)) }
    public static var mediumSeaGreen: Color { .init(.css(.mediumSeaGreen)) }
    public static var mediumSlateBlue: Color { .init(.css(.mediumSlateBlue)) }
    public static var mediumSpringGreen: Color { .init(.css(.mediumSpringGreen)) }
    public static var mediumTurquoise: Color { .init(.css(.mediumTurquoise)) }
    public static var mediumVioletRed: Color { .init(.css(.mediumVioletRed)) }
    public static var midnightBlue: Color { .init(.css(.midnightBlue)) }
    public static var mintCream: Color { .init(.css(.mintCream)) }
    public static var mistyRose: Color { .init(.css(.mistyRose)) }
    public static var moccasin: Color { .init(.css(.moccasin)) }
    public static var navajoWhite: Color { .init(.css(.navajoWhite)) }
    public static var navy: Color { .init(.css(.navy)) }
    public static var oldLace: Color { .init(.css(.oldLace)) }
    public static var olive: Color { .init(.css(.olive)) }
    public static var oliveDrab: Color { .init(.css(.oliveDrab)) }
    public static var orange: Color { .init(.css(.orange)) }
    public static var orangeRed: Color { .init(.css(.orangeRed)) }
    public static var orchid: Color { .init(.css(.orchid)) }
    public static var paleGoldenRod: Color { .init(.css(.paleGoldenRod)) }
    public static var paleGreen: Color { .init(.css(.paleGreen)) }
    public static var paleTurquoise: Color { .init(.css(.paleTurquoise)) }
    public static var paleVioletRed: Color { .init(.css(.paleVioletRed)) }
    public static var papayaWhip: Color { .init(.css(.papayaWhip)) }
    public static var peachPuff: Color { .init(.css(.peachPuff)) }
    public static var peru: Color { .init(.css(.peru)) }
    public static var pink: Color { .init(.css(.pink)) }
    public static var plum: Color { .init(.css(.plum)) }
    public static var powderBlue: Color { .init(.css(.powderBlue)) }
    public static var purple: Color { .init(.css(.purple)) }
    public static var red: Color { .init(.css(.red)) }
    public static var rosyBrown: Color { .init(.css(.rosyBrown)) }
    public static var royalBlue: Color { .init(.css(.royalBlue)) }
    public static var saddleBrown: Color { .init(.css(.saddleBrown)) }
    public static var salmon: Color { .init(.css(.salmon)) }
    public static var sandyBrown: Color { .init(.css(.sandyBrown)) }
    public static var seaGreen: Color { .init(.css(.seaGreen)) }
    public static var seaShell: Color { .init(.css(.seaShell)) }
    public static var sienna: Color { .init(.css(.sienna)) }
    public static var silver: Color { .init(.css(.silver)) }
    public static var skyBlue: Color { .init(.css(.skyBlue)) }
    public static var slateBlue: Color { .init(.css(.slateBlue)) }
    public static var slateGray: Color { .init(.css(.slateGray)) }
    public static var slateGrey: Color { .init(.css(.slateGrey)) }
    public static var snow: Color { .init(.css(.snow)) }
    public static var springGreen: Color { .init(.css(.springGreen)) }
    public static var steelBlue: Color { .init(.css(.steelBlue)) }
    public static var tan: Color { .init(.css(.tan)) }
    public static var teal: Color { .init(.css(.teal)) }
    public static var thistle: Color { .init(.css(.thistle)) }
    public static var tomato: Color { .init(.css(.tomato)) }
    public static var turquoise: Color { .init(.css(.turquoise)) }
    public static var violet: Color { .init(.css(.violet)) }
    public static var wheat: Color { .init(.css(.wheat)) }
    public static var white: Color { .init(.css(.white)) }
    public static var whiteSmoke: Color { .init(.css(.whiteSmoke)) }
    public static var yellow: Color { .init(.css(.yellow)) }
    public static var yellowGreen: Color { .init(.css(.yellowGreen)) }
    public static var transparent: Color { .init(.css(.transparent)) }
    
    public var description: String { value.description }
    
    public static func == (lhs: Color, rhs: Color) -> Bool {
        lhs.description == rhs.description
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(value.description)
    }
    
    public func stop(_ stopPoint: Double) -> Color {
        .init(.custom("\(self) \(Int(stopPoint))%"))
    }
}

public func /(lhs: Color, rhs: Double) -> Color {
    lhs.stop(rhs)
}
