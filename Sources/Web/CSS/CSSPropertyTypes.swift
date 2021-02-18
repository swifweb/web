//
//  CSSPropertyTypes.swift
//  Web
//
//  Created by Mihael Isaev on 08.07.2020.
//

public enum PropertyType: String, CustomStringConvertible {
    case alignContent = "align-content"
    case alignItems = "align-items"
    case alignSelf = "align-self"
    case all
    case animation
    case animationDelay = "animation-delay"
    case animationDirection = "animation-direction"
    case animationDuration = "animation-duration"
    case animationFillMode = "animation-fill-mode"
    case animationIterationCount = "animation-iteration-count"
    case animationName = "animation-name"
    case animationPlayState = "animation-play-state"
    case animationTimingFunction = "animation-timing-function"
    case backfaceVisibility = "backface-visibility"
    case background
    case backgroundAttachment = "background-attachment"
    case backgroundBlendMode = "background-blend-mode"
    case backgroundClip = "background-clip"
    case backgroundColor = "background-color"
    case backgroundImage = "background-image"
    case backgroundOrigin = "background-origin"
    case backgroundPosition = "background-position"
    case backgroundRepeat = "background-repeat"
    case backgroundSize = "background-size"
    case border
    case borderBottom = "border-bottom"
    case borderBottomColor = "border-bottom-color"
    case borderBottomLeftRadius = "border-bottom-left-radius"
    case borderBottomRightRadius = "border-bottom-right-radius"
    case borderBottomStyle = "border-bottom-style"
    case borderBottomWidth = "border-bottom-width"
    case borderCollapse = "border-collapse"
    case borderColor = "border-color"
    case borderImage = "border-image"
    case borderImageOutset = "border-image-outset"
    case borderImageRepeat = "border-image-repeat"
    case borderImageSlice = "border-image-slice"
    case borderImageSource = "border-image-source"
    case borderImageWidth = "border-image-width"
    case borderLeft = "border-left"
    case borderLeftColor = "border-left-color"
    case borderLeftStyle = "border-left-style"
    case borderLeftWidth = "border-left-width"
    case borderRadius = "border-radius"
    case borderRight = "border-right"
    case borderRightColor = "border-right-color"
    case borderRightStyle = "border-right-style"
    case borderRightWidth = "border-right-width"
    case borderSpacing = "border-spacing"
    case borderStyle = "border-style"
    case borderTop = "border-top"
    case borderTopColor = "border-top-color"
    case borderTopLeftRadius = "border-top-left-radius"
    case borderTopRightRadius = "border-top-right-radius"
    case borderTopStyle = "border-top-style"
    case borderTopWidth = "border-top-width"
    case borderWidth = "border-width"
    case bottom
    case boxDecorationBreak = "box-decoration-break"
    case boxShadow = "box-shadow"
    case boxSizing = "box-sizing"
    case breakAfter = "break-after"
    case breakBefore = "break-before"
    case breakInside = "break-inside"
    case captionSide = "caption-side"
    case caretColor = "caret-color"
    case charset = "charset"
    case clear
    case clip
    case color
    case columnCount = "column-count"
    case columnFill = "column-fill"
    case columnGap = "column-gap"
    case columnRule = "column-rule"
    case columnRuleColor = "column-rule-color"
    case columnRuleStyle = "column-rule-style"
    case columnRuleWidth = "column-rule-width"
    case columnSpan = "column-span"
    case columnWidth = "column-width"
    case columns
    case content
    case counterIncrement = "counter-increment"
    case counterReset = "counter-reset"
    case cursor
    case direction
    case display
    case emptyCells = "empty-cells"
    case filter
    case flex
    case flexBasis = "flex-basis"
    case flexDirection = "flex-direction"
    case flexFlow = "flex-flow"
    case flexGrow = "flex-grow"
    case flexShrink = "flex-shrink"
    case flexWrap = "flex-wrap"
    case float
    case font
    case fontFace = "font-face"
    case fontFamily = "font-family"
    case fontFeatureSettings = "font-feature-settings"
    case fontFeatureValues = "font-feature-values"
    case fontKerning = "font-kerning"
    case fontLanguageOverride = "font-language-override"
    case fontSize = "font-size"
    case fontSizeAdjust = "font-size-adjust"
    case fontStretch = "font-stretch"
    case fontStyle = "font-style"
    case fontSynthesis = "font-synthesis"
    case fontVariant = "font-variant"
    case fontVariantAlternates = "font-variant-alternates"
    case fontVariantCaps = "font-variant-caps"
    case fontVariantEastAsian = "font-variant-east-asian"
    case fontVariantLigatures = "font-variant-ligatures"
    case fontVariantNumeric = "font-variant-numeric"
    case fontVariantPosition = "font-variant-position"
    case fontWeight = "font-weight"
    case grid
    case gridArea = "grid-area"
    case gridAutoColumns = "grid-auto-columns"
    case gridAutoFlow = "grid-auto-flow"
    case gridAutoRows = "grid-auto-rows"
    case gridColumn = "grid-column"
    case gridColumnEnd = "grid-column-end"
    case gridColumnGap = "grid-column-gap"
    case gridColumnStart = "grid-column-start"
    case gridGap = "grid-gap"
    case gridRow = "grid-row"
    case gridRowEnd = "grid-row-end"
    case gridRowGap = "grid-row-gap"
    case gridRowStart = "grid-row-start"
    case gridTemplate = "grid-template"
    case gridTemplateAreas = "grid-template-areas"
    case gridTemplateColumns = "grid-template-columns"
    case gridTemplateRows = "grid-template-rows"
    case hangingPunctuation = "hanging-punctuation"
    case height
    case hyphens
    case imageRendering = "image-rendering"
    case `import` = "import"
    case isolation
    case justifyContent = "justify-content"
    case keyframes
    case left
    case letterSpacing = "letter-spacing"
    case lineBreak = "line-break"
    case lineHeight = "line-height"
    case listStyle = "list-style"
    case listStyleImage = "list-style-image"
    case listStylePosition = "list-style-position"
    case listStyleType = "list-style-type"
    case margin
    case marginBottom = "margin-bottom"
    case marginLeft = "margin-left"
    case marginRight = "margin-right"
    case margintop = "margin-top"
    case maxHeight = "max-height"
    case maxWidth = "max-width"
    case media
    case minHeight = "min-height"
    case minWidth = "min-width"
    case mixBlendMode = "mix-blend-mode"
    case objectFit = "object-fit"
    case objectPosition = "object-position"
    case opacity
    case order
    case orphans
    case outline
    case outlineColor = "outline-color"
    case outlineOffset = "outline-offset"
    case outlineStyle = "outline-style"
    case outlineWidth = "outline-width"
    case overflow
    case overflowWrap = "overflow-wrap"
    case overflowX = "overflow-x"
    case overflowY = "overflow-y"
    case padding
    case paddingBottom = "padding-bottom"
    case paddingLeft = "padding-left"
    case paddingRight = "padding-right"
    case paddingTop = "padding-top"
    case pageBreakAfter = "page-break-after"
    case pageBreakBefore = "page-break-before"
    case pageBreakInside = "page-break-inside"
    case perspective
    case perspectiveOrigin = "perspective-origin"
    case pointerEvents = "pointer-events"
    case position
    case quotes
    case resize
    case right
    case scrollBehavior = "scroll-behavior"
    case tabSize = "tab-size"
    case tableLayout = "table-layout"
    case textAlign = "text-align"
    case textAlignLast = "text-align-last"
    case textCombineUpright = "text-combine-upright"
    case textDecoration = "text-decoration"
    case textDecorationColor = "text-decoration-color"
    case textDecorationLine = "text-decoration-line"
    case textDecorationstyle = "text-decoration-style"
    case textIndent = "text-indent"
    case textJustify = "text-justify"
    case textOrientation = "text-orientation"
    case textOverflow = "text-overflow"
    case textShadow = "text-shadow"
    case textTransform = "text-transform"
    case textUnderlinePosition = "text-underline-position"
    case top
    case transform
    case transformOrigin = "transform-origin"
    case transformStyle = "transform-style"
    case transition
    case transitionDelay = "transition-delay"
    case transitionDuration = "transition-duration"
    case transitionProperty = "transition-property"
    case transitionTimingFunction = "transition-timing-function"
    case unicodeBidi = "unicode-bidi"
    case userSelect = "user-select"
    case verticalAlign = "vertical-align"
    case visibility
    case whiteSpace = "white-space"
    case widows
    case width
    case wordBreak = "word-break"
    case wordSpacing = "word-spacing"
    case wordWrap = "word-wrap"
    case writingMode = "writing-mode"
    case zIndex = "z-index"
    
    public var description: String { rawValue }
}

public struct AlignContentType: Initialable, Inheritable, Autoable, CustomStringConvertible {
    public let value: String

    public init (_ value: String) { self.value = value }

    /// The element is positioned to fit the container
    public static var stretch: Self { .init("stretch") }

    /// The element is positioned at the center of the container
    public static var center: Self { .init("center") }

    /// The element is positioned at the beginning of the container
    public static var flexStart: Self { .init("flex-start") }

    /// The element is positioned at the end of the container
    public static var flexEnd: Self { .init("flex-end") }
    
    /// Lines are evenly distributed in the flex container
    public static var spaceBetween: Self { .init("space-between") }
    
    /// Lines are evenly distributed in the flex container, with half-size spaces on either end
    public static var spaceAround: Self { .init("space-around") }

    /// The element is positioned at the baseline of the container
    public static var baseline: Self { .init("baseline") }
    
    public var description: String { value }
}

public struct AlignItemsType: Initialable, Inheritable, Autoable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// The element is positioned to fit the container
    public static var stretch: Self { .init("stretch") }
    
    /// The element is positioned at the center of the container
    public static var center: Self { .init("center") }
    
    /// The element is positioned at the beginning of the container
    public static var flexStart: Self { .init("flex-start") }
    
    /// The element is positioned at the end of the container
    public static var flexEnd: Self { .init("flex-end") }
    
    /// The element is positioned at the baseline of the container
    public static var baseline: Self { .init("baseline") }
    
    public var description: String { value }
}

public struct AlignSelfType: Initialable, Inheritable, Autoable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// The element is positioned to fit the container
    public static var stretch: Self { .init("stretch") }
    
    /// The element is positioned at the center of the container
    public static var center: Self { .init("center") }
    
    /// The element is positioned at the beginning of the container
    public static var flexStart: Self { .init("flex-start") }
    
    /// The element is positioned at the end of the container
    public static var flexEnd: Self { .init("flex-end") }
    
    /// The element is positioned at the baseline of the container
    public static var baseline: Self { .init("baseline") }
    
    public var description: String { value }
}

public struct AllType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Changes all the properties applied to the element
    /// or the element's parent to their parent value
    /// if they are inheritable or to their initial value if not
    public static var unset: Self { .init("unset") }
    
    public var description: String { value }
}

public struct AnimationDirectionType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Default value. The animation is played as normal (forwards)
    public static var normal: Self { .init("normal") }
    
    /// The animation is played in reverse direction (backwards)
    public static var reverse: Self { .init("reverse") }
    
    /// The animation is played forwards first, then backwards
    public static var alternate: Self { .init("alternate") }
    
    /// The animation is played backwards first, then forwards
    public static var alternateReverse: Self { .init("alternate-reverse") }
    
    public var description: String { value }
}

public struct AnimationFillModeType: Noneable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// The element will retain the style values that is set by the last keyframe
    /// (depends on animation-direction and animation-iteration-count)
    public static var forwards: Self { .init("forwards") }
    
    /// The element will get the style values that is set by the first keyframe
    /// (depends on animation-direction), and retain this during the animation-delay period
    public static var backwards: Self { .init("backwards") }
    
    /// The animation will follow the rules for both forwards
    /// and backwards, extending the animation properties in both directions
    public static var both: Self { .init("both") }
    
    public var description: String { value }
}

public struct AnimationPlayStateType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Specifies that the animation is paused
    public static var paused: Self { .init("paused") }
    
    /// Default value. Specifies that the animation is running
    public static var running: Self { .init("running") }
    
    public var description: String { value }
}

public struct AutoType: Initialable, Inheritable, Autoable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    public var description: String { value }
}

public struct BackfaceVisibilityType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Default value. The backside is visible
    public static var visible: Self { .init("visible") }
    
    /// The backside is not visible
    public static var hidden: Self { .init("hidden") }
    
    public var description: String { value }
}

public struct BackgroundAttachmentType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// The background image will scroll with the page. This is default
    public static var scroll: Self { .init("scroll") }
    
    /// The background image will not scroll with the page
    public static var fixed: Self { .init("fixed") }
    
    /// The background image will scroll with the element's contents
    public static var local: Self { .init("local") }
    
    public var description: String { value }
}

public struct BackgroundBlendModeType: Valuable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// This is default. Sets the blending mode to normal
    public static var normal: Self { .init("normal") }
    
    /// Sets the blending mode to multiply
    public static var multiply: Self { .init("multiply") }
    
    /// Sets the blending mode to screen
    public static var screen: Self { .init("screen") }
    
    /// Sets the blending mode to overlay
    public static var overlay: Self { .init("overlay") }
    
    /// Sets the blending mode to darken
    public static var darken: Self { .init("darken") }
    
    /// Sets the blending mode to lighten
    public static var lighten: Self { .init("lighten") }
    
    /// Sets the blending mode to color-dodge
    public static var colorDodge: Self { .init("color-dodge") }
    
    /// Sets the blending mode to saturation
    public static var saturation: Self { .init("saturation") }
    
    /// Sets the blending mode to color
    public static var color: Self { .init("color") }
    
    /// Sets the blending mode to luminosity
    public static var luminosity: Self { .init("luminosity") }
    
    public var description: String { value }
}

public struct BackgroundClipType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Default value.
    /// The background extends behind the border
    public static var borderBox: Self { .init("border-box") }
    
    /// The background extends to the inside edge of the border
    public static var paddingBox: Self { .init("padding-box") }
    
    /// The background extends to the edge of the content box
    public static var contentBox: Self { .init("content-box") }
    
    public var description: String { value }
}

public struct BackgroundOriginType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Default value.
    /// The background image starts from the upper left corner of the padding edge
    public static var paddingBox: Self { .init("padding-box") }
    
    /// The background image starts from the upper left corner of the border
    public static var borderBox: Self { .init("border-box") }
    
    /// The background image starts from the upper left corner of the content
    public static var contentBox: Self { .init("content-box") }
    
    public var description: String { value }
}

public struct BackgroundPositionType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    public static var center: Self { .init("center") }
    
    public static func axis(h: XAxis, v: YAxis) -> Self { .init([h.value, v.value].joined(separator: " ")) }
        
    public static func percent(h: NumericValue, v: NumericValue) -> Self { .init([h.numericValue, v.numericValue].joined(separator: " ")) }
    
    public static func position<H: UnitValuable, V: UnitValuable>(h: H, v: V) -> Self { .init([h.description, v.description].joined(separator: " ")) }
    
    public var description: String { value }
}

public struct BackgroundRepeatType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// The background image is repeated both vertically and horizontally.
    /// The last image will be clipped if it does not fit.
    /// This is default
    public static var `repeat`: Self { .init("repeat") }
    
    /// The background image is repeated only horizontally
    public static var repeatX: Self { .init("repeat-x") }
    
    /// The background image is repeated only vertically
    public static var repeatY: Self { .init("repeat-y") }
    
    /// The background-image is not repeated. The image will only be shown once
    public static var noRepeat: Self { .init("no-repeat") }
    
    /// The background-image is repeated as much as possible without clipping.
    /// The first and last images are pinned to either side of the element,
    /// and whitespace is distributed evenly between the images
    public static var space: Self { .init("space") }
    
    /// The background-image is repeated and squished or stretched to fill the space (no gaps)
    public static var round: Self { .init("round") }
    
    public var description: String { value }
}

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

public struct BorderCollapseType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Borders are separated; each cell will display its own borders.
    /// This is default.
    public static var separate: Self { .init("separate") }
    
    /// Borders are collapsed into a single border when possible
    /// (border-spacing and empty-cells properties have no effect)
    public static var collapse: Self { .init("collapse") }
    
    public var description: String { value }
}

public struct BorderImageOutsetType: Initialable, Inheritable, Lengthable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Represent multiples of the corresponding border-width
    public static func number(_ n: NumericValue) -> Self { .init(n.numericValue) }
    
    public var description: String { value }
}

public struct BorderImageRepeatType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Default value. The image is stretched to fill the area
    public static var stretch: Self { .init("stretch") }
    
    /// The image is tiled (repeated) to fill the area
    public static var `repeat`: Self { .init("repeat") }
    
    /// The image is tiled (repeated) to fill the area. If it does not fill the area with a whole number of tiles, the image is rescaled so it fits
    public static var round: Self { .init("round") }
    
    /// The image is tiled (repeated) to fill the area. If it does not fill the area with a whole number of tiles, the extra space is distributed around the tiles
    public static var space: Self { .init("space") }
    
    public var description: String { value }
}

public struct BorderImageSliceType: Initialable, Inheritable, Percentable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Causes the middle part of the image to be displayed
    public static var fill: Self { .init("fill") }
    
    /// The number(s) represent pixels for raster images or coordinates for vector images
    public static func number(_ n: NumericValue) -> Self { .init(n.numericValue) }
    
    public var description: String { value }
}

public final class BorderRadiusType: Initialable, Inheritable, Lengthable, Percentable, CustomStringConvertible, _PropertyValueInnerChangeable {
    @State public var value: String
    
    var _changeHandler = {}
    
    required public init (_ value: String) { self.value = value }
    
    public var description: String { value }
}

public struct BorderStyleType: Noneable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// The same as "none", except in border conflict resolution for table elements
    public static var hidden: Self { .init("hidden") }
    
    /// Specifies a dotted border
    public static var dotted: Self { .init("dotted") }
    
    /// Specifies a dashed border
    public static var dashed: Self { .init("dashed") }
    
    /// Specifies a solid border
    public static var solid: Self { .init("solid") }
    
    /// Specifies a double border
    public static var double: Self { .init("double") }
    
    /// Specifies a 3D grooved border. The effect depends on the border-color value
    public static var groove: Self { .init("groove") }
    
    /// Specifies a 3D ridged border. The effect depends on the border-color value
    public static var ridge: Self { .init("ridge") }
    
    /// Specifies a 3D inset border. The effect depends on the border-color value
    public static var inset: Self { .init("inset") }
    
    /// Specifies a 3D outset border. The effect depends on the border-color value
    public static var outset: Self { .init("outset") }
    
    public var description: String { value }
}

public struct BorderWidthType: Initialable, Inheritable, Lengthable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Specifies a medium border. This is default
    public static var medium: Self { .init("medium") }
    
    /// Specifies a thin border
    public static var thin: Self { .init("thin") }
    
    /// Specifies a thick border
    public static var thick: Self { .init("thick") }
    
    public var description: String { value }
}

public struct BoxDecorationBreakType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Default. Box decorations are applied to the element
    /// as a whole and break at the edges of the element fragments
    public static var slice: Self { .init("slice") }
    
    /// Box decorations apply to each fragment of the element
    /// as if the fragments were individual elements.
    /// Borders wrap the four edges of each fragment of the element,
    /// and backgrounds are redrawn in full for each fragment
    public static var clone: Self { .init("clone") }
    
    public var description: String { value }
}

public struct BoxSizingType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Default. The width and height properties (and min/max properties) includes only the content. Border and padding are not included
    public static var contentBox: Self { .init("content-box") }
    
    /// The width and height properties (and min/max properties) includes content, padding and border
    public static var borderBox: Self { .init("border-box") }
    
    public var description: String { value }
}

public struct BreakInsideType: Autoable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Avoid a page/column/region break inside the element
    public static var avoid: Self { .init("avoid") }
    
    /// Avoid a column-break inside the element
    public static var avoidColumn: Self { .init("avoid-column") }
    
    /// Avoid a page-break inside the element
    public static var avoidPage: Self { .init("avoid-page") }
    
    /// Avoid a region-break inside the element
    public static var avoidRegion: Self { .init("avoid-region") }
    
    public var description: String { value }
}

public struct BreakType: Autoable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Always insert a page-break right before the principal box
    public static var all: Self { .init("all") }
    
    /// Always insert a page-break before the element
    public static var always: Self { .init("always") }
    
    /// Avoid a page/column/region break before the element
    public static var avoid: Self { .init("avoid") }
    
    /// Avoid a column-break before the element
    public static var avoidColumn: Self { .init("avoid-column") }
    
    /// Avoid a page-break before the element
    public static var avoidPage: Self { .init("avoid-page") }
    
    /// Avoid a region-break before the element
    public static var avoidRegion: Self { .init("avoid-region") }
    
    /// Always insert a column-break before the element
    public static var column: Self { .init("column") }
    
    /// Insert one or two page-breaks before the element so that the next page is formatted as a left page
    public static var left: Self { .init("left") }
    
    /// Always insert a page-break before the element
    public static var page: Self { .init("page") }
    
    /// Insert one or two page-breaks before the principal box so that the next page is formatted as a recto page
    public static var recto: Self { .init("recto") }
    
    /// Always insert a region-break before the element
    public static var region: Self { .init("region") }
    
    /// Insert one or two page-breaks before the element so that the next page is formatted as a right page
    public static var right: Self { .init("right") }
    
    /// Insert one or two page-breaks before the principal box so that the next page is formatted as a verso page
    public static var verso: Self { .init("verso") }
    
    public var description: String { value }
}

public struct CaptionSideType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Puts the caption above the table. This is default
    public static var top: Self { .init("top") }
    
    /// Puts the caption below the table
    public static var bottom: Self { .init("bottom") }
    
    public var description: String { value }
}

public struct ClearType: Noneable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// No floating elements allowed on the left side
    public static var left: Self { .init("left") }
    
    /// No floating elements allowed on the right side
    public static var right: Self { .init("right") }
    
    /// No floating elements allowed on either the left or the right side
    public static var both: Self { .init("both") }
    
    public var description: String { value }
}

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
            return "hsla(\(hue), \(saturation)%, \(lightness)%, \(alpha))"
        }
    }
}

public struct ColumnFillType: Autoable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Default value.
    /// Fills each column with about the same amount of content,
    /// but will not allow the columns to be taller than the height
    /// (so, columns might be shorter than the height
    /// as the browser distributes the content evenly horizontally)
    public static var balance: Self { .init("balance") }
    
    public var description: String { value }
}

public struct ColumnRuleStyleType: Initialable, Inheritable, Noneable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Defines a hidden rule
    public static var hidden: Self { .init("hidden") }
    
    /// Defines a dotted rule
    public static var dotted: Self { .init("dotted") }
    
    /// Defines a dashed rule
    public static var dashed: Self { .init("dashed") }
    
    /// Defines a solid rule
    public static var solid: Self { .init("solid") }
    
    /// Defines a double rule
    public static var double: Self { .init("double") }
    
    /// Specifies a 3D grooved rule. The effect depends on the width and color values
    public static var groove: Self { .init("groove") }
    
    /// Specifies a 3D ridged rule. The effect depends on the width and color values
    public static var ridge: Self { .init("ridge") }
    
    /// Specifies a 3D inset rule. The effect depends on the width and color values
    public static var inset: Self { .init("inset") }
    
    /// Specifies a 3D outset rule. The effect depends on the width and color values
    public static var outset: Self { .init("outset") }
    
    public var description: String { value }
}

public struct ColumnRuleWidthType: Initialable, Inheritable, Lengthable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Default value. Defines a medium rule
    public static var medium: Self { .init("medium") }
    
    /// Defines a thin rule
    public static var thin: Self { .init("thin") }
    
    /// Defines a thick rule
    public static var thick: Self { .init("thick") }
    
    public var description: String { value }
}

public struct ColumnSpanType: Initialable, Inheritable, Noneable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// The element should span across all columns
    public static var all: Self { .init("all") }
    
    public var description: String { value }
}

public struct ContentType: Initialable, Inheritable, Noneable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Default value. Sets the content, if specified, to normal, which default is "none" (which is nothing)
    public static var normal: Self { .init("normal") }
    
    /// Sets the content as a counter
    public static var counter: Self { .init("counter") }
    
    /// Sets the content as one of the selector's attribute
    public static func attr(_ attribute: String) -> Self { .init("attr(\(attribute))") }
    
    /// Sets the content to the text you specify
    public static func string(_ v: String) -> Self { .init(v) }
    
    /// Sets the content to be an opening quote
    public static var openQuote: Self { .init("open-quote") }
    
    /// Sets the content to be a closing quote
    public static var closeQuote: Self { .init("close-quote") }
    
    /// Removes the opening quote from the content, if specified
    public static var noOpenQuote: Self { .init("no-open-quote") }
    
    /// Removes the closing quote from the content, if specified
    public static var noCloseQuote: Self { .init("no-close-quote") }
    
    /// Sets the content to be some kind of media (an image, a sound, a video, etc.)
    public static func url(_ url: String) -> Self { .init("url(\(url))") }
    
    public var description: String { value }
}

public struct CounterResetType: Noneable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// The id defines which counter to reset.
    /// The number sets the value the counter is reset to on each occurrence of the selector.
    /// The default number value is 0
    public static func id(_ id: Id, index: Int) -> Self { .init(id.name + " \(index)") }
    
    public var description: String { value }
}

public struct CursorType: Autoable, Noneable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// The cursor indicates an alias of something is to be created
    public static var alias: Self { .init("alias") }
    
    /// The cursor indicates that something can be scrolled in any direction
    public static var allScroll: Self { .init("all-scroll") }
    
    /// The cursor indicates that a cell (or set of cells) may be selected
    public static var cell: Self { .init("cell") }
    
    /// The cursor indicates that a context-menu is available
    public static var contextMenu: Self { .init("context-menu") }
    
    /// The cursor indicates that the column can be resized horizontally
    public static var colResize: Self { .init("col-resize") }
    
    /// The cursor indicates something is to be copied
    public static var copy: Self { .init("copy") }
    
    /// The cursor render as a crosshair
    public static var crosshair: Self { .init("crosshair") }
    
    /// The default cursor
    public static var `default`: Self { .init("default") }
    
    /// The cursor indicates that an edge of a box is to be moved right (east)
    public static var eResize: Self { .init("e-resize") }
    
    /// Indicates a bidirectional resize cursor
    public static var ewResize: Self { .init("ew-resize") }
    
    /// The cursor indicates that something can be grabbed
    public static var grab: Self { .init("grab") }
    
    /// The cursor indicates that something can be grabbed
    public static var grabbing: Self { .init("grabbing") }
    
    /// The cursor indicates that help is available
    public static var help: Self { .init("help") }
    
    /// The cursor indicates something is to be moved
    public static var move: Self { .init("move") }
    
    /// The cursor indicates that an edge of a box is to be moved up (north)
    public static var nResize: Self { .init("n-resize") }
    
    /// The cursor indicates that an edge of a box is to be moved up and right (north/east)
    public static var neResize: Self { .init("ne-resize") }
    
    /// Indicates a bidirectional resize cursor
    public static var neswResize: Self { .init("nesw-resize") }
    
    /// Indicates a bidirectional resize cursor
    public static var nsResize: Self { .init("ns-resize") }
    
    /// The cursor indicates that an edge of a box is to be moved up and left (north/west)
    public static var nwResize: Self { .init("nw-resize") }
    
    /// Indicates a bidirectional resize cursor
    public static var nwseResize: Self { .init("nwse-resize") }
    
    /// The cursor indicates that the dragged item cannot be dropped here
    public static var noDrop: Self { .init("no-drop") }
    
    /// The cursor indicates that the requested action will not be executed
    public static var notAllowed: Self { .init("not-allowed") }
    
    /// The cursor is a pointer and indicates a link
    public static var pointer: Self { .init("pointer") }
    
    /// The cursor indicates that the program is busy (in progress)
    public static var progress: Self { .init("progress") }
    
    /// The cursor indicates that the row can be resized vertically
    public static var rowResize: Self { .init("row-resize") }
    
    /// The cursor indicates that an edge of a box is to be moved down (south)
    public static var sResize: Self { .init("s-resize") }
    
    /// The cursor indicates that an edge of a box is to be moved down and right (south/east)
    public static var seResize: Self { .init("se-resize") }
    
    /// The cursor indicates that an edge of a box is to be moved down and left (south/west)
    public static var swResize: Self { .init("sw-resize") }
    
    /// The cursor indicates text that may be selected
    public static var text: Self { .init("text") }
    
    /// A comma separated list of URLs to custom cursors. Note: Always specify a generic cursor at the end of the list, in case none of the URL-defined cursors can be used
    public static var url: Self { .init("URL") }
    
    /// The cursor indicates vertical-text that may be selected
    public static var verticalText: Self { .init("vertical-text") }
    
    /// The cursor indicates that an edge of a box is to be moved left (west)
    public static var wResize: Self { .init("w-resize") }
    
    /// The cursor indicates that the program is busy
    public static var wait: Self { .init("wait") }
    
    /// The cursor indicates that something can be zoomed in
    public static var zoomIn: Self { .init("zoom-in") }
    
    /// The cursor indicates that something can be zoomed out
    public static var zoomOut: Self { .init("zoom-out") }
    
    public var description: String { value }
}

public struct DirectionType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Text direction goes from left-to-right. This is default
    public static var ltr: Self { .init("ltr") }
    
    /// Text direction goes from right-to-left
    public static var rtl: Self { .init("rtl") }
    
    public var description: String { value }
}

public struct DisplayType: Noneable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Displays an element as an inline element (like <span>). Any height and width properties will have no effect
    public static var inline: Self { .init("inline") }
    
    /// Displays an element as a block element (like <p>). It starts on a new line, and takes up the whole width
    public static var block: Self { .init("block") }
    
    /// Makes the container disappear, making the child elements children of the element the next level up in the DOM
    public static var contents: Self { .init("contents") }
    
    /// Displays an element as a block-level flex container
    public static var flex: Self { .init("flex") }
    
    /// Displays an element as a block-level grid container
    public static var grid: Self { .init("grid") }
    
    /// Displays an element as an inline-level block container. The element itself is formatted as an inline element, but you can apply height and width values
    public static var inlineBlock: Self { .init("inline-block") }
    
    /// Displays an element as an inline-level flex container
    public static var inlineFlex: Self { .init("inline-flex") }
    
    /// Displays an element as an inline-level grid container
    public static var inlineGrid: Self { .init("inline-grid") }
    
    /// The element is displayed as an inline-level table
    public static var inlineTable: Self { .init("inline-table") }
    
    /// Let the element behave like a <li> element
    public static var listItem: Self { .init("list-item") }
    
    /// Displays an element as either block or inline, depending on context
    public static var runIn: Self { .init("run-in") }
    
    /// Let the element behave like a <table> element
    public static var table: Self { .init("table") }
    
    /// Let the element behave like a <caption> element
    public static var tableCaption: Self { .init("table-caption") }
    
    /// Let the element behave like a <colgroup> element
    public static var tableColumnGroup: Self { .init("table-column-group") }
    
    /// Let the element behave like a <thead> element
    public static var tableHeaderGroup: Self { .init("table-header-group") }
    
    /// Let the element behave like a <tfoot> element
    public static var tableFooterGroup: Self { .init("table-footer-group") }
    
    /// Let the element behave like a <tbody> element
    public static var tableRowGroup: Self { .init("table-row-group") }
    
    /// Let the element behave like a <td> element
    public static var tableCell: Self { .init("table-cell") }
    
    /// Let the element behave like a <col> element
    public static var tableColumn: Self { .init("table-column") }
    
    /// Let the element behave like a <tr> element
    public static var tableRow: Self { .init("table-row") }
    
    public var description: String { value }
}

public struct EmptyCellsType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Display borders on empty cells. This is default
    public static var show: Self { .init("show") }
    
    /// Hide borders on empty cells
    public static var hide: Self { .init("hide") }
    
    public var description: String { value }
}

public struct FilterType: Noneable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Applies a blur effect to the image. A larger value will create more blur.
    ///
    /// If no value is specified, 0 is used.
    public static func blur(_ px: NumericValue) -> Self { .init("blur(\(px)px") }
    
    /// Adjusts the brightness of the image.
    ///
    /// 0% will make the image completely black.
    /// 100% (1) is default and represents the original image.
    /// Values over 100% will provide brighter results.
    public static func brightness(_ p: NumericValue) -> Self { .init("brightness(\(p)%)") }
    
    /// Adjusts the contrast of the image.
    ///
    /// 0% will make the image completely black.
    /// 100% (1) is default, and represents the original image.
    /// Values over 100% will provide results with more contrast.
    public static func contrast(_ p: NumericValue) -> Self { .init("contrast(\(p)%)") }
    
    /// Applies a drop shadow effect to the image.
    ///
    /// Possible values:
    /// h-shadow - Required. Specifies a pixel value for the horizontal shadow. Negative values place the shadow to the left of the image.
    ///
    /// v-shadow - Required. Specifies a pixel value for the vertical shadow. Negative values place the shadow above the image.
    ///
    /// blur - Optional. This is the third value, and must be in pixels. Adds a blur effect to the shadow. A larger value will create more blur (the shadow becomes bigger and lighter). Negative values are not allowed. If no value is specified, 0 is used (the shadow's edge is sharp).
    ///
    /// spread - Optional. This is the fourth value, and must be in pixels. Positive values will cause the shadow to expand and grow bigger, and negative values will cause the shadow to shrink. If not specified, it will be 0 (the shadow will be the same size as the element).
    /// Note: Chrome, Safari and Opera, and maybe other browsers, do not support this 4th length; it will not render if added.
    ///
    /// color - Optional. Adds a color to the shadow. If not specified, the color depends on the browser (often black).
    ///
    /// An example of creating a red shadow, which is 8px big both horizontally and vertically, with a blur effect of 10px:
    ///
    /// filter: drop-shadow(8px 8px 10px red);
    ///
    /// Tip: This filter is similar to the box-shadow property.
    public static func dropShadow<H: UnitValuable, V: UnitValuable>(h: H, v: V, blur: NumericValue? = nil, spread: NumericValue? = nil, color: ColorType? = nil) -> Self {
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
        return .init("drop-shadow(\(elements.joined(separator: " "))")
    }
    
    /// Converts the image to grayscale.
    ///
    /// 0% (0) is default and represents the original image.
    /// 100% will make the image completely gray (used for black and white images).
    ///
    /// Note: Negative values are not allowed.
    public static func grayscale(_ p: NumericValue) -> Self { .init("grayscale(\(p)%)") }
    
    /// Applies a hue rotation on the image. The value defines the number of degrees around the color circle the image samples will be adjusted. 0deg is default, and represents the original image.
    ///
    /// Note: Maximum value is 360deg.
    public static func hueRotate(_ deg: AngleValue) -> Self { .init("hue-rotate(\(deg.angleValue)") }
    
    /// Inverts the samples in the image.
    ///
    /// 0% (0) is default and represents the original image.
    /// 100% will make the image completely inverted.
    ///
    /// Note: Negative values are not allowed.
    public static func invert(_ p: NumericValue) -> Self { .init("invert(\(p)%)") }
    
    /// Sets the opacity level for the image. The opacity-level describes the transparency-level, where:
    ///
    /// 0% is completely transparent.
    /// 100% (1) is default and represents the original image (no transparency).
    ///
    /// Note: Negative values are not allowed.
    /// Tip: This filter is similar to the opacity property.
    public static func opacity(_ p: NumericValue) -> Self { .init("opacity(\(p)%)") }
    
    /// Saturates the image.
    ///
    /// 0% (0) will make the image completely un-saturated.
    /// 100% is default and represents the original image.
    /// Values over 100% provides super-saturated results.
    ///
    /// Note: Negative values are not allowed.
    public static func saturate(_ p: NumericValue) -> Self { .init("saturate(\(p)%)") }
    
    /// Converts the image to sepia.
    ///
    /// 0% (0) is default and represents the original image.
    /// 100% will make the image completely sepia.
    ///
    /// Note: Negative values are not allowed.
    public static func sepia(_ p: NumericValue) -> Self { .init("sepia(\(p)%") }
    
    /// The url() function takes the location of an XML file that specifies an SVG filter, and may include an anchor to a specific filter element. Example:
    ///
    /// filter: url(svg-url#element-id)
    public static func url(_ v: String) -> Self { .init("url(svg-url\(v)") }
    
    public var description: String { value }
}

public struct FlexDirectionType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Default value. The flexible items are displayed horizontally, as a row
    public static var row: Self { .init("row") }
    
    /// Same as row, but in reverse order
    public static var rowReverse: Self { .init("row-reverse") }
    
    /// The flexible items are displayed vertically, as a column
    public static var column: Self { .init("column") }
    
    /// Same as column, but in reverse order
    public static var columnReverse: Self { .init("column-reverse") }
    
    public var description: String { value }
}

public struct FlexWrapType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Default value. Specifies that the flexible items will not wrap
    public static var nowrap: Self { .init("nowrap") }
    
    /// Specifies that the flexible items will wrap if necessary
    public static var wrap: Self { .init("wrap") }
    
    /// Specifies that the flexible items will wrap, if necessary, in reverse order
    public static var wrapReverse: Self { .init("wrap-reverse") }
    
    public var description: String { value }
}

public struct FloatType: Noneable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// The element floats to the left of its container
    public static var left: Self { .init("left") }
    
    /// The element floats the right of its container
    public static var right: Self { .init("right") }
    
    public var description: String { value }
}

public struct FontFamilyType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String

    public init (_ value: String) { self.value = value }
    
    /// The name of a font family. For example, "Times" and "Helvetica" are font families.
    /// Font family names containing whitespace should be quoted.
    public static func familyName(_ v: String) -> Self { .init(v) }
    
    /// Glyphs have finishing strokes, flared or tapering ends, or have actual serifed endings.
    /// E.g. Lucida Bright, Lucida Fax, Palatino, "Palatino Linotype", Palladio, "URW Palladio", serif.
    public static var serif: Self { .init("serif") }
    
    /// Glyphs have stroke endings that are plain.
    /// E.g. "Open Sans", "Fira Sans", "Lucida Sans", "Lucida Sans Unicode", "Trebuchet MS", "Liberation Sans", "Nimbus Sans L", sans-serif.
    public static var sansSerif: Self { .init("sans-serif") }
    
    /// All glyphs have the same fixed width.
    /// E.g. "Fira Mono", "DejaVu Sans Mono", Menlo, Consolas, "Liberation Mono", Monaco, "Lucida Console", monospace.
    public static var monospace: Self { .init("monospace") }
    
    /// Glyphs in cursive fonts generally have either joining strokes
    /// or other cursive characteristics beyond those of italic typefaces.
    /// The glyphs are partially or completely connected,
    /// and the result looks more like handwritten pen or brush
    /// writing than printed letterwork.
    /// E.g. "Brush Script MT", "Brush Script Std", "Lucida Calligraphy", "Lucida Handwriting", "Apple Chancery", cursive.
    public static var cursive: Self { .init("cursive") }
    
    /// Fantasy fonts are primarily decorative fonts that contain playful representations of characters.
    /// E.g. Papyrus, Herculanum, Party LET, Curlz MT, Harrington, fantasy.
    public static var fantasy: Self { .init("fantasy") }
    
    /// Glyphs are taken from the default user interface font on a given platform.
    /// Because typographic traditions vary widely across the world,
    /// this generic is provided for typefaces that don't map cleanly into the other generics.
    /// This is example system-ui text.
    public static var systemUI: Self { .init("system-ui") }
    
    /// The default user interface serif font.
    /// This is example ui-serif text.
    public static var uiSerif: Self { .init("ui-serif") }
    
    /// The default user interface sans-serif font.
    /// This is example ui-sans-serif text.
    public static var uiSansSerif: Self { .init("ui-sans-serif") }
    
    /// The default user interface monospace font.
    /// This is example ui-monospace text.
    public static var uiMonospace: Self { .init("ui-monospace") }
    
    /// The default user interface font that has rounded features.
    /// This is example ui-rounded text.
    public static var uiRounded: Self { .init("ui-rounded") }
    
    /// This is for the particular stylistic concerns of representing mathematics:
    /// superscript and subscript, brackets that cross several lines,
    /// nesting expressions, and double struck glyphs with distinct meanings.
    /// This is some example math text: ax² + bx + c = 0.
    public static var math: Self { .init("math") }
    
    /// Fonts that are specifically designed to render emoji.
    /// This is some example emoji text: ✝♾.
    public static var emoji: Self { .init("emoji") }
    
    /// A particular style of Chinese characters that are
    /// between serif-style Song and cursive-style Kai forms.
    /// This style is often used for government documents.
    /// This is some example fangsong text
    /// with the Chinese characters for "fangsong" in traditional
    /// and simple forms, respectively: 仿宋體 仿宋体.
    public static var fangsong: Self { .init("fangsong") }
    
    public var description: String { value }
}

public struct FontKerningType: Autoable, Noneable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Font kerning information stored in the font must be applied.
    public static var normal: Self { .init("normal") }
    
    public var description: String { value }
}

public struct FontLanguageOverrideType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Tells the browser to use font glyphs that are appropriate
    /// for the language specified by the lang attribute.
    /// This is the default value.
    public static var normal: Self { .init("normal") }
    
    /// Tells the browser to use font glyphs that are appropriate
    /// for the language specified by the string.
    /// The string must match a language tag found in the OpenType language system.
    /// For example, `ENG` is English, and `KOR` is Korean.
    public static func string(_ v: String) -> Self { .init("\"\(v)\"") }
    
    public var description: String { value }
}

public struct FontSizeAdjustType: Noneable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    public var description: String { value }
}

public struct FontSizeType: Initialable, Inheritable, Lengthable, Percentable, AbsoluteSizeable, RelativeSizeable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    public var description: String { value }
}

public struct FontStretchType: Percentable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Specifies a normal font face.
    public static var normal: Self { .init("normal") }
    
    /// Specifies a more condensed font face than normal, with ultra-condensed as the most condensed.
    public static var semiCondensed: Self { .init("semi-condensed") }
    
    /// Specifies a more condensed font face than normal, with ultra-condensed as the most condensed.
    public static var condensed: Self { .init("condensed") }
    
    /// Specifies a more condensed font face than normal, with ultra-condensed as the most condensed.
    public static var extraCondensed: Self { .init("extra-condensed") }
    
    /// Specifies a more condensed font face than normal, with ultra-condensed as the most condensed.
    public static var ultraCondensed: Self { .init("ultra-condensed") }
    
    /// Specifies a more expanded font face than normal, with ultra-expanded as the most expanded.
    public static var semiExpanded: Self { .init("semi-expanded") }
    
    /// Specifies a more expanded font face than normal, with ultra-expanded as the most expanded.
    public static var expanded: Self { .init("expanded") }
    
    /// Specifies a more expanded font face than normal, with ultra-expanded as the most expanded.
    public static var extraExpanded: Self { .init("extra-expanded") }
    
    /// Specifies a more expanded font face than normal, with ultra-expanded as the most expanded.
    public static var ultraExpanded: Self { .init("ultra-expanded") }
    
    public var description: String { value }
}

public struct FontStyleType: Valuable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Selects a font that is classified as normal within a font-family.
    public static var normal: Self { .init("normal") }
    
    /// Selects a font that is classified as italic.
    /// If no italic version of the face is available, one classified as oblique is used instead.
    /// If neither is available, the style is artificially simulated.
    public static var italic: Self { .init("italic") }
    
    /// Selects a font that is classified as oblique.
    /// If no oblique version of the face is available, one classified as italic is used instead.
    /// If neither is available, the style is artificially simulated.
    public static var oblique: Self { .init("oblique") }
    
    /// Selects a font classified as oblique, and additionally specifies an angle
    /// for the slant of the text. If one or more oblique faces are available in the chosen font family,
    /// the one that most closely matches the specified angle is chosen.
    /// If no oblique faces are available, the browser will synthesize an oblique version
    /// of the font by slanting a normal face by the specified amount.
    /// Valid values are degree values of -90deg to 90deg inclusive.
    /// If an angle is not specified, an angle of 14 degrees is used.
    /// Positive values are slanted to the end of the line,
    /// while negative values are slanted towards the beginning.
    ///
    /// In general, for a requested angle of 14 degrees or greater,
    /// larger angles are prefered; otherwise, smaller angles are preferred
    /// (see the spec's font matching section for the precise algorithm).
    public static func oblique(_ angle: AngleValue) -> Self { .init("oblique " + angle.angleValue) }
    
    public var description: String { value }
}

public struct FontSynthesisType: Noneable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// This keyword indicates that a bold typeface may be synthesized if needed.
    public static var weight: Self { .init("weight") }
    
    /// This keyword indicates that an italic typeface may be synthesized if needed.
    public static var style: Self { .init("style") }
    
    public var description: String { value }
}

public struct FontType: Initialable, Inheritable {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Uses the font that are used by captioned controls (like buttons, drop-downs, etc.)
    public static var caption: Self { .init("caption") }
    
    /// Uses the font that are used by icon labels
    public static var icon: Self { .init("icon") }
    
    /// Uses the fonts that are used by dropdown menus
    public static var menu: Self { .init("menu") }
    
    /// Uses the fonts that are used by dialog boxes
    public static var messageBox: Self { .init("message-box") }
    
    /// A smaller version of the caption font
    public static var smallCaption: Self { .init("small-caption") }
    
    /// Uses the fonts that are used by the status bar
    public static var statusBar: Self { .init("status-bar") }
}

public protocol FontVariantAlternatable: Valuable {
    static var historicalForms: Self { get }
    static func stylistic(_ fontNameNumber: Int) -> Self
    static func styleset(_ fontNameNumber: Int) -> Self
    static func characterVariant(_ fontNameNumber: Int) -> Self
    static func swash(_ fontNameNumber: Int) -> Self
    static func ornaments(_ fontNameNumber: Int) -> Self
    static func annotation(_ fontNameNumber: Int) -> Self
}

extension FontVariantAlternatable {
    /// This keyword enables historical forms — glyphs that were common in the past but not today.
    /// It corresponds to the OpenType value `hist`.
    public static var historicalForms: Self { .init("historical-forms") }
    
    /// This function enables stylistic alternates for individual characters.
    /// The parameter is a font-specific name mapped to a number.
    /// It corresponds to the OpenType value `salt`, like `salt 2`.
    public static func stylistic(_ fontNameNumber: Int) -> Self { .init("stylistic(\(fontNameNumber))") }
    
    /// This function enables stylistic alternatives for sets of characters.
    /// The parameter is a font-specific name mapped to a number.
    /// It corresponds to the OpenType value `ssXY`, like `ss02`.
    public static func styleset(_ fontNameNumber: Int) -> Self { .init("styleset(\(fontNameNumber))") }
    
    /// This function enables specific stylistic alternatives for characters.
    /// It is similar to styleset(), but doesn't create coherent glyphs for a set of characters;
    /// individual characters will have independent and not necessarily coherent styles.
    /// The parameter is a font-specific name mapped to a number.
    /// It corresponds to the OpenType value `cvXY`, like `cv02`.
    public static func characterVariant(_ fontNameNumber: Int) -> Self { .init("character-variant(\(fontNameNumber))") }
    
    /// This function enables [swash](http://en.wikipedia.org/wiki/Swash_%28typography%29) glyphs.
    /// The parameter is a font-specific name mapped to a number.
    /// It corresponds to the OpenType values `swsh` and `cswh`, like `swsh 2` and `cswh 2`.
    public static func swash(_ fontNameNumber: Int) -> Self { .init("swash(\(fontNameNumber))") }
    
    /// This function enables ornaments, like fleurons and other dingbat glyphs.
    /// The parameter is a font-specific name mapped to a number.
    /// It corresponds to the OpenType value `ornm`, like `ornm 2`.
    public static func ornaments(_ fontNameNumber: Int) -> Self { .init("ornaments(\(fontNameNumber))") }
    
    /// This function enables annotations, like circled digits or inverted characters.
    /// The parameter is a font-specific name mapped to a number.
    /// It corresponds to the OpenType value `nalt`, like `nalt 2`.
    public static func annotation(_ fontNameNumber: Int) -> Self { .init("annotation(\(fontNameNumber))") }
}

public struct FontVariantAlternatesType: FontVariantAlternatable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// This keyword deactivates alternate glyphs.
    public static var normal: Self { .init("normal") }
    
    public var description: String { value }
}

public protocol FontVariantCapsable: Valuable {
    static var smallCaps: Self { get }
    static var allSmallCaps: Self { get }
    static var petiteCaps: Self { get }
    static var allPetiteCaps: Self { get }
    static var unicase: Self { get }
    static var titlingCaps: Self { get }
}

extension FontVariantCapsable {
    /// Enables display of small capitals (OpenType feature: `smcp`).
    /// Small-caps glyphs typically use the form of uppercase letters
    /// but are reduced to the size of lowercase letters.
    public static var smallCaps: Self { .init("small-caps") }
    
    /// Enables display of small capitals for both upper
    /// and lowercase letters (OpenType features: `c2sc`, `smcp`).
    public static var allSmallCaps: Self { .init("all-small-caps") }
    
    /// Enables display of petite capitals (OpenType feature: `pcap`).
    public static var petiteCaps: Self { .init("petite-caps") }
    
    /// Enables display of petite capitals for both upper
    /// and lowercase letters (OpenType features: `c2pc`, `pcap`).
    public static var allPetiteCaps: Self { .init("all-petite-caps") }
    
    /// Enables display of mixture of small capitals for uppercase letters
    /// with normal lowercase letters (OpenType feature: `unic`).
    public static var unicase: Self { .init("unicase") }
    
    /// Enables display of titling capitals (OpenType feature: `titl`).
    /// Uppercase letter glyphs are often designed for use with lowercase letters.
    /// When used in all uppercase titling sequences they can appear too strong.
    /// Titling capitals are designed specifically for this situation.
    public static var titlingCaps: Self { .init("titling-caps") }
}

public struct FontVariantCapsType: FontVariantCapsable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    /// Deactivates of the use of alternate glyphs.
    public static var normal: Self { .init("normal") }
    
    public var description: String { value }
}

public protocol FontVariantEastAsianable: Valuable {
    static var ruby: Self { get }
    static var jis78: Self { get }
    static var jis83: Self { get }
    static var jis90: Self { get }
    static var jis04: Self { get }
    static var simplified: Self { get }
    static var traditional: Self { get }
}

extension FontVariantEastAsianable {
    /// This keyword forces the use of special glyphs for ruby characters.
    /// As these are usually smaller, font creators often designs specific forms,
    /// usually slightly bolder to improve the contrast.
    /// This keyword corresponds to the OpenType values `ruby`.
    public static var ruby: Self { .init("ruby") }
    
    /// This value specify a set of logographic glyph variants which should be used for display.
    /// OpenType equivalent `jp78`
    public static var jis78: Self { .init("jis78") }
    
    /// This value specify a set of logographic glyph variants which should be used for display.
    /// OpenType equivalent `jp83`
    public static var jis83: Self { .init("jis83") }
    
    /// This value specify a set of logographic glyph variants which should be used for display.
    /// OpenType equivalent `jp90`
    public static var jis90: Self { .init("jis90") }
    
    /// This value specify a set of logographic glyph variants which should be used for display.
    /// OpenType equivalent `jp04`
    public static var jis04: Self { .init("jis04") }
    
    /// This value specify a set of logographic glyph variants which should be used for display.
    /// OpenType equivalent `smpl`
    public static var simplified: Self { .init("simplified") }
    
    /// This value specify a set of logographic glyph variants which should be used for display.
    /// OpenType equivalent `trad`
    public static var traditional: Self { .init("traditional") }
}

public struct FontVariantEastAsianType: FontVariantEastAsianable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// This keyword leads to the deactivation of the use of such alternate glyphs.
    public static var normal: Self { .init("normal") }
    
    public var description: String { value }
}

public protocol FontVariantLigaturable: Valuable {
    static var commonLigatures: Self { get }
    static var noCommonLigatures: Self { get }
    static var discretionaryLigatures: Self { get }
    static var noDiscretionaryLigatures: Self { get }
    static var historicalLigatures: Self { get }
    static var noHistoricalLigatures: Self { get }
    static var contextual: Self { get }
    static var noContextual: Self { get }
}

extension FontVariantLigaturable {
    /// This value activating control on the most common ligatures, like for fi, ffi, th or similar.
    /// They correspond to the OpenType values `liga` and `clig`.
    public static var commonLigatures: Self { .init("common-ligatures") }
    
    /// This value deactivating control on the most common ligatures, like for fi, ffi, th or similar.
    /// They correspond to the OpenType values `liga` and `clig`.
    public static var noCommonLigatures: Self { .init("no-common-ligatures") }
    
    /// This value activating control on specific ligatures, specific to the font and defined by the type designer.
    /// They correspond to the OpenType values `dlig`.
    public static var discretionaryLigatures: Self { .init("discretionary-ligatures") }
    
    /// This value deactivating control on specific ligatures, specific to the font and defined by the type designer.
    /// They correspond to the OpenType values `dlig`.
    public static var noDiscretionaryLigatures: Self { .init("no-discretionary-ligatures") }
    
    /// This value activating control on the ligatures used historically,
    /// in old books, like the German tz digraph being displayed ß.
    /// They correspond to the OpenType values `hlig`.
    public static var historicalLigatures: Self { .init("historical-ligatures") }
    
    /// This value deactivating control on the ligatures used historically,
    /// in old books, like the German tz digraph being displayed ß.
    /// They correspond to the OpenType values `hlig`.
    public static var noHistoricalLigatures: Self { .init("no-historical-ligatures") }
    
    /// This value activating control on whether letters adapt to their context—that is,
    /// whether they adapt to the surrounding letters.
    /// These values correspond to the OpenType values `calt`.
    public static var contextual: Self { .init("contextual") }
    
    /// This value deactivating control on whether letters adapt to their context—that is,
    /// whether they adapt to the surrounding letters.
    /// These values correspond to the OpenType values `calt`.
    public static var noContextual: Self { .init("no-contextual") }
}

public struct FontVariantLigaturesType: Noneable, FontVariantLigaturable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// This keyword leads to the activation of the usual ligatures
    /// and contextual forms needed for correct rendering.
    /// The ligatures and forms activated depend on the font,
    /// language and kind of script. This is the default value.
    public static var normal: Self { .init("normal") }
    
    public var description: String { value }
}

public protocol FontVariantNumericable: Valuable {
    static var ordinal: Self { get }
    static var slashedZero: Self { get }
    static var liningNums: Self { get }
    static var oldstyleNums: Self { get }
    static var proportionalNums: Self { get }
    static var tabularNums: Self { get }
    static var diagonalFractions: Self { get }
    static var stackedFractions: Self { get }
}

extension FontVariantNumericable {
    /// This keyword forces the use of special glyphs for the ordinal markers,
    /// like 1st, 2nd, 3rd, 4th in English or a 1a in Italian.
    /// It corresponds to the OpenType values `ordn`.
    public static var ordinal: Self { .init("ordinal") }
    
    /// This keyword forces the use of a 0 with a slash; this is useful
    /// when a clear distinction between O and 0 is needed.
    /// It corresponds to the OpenType values `zero`.
    public static var slashedZero: Self { .init("slashed-zero") }
    
    /// It is activating the set of figures where numbers are all lying on the baseline.
    /// It corresponds to the OpenType values `lnum`.
    public static var liningNums: Self { .init("lining-nums") }
    
    /// It is activating the set of figures where some numbers,
    /// like 3, 4, 7, 9 have descenders.
    /// It corresponds to the OpenType values `onum`.
    public static var oldstyleNums: Self { .init("oldstyle-nums") }
    
    /// It is activating the set of figures where numbers are not all of the same size.
    /// It corresponds to the OpenType values `pnum`.
    public static var proportionalNums: Self { .init("proportional-nums") }
    
    /// It is activating the set of figures where numbers are all of the same size,
    /// allowing them to be easily aligned like in tables.
    /// It corresponds to the OpenType values `tnum`.
    public static var tabularNums: Self { .init("tabular-nums") }
    
    /// It is activating the set of figures where the numerator
    /// and denominator are made smaller and separated by a slash.
    /// It corresponds to the OpenType values `frac`.
    public static var diagonalFractions: Self { .init("diagonal-fractions") }
    
    /// It is activating the set of figures where the numerator
    /// and denominator are made smaller, stacked and separated by a horizontal line.
    /// It corresponds to the OpenType values `afrc`.
    public static var stackedFractions: Self { .init("stacked-fractions") }
}

public struct FontVariantNumericType: Valuable, FontVariantNumericable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// This keyword leads to the deactivation of the use of such alternate glyphs.
    public static var normal: Self { .init("normal") }
    
    public var description: String { value }
}

public struct FontVariantPositionType: Valuable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Deactivates alternate superscript and subscript glyphs.
    public static var normal: Self { .init("normal") }
    
    /// Activates subscript alternate glyphs.
    /// If, in a given run, one such glyph is not available for a character,
    /// all the characters in the run are rendered using synthesized glyphs.
    public static var sub: Self { .init("sub") }
    
    /// Activates superscript alternate glyphs. If, in a given run,
    /// one such glyph is not available for a character, all the characters
    /// in the run are rendered using synthesized glyphs.
    public static var `super`: Self { .init("super") }
    
    public var description: String { value }
}

public struct FontVariantType: Noneable, FontVariantNumericable, FontVariantEastAsianable, FontVariantCapsable, FontVariantAlternatable, FontVariantLigaturable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Specifies a normal font face; each of the longhand properties has an initial value of normal.
    public static var normal: Self { .init("normal") }
    
    public var description: String { value }
}

public struct FontWeightType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Defines normal characters. This is default
    public static var normal: Self { .init("normal") }
        
    /// Defines thick characters
    public static var bold: Self { .init("bold") }
        
    /// Defines thicker characters
    public static var bolder: Self { .init("bolder") }
    
    /// Defines lighter characters
    public static var lighter: Self { .init("lighter") }
    
    public var description: String { value }
}

public struct GridAutoColumnsType: Autoable, Lengthable, Percentable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    public static var fitContent: Self { .init("fit-content()") }
    
    /// Sets the size of each column depending on the largest item in the column
    public static var maxContent: Self { .init("max-content") }
    
    /// Sets the size of each column depending on the smallest item in the column
    public static var minContent: Self { .init("min-content") }
    
    /// Sets a size range greater than or equal to min and less than or equal to max
    public static func minmax<MIN: UnitValuable, MAX: UnitValuable>(min: MIN, max: MAX) -> Self { .init("minmax(\(min.description), \(max.description))") }
    
    /// Sets a size range greater than or equal to min and less than or equal to max
    public static func minmax<MAX: UnitValuable>(min: AutoValue, max: MAX) -> Self { .init("minmax(\(min.rawValue), \(max.description))") }
    
    /// Sets a size range greater than or equal to min and less than or equal to max
    public static func minmax<MIN: UnitValuable>(min: MIN, max: AutoValue) -> Self { .init("minmax(\(min.description), \(max.rawValue))") }
    
    public var description: String { value }
}

public struct GridAutoFlowType: Valuable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Default value. Places items by filling each row
    public static var row: Self { .init("row") }
    
    /// Places items by filling each column
    public static var column: Self { .init("column") }
    
    /// Place items to fill any holes in the grid
    public static var dense: Self { .init("dense") }
    
    /// Places items by filling each row, and fill any holes in the grid
    public static var rowDense: Self { .init("row dense") }
    
    /// Places items by filling each column, and fill any holes in the grid
    public static var columnDense: Self { .init("column dense") }
    
    public var description: String { value }
}

public struct GridAutoRowsType: Autoable, Lengthable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Sets the size of each row to depend on the largest item in the row
    public static var maxContent: Self { .init("max-content") }
    
    /// Sets the size of each row to depend on the largest item in the row
    public static var minContent: Self { .init("min-content") }
    
    public var description: String { value }
}

public struct GridTemplateColumnsType: Noneable, Autoable, Initialable, Inheritable, Lengthable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Sets the size of each column to depend on the largest item in the column
    public static var maxContent: Self { .init("max-content") }
    
    /// Sets the size of each column to depend on the smallest item in the column
    public static var minContent: Self { .init("min-content") }
    
    public var description: String { value }
}

public struct GridTemplateRowsType: Noneable, Autoable, Lengthable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Sets the size of each row to depend on the largest item in the row
    public static var maxContent: Self { .init("max-content") }
    
    /// Sets the size of each row to depend on the largest item in the row
    public static var minContent: Self { .init("min-content") }
    
    public var description: String { value }
}

public struct HangingPunctuationType: Noneable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Punctuation may hang outside the start edge of the first line
    public static var first: Self { .init("first") }
    
    /// Punctuation may hang outside the end edge of the last line
    public static var last: Self { .init("last") }
    
    /// Punctuation may hang outside the end edge of all lines if the punctuation does not otherwise fit prior to justification
    public static var allowEnd: Self { .init("allow-end") }
    
    /// Punctuation may hang outside the end edge of all lines. If justification is enabled on this line, then it will force the punctuation to hang
    public static var forceEnd: Self { .init("force-end") }
    
    public var description: String { value }
}

public struct HyphensType: Noneable, Autoable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Default. Words are only hyphenated at &hyphen; or &shy; (if needed)
    public static var manual: Self { .init("manual") }
    
    public var description: String { value }
}

public struct ImageRenderingType: Autoable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// The image must be scaled with an algorithm that preserves contrast
    /// and edges in the image, and which does not smooth colors or introduce
    /// blur to the image in the process. Suitable algorithms include nearest-neighbor
    /// and other non-smoothing scaling algorithms such as 2×SaI and hqx-family algorithms.
    /// This value is intended for pixel-art images, such as in browser games.
    public static var crispEdges: Self { .init("crisp-edges") }
    
    /// When scaling the image up, the nearest-neighbor algorithm must be used,
    /// so that the image appears to be composed of large pixels.
    /// When scaling down, this is the same as auto.
    public static var pixelated: Self { .init("pixelated") }
    
    public var description: String { value }
}

public struct IsolationType: Autoable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// A new stacking context must be created
    public static var isolate: Self { .init("isolate") }
    
    public var description: String { value }
}

public struct JustifyContentType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Default value. Items are positioned at the beginning of the container
    public static var flexStart: Self { .init("flex-start") }
    
    /// Items are positioned at the end of the container
    public static var flexEnd: Self { .init("flex-end") }
    
    /// Items are positioned at the center of the container
    public static var center: Self { .init("center") }
    
    /// Items are positioned with space between the lines
    public static var spaceBetween: Self { .init("space-between") }
    
    /// Items are positioned with space before, between, and after the lines
    public static var spaceAround: Self { .init("space-around") }
    
    public var description: String { value }
}

public struct LetterSpacingType: Initialable, Inheritable, Lengthable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// No extra space between characters. This is default
    public static var normal: Self { .init("normal") }
    
    public var description: String { value }
}

public struct LineBreakType: Autoable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Break text using the least restrictive line break rule.
    /// Typically used for short lines, such as in newspapers.
    public static var loose: Self { .init("loose") }
    
    /// Break text using the most common line break rule.
    public static var normal: Self { .init("normal") }
    
    /// Break text using the most stringent line break rule.
    public static var strict: Self { .init("strict") }
    
    /// There is a soft wrap opportunity around every typographic character unit,
    /// including around any punctuation character or preserved white spaces,
    /// or in the middle of words, disregarding any prohibition against line breaks,
    /// even those introduced by characters with the GL, WJ, or ZWJ character class
    /// or mandated by the word-break property.
    /// The different wrapping opportunities must not be prioritized.
    /// Hyphenation is not applied.
    public static var anywhere: Self { .init("anywhere") }
    
    public var description: String { value }
}

public struct LineHeightType: Initialable, Inheritable, Numberable, Lengthable, Percentable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// A normal line height. This is default
    public static var normal: Self { .init("normal") }
    
    public var description: String { value }
}

public struct ListStylePositionType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// The bullet points will be inside the list item
    public static var inside: Self { .init("inside") }
    
    /// The bullet points will be outside the list item. This is default
    public static var outside: Self { .init("outside") }
    
    public var description: String { value }
}

public struct ListStyleTypeType: Noneable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Default value. The marker is a filled circle
    public static var disc: Self { .init("disc") }
    
    /// The marker is traditional Armenian numbering
    public static var armenian: Self { .init("armenian") }
    
    /// The marker is a circle
    public static var circle: Self { .init("circle") }
    
    /// The marker is plain ideographic numbers
    public static var cjkIdeographic: Self { .init("cjk-ideographic") }
    
    /// The marker is a number
    public static var decimal: Self { .init("decimal") }
    
    /// The marker is a number with leading zeros (01, 02, 03, etc.)
    public static var decimalLeadingZero: Self { .init("decimal-leading-zero") }
    
    /// The marker is traditional Georgian numbering
    public static var georgian: Self { .init("georgian") }
    
    /// The marker is traditional Hebrew numbering
    public static var hebrew: Self { .init("hebrew") }
    
    /// The marker is traditional Hiragana numbering
    public static var hiragana: Self { .init("hiragana") }
    
    /// The marker is traditional Hiragana iroha numbering
    public static var hiraganaIroha: Self { .init("hiragana-iroha") }
    
    /// The marker is traditional Katakana numbering
    public static var katakana: Self { .init("katakana") }
    
    /// The marker is traditional Katakana iroha numbering
    public static var katakanaIroha: Self { .init("katakana-iroha") }
    
    /// The marker is lower-alpha (a, b, c, d, e, etc.)
    public static var lowerAlpha: Self { .init("lower-alpha") }
    
    /// The marker is lower-greek
    public static var lowerGreek: Self { .init("lower-greek") }
    
    /// The marker is lower-latin (a, b, c, d, e, etc.)
    public static var lowerLatin: Self { .init("lower-latin") }
    
    /// The marker is lower-roman (i, ii, iii, iv, v, etc.)
    public static var lowerRoman: Self { .init("lower-roman") }
    
    /// The marker is a square
    public static var square: Self { .init("square") }
    
    /// The marker is upper-alpha (A, B, C, D, E, etc.)
    public static var upperAlpha: Self { .init("upper-alpha") }
    
    /// The marker is upper-greek
    public static var upperGreek: Self { .init("upper-greek") }
    
    /// The marker is upper-latin (A, B, C, D, E, etc.)
    public static var upperLatin: Self { .init("upper-latin") }
    
    /// The marker is upper-roman (I, II, III, IV, V, etc.)
    public static var upperRoman: Self { .init("upper-roman") }
    
    public var description: String { value }
}

public struct MixBlendModeType: Valuable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
        
    /// This is default. Sets the blending mode to normal
    public static var normal: Self { .init("normal") }
    
    /// Sets the blending mode to multiply
    public static var multiply: Self { .init("multiply") }
    
    /// Sets the blending mode to screen
    public static var screen: Self { .init("screen") }
    
    /// Sets the blending mode to overlay
    public static var overlay: Self { .init("overlay") }
    
    /// Sets the blending mode to darken
    public static var darken: Self { .init("darken") }
    
    /// Sets the blending mode to lighten
    public static var lighten: Self { .init("lighten") }
    
    /// Sets the blending mode to color-dodge
    public static var colorDodge: Self { .init("color-dodge") }
    
    /// Sets the blending mode to color-burn
    public static var colorBurn: Self { .init("color-burn") }
    
    /// Sets the blending mode to difference
    public static var difference: Self { .init("difference") }
    
    /// Sets the blending mode to exclusion
    public static var exclusion: Self { .init("exclusion") }
    
    /// Sets the blending mode to hue
    public static var hue: Self { .init("hue") }
    
    /// Sets the blending mode to saturation
    public static var saturation: Self { .init("saturation") }
    
    /// Sets the blending mode to color
    public static var color: Self { .init("color") }
    
    /// Sets the blending mode to luminosity
    public static var luminosity: Self { .init("luminosity") }
    
    public var description: String { value }
}

public struct ObjectFitType: Noneable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// This is default. The replaced content is sized to fill the element's content box.
    /// If necessary, the object will be stretched or squished to fit
    public static var fill: Self { .init("fill") }
    
    /// The replaced content is scaled to maintain its aspect ratio
    /// while fitting within the element's content box
    public static var contain: Self { .init("contain") }
    
    /// The replaced content is sized to maintain its aspect ratio
    /// while filling the element's entire content box. The object will be clipped to fit
    public static var cover: Self { .init("cover") }
    
    /// The content is sized as if none or contain
    /// were specified (would result in a smaller concrete object size)
    public static var scaleDown: Self { .init("scale-down") }
    
    public var description: String { value }
}

public struct ObjectPositionXType: Valuable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    public static var left: Self { .init("left") }
    public static var center: Self { .init("center") }
    public static var right: Self { .init("right") }
    
    public var description: String { value }
}

public struct ObjectPositionYType: Valuable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    public static var top: Self { .init("top") }
    public static var center: Self { .init("center") }
    public static var bottom: Self { .init("bottom") }
    
    public var description: String { value }
}

public struct OutlineStyleType: Noneable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Specifies a hidden outline
    public static var hidden: Self { .init("hidden") }
    
    /// Specifies a dotted outline
    public static var dotted: Self { .init("dotted") }
    
    /// Specifies a dashed outline
    public static var dashed: Self { .init("dashed") }
    
    /// Specifies a solid outline
    public static var solid: Self { .init("solid") }
    
    /// Specifies a double outliner
    public static var double: Self { .init("double") }
    
    /// Specifies a 3D grooved outline. The effect depends on the outline-color value
    public static var groove: Self { .init("groove") }
    
    /// Specifies a 3D ridged outline. The effect depends on the outline-color value
    public static var ridge: Self { .init("ridge") }
    
    /// Specifies a 3D inset outline. The effect depends on the outline-color value
    public static var inset: Self { .init("inset") }
    
    /// Specifies a 3D outset outline. The effect depends on the outline-color value
    public static var outset: Self { .init("outset") }
    
    public var description: String { value }
}

public struct OutlineWidthType: Initialable, Inheritable, Lengthable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Specifies a medium outline. This is default
    public static var medium: Self { .init("medium") }
    
    /// Specifies a thin outline
    public static var thin: Self { .init("thin") }
    
    /// Specifies a thick outline
    public static var thick: Self { .init("thick") }
    
    public var description: String { value }
}

public struct OverflowType: Autoable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// The content is not clipped, and it may be rendered outside the left and right edges. This is default
    public static var visible: Self { .init("visible") }
    
    /// The content is clipped - and no scrolling mechanism is provided
    public static var hidden: Self { .init("hidden") }
    
    /// The content is clipped and a scrolling mechanism is provided
    public static var scroll: Self { .init("scroll") }
    
    public var description: String { value }
}

public struct OverflowWrapType: Valuable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Lines may only break at normal word break points (such as a space between two words).
    public static var normal: Self { .init("normal") }
    
    /// To prevent overflow, an otherwise unbreakable string
    /// of characters — like a long word or URL — may be broken at any point if there are no otherwise-acceptable
    /// break points in the line. No hyphenation character is inserted at the break point.
    /// Soft wrap opportunities introduced by the word break
    /// are considered when calculating min-content intrinsic sizes.
    public static var anywhere: Self { .init("anywhere") }
    
    /// The same as the anywhere value, with normally unbreakable words allowed
    /// to be broken at arbitrary points if there are no otherwise acceptable
    /// break points in the line, but soft wrap opportunities introduced
    /// by the word break are NOT considered when calculating min-content intrinsic sizes.
    public static var breakWord: Self { .init("break-word") }
    
    public var description: String { value }
}

public struct PageBreakAfterType: Autoable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Always insert a page-break after the element
    public static var always: Self { .init("always") }
    
    /// Avoid page-break after the element (if possible)
    public static var avoid: Self { .init("avoid") }
    
    /// Insert page-break after the element so that the next page is formatted as a left page
    public static var left: Self { .init("left") }
    
    /// Insert page-break after the element so that the next page is formatted as a right page
    public static var right: Self { .init("right") }
    
    public var description: String { value }
}

public struct PageBreakBeforeType: Autoable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Always insert a page-break before the element
    public static var always: Self { .init("always") }
    
    /// Avoid page-break before the element (if possible)
    public static var avoid: Self { .init("avoid") }
    
    /// Insert page-break before the element so that the next page is formatted as a left page
    public static var left: Self { .init("left") }
    
    /// Insert page-break before the element so that the next page is formatted as a right page
    public static var right: Self { .init("right") }
    
    public var description: String { value }
}

public struct PageBreakInsideType: Autoable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Avoid page-break inside the element (if possible)
    public static var avoid: Self { .init("avoid") }
    
    public var description: String { value }
}

public struct PointerEventsType: Noneable, Autoable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    public var description: String { value }
}

public struct PositionType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Default value. Elements render in order, as they appear in the document flow
    public static var `static`: Self { .init("static") }
    
    /// The element is positioned relative to its first positioned (not static) ancestor element
    public static var absolute: Self { .init("absolute") }
    
    /// The element is positioned relative to the browser window
    public static var fixed: Self { .init("fixed") }
    
    /// The element is positioned relative to its normal position,
    /// so "left:20px" adds 20 pixels to the element's LEFT position
    public static var relative: Self { .init("relative") }
    
    /// The element is positioned based on the user's scroll position
    /// A sticky element toggles between relative and fixed, depending on the scroll position.
    /// It is positioned relative until a given offset position
    /// is met in the viewport - then it "sticks" in place (like position:fixed).
    ///
    /// Note: Not supported in IE/Edge 15 or earlier.
    /// Supported in Safari from version 6.1 with a -webkit- prefix.
    public static var sticky: Self { .init("sticky") }
    
    public var description: String { value }
}

public struct QuotesType: Noneable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Specifies which quotation marks to use.
    /// The first two values specifies the first level of quotation embedding,
    /// the next two values specifies the next level of quote embedding, etc
    public static func string(_ a: String, _ b: String, c: String, _ d: String) -> Self { .init([a, b, c, d].joined(separator: " ")) }
    
    /// Specifies which quotation marks to use.
    /// The first two values specifies the first level of quotation embedding,
    /// the next two values specifies the next level of quote embedding, etc
    public static func string(_ v: String) -> Self { .init(v) }
    
    public var description: String { value }
}

public struct ResizeType: Noneable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// The user can resize both the height and width of the element
    public static var both: Self { .init("both") }
    
    /// The user can resize the width of the element
    public static var horizontal: Self { .init("horizontal") }
    
    /// The user can resize the height of the element
    public static var vertical: Self { .init("vertical") }
    
    public var description: String { value }
}

public struct ScrollBehaviorType: Autoable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Allows a smooth animated "scroll effect" between elements within the scrolling box.
    public static var smooth: Self { .init("smooth") }
    
    public var description: String { value }
}

public enum StepsType: String, CustomStringConvertible {
    case start, end
    
    public var description: String { rawValue }
}

public struct TableLayoutType: Autoable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Sets a fixed table layout algorithm.
    /// The table and column widths are set by the widths
    /// of table and col or by the width of the first row of cells.
    /// Cells in other rows do not affect column widths.
    /// If no widths are present on the first row, the column widths are divided equally
    /// across the table, regardless of content inside the cells
    public static var fixed: Self { .init("fixed") }
    
    public var description: String { value }
}

public struct TabSizeType: Initialable, Inheritable, Lengthable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// The number of space-characters to be displayed for each tab-character. Default value is 8
    public static func number(_ v: NumericValue) -> Self { .init(v.numericValue) }
    
    public var description: String { value }
}

public struct TextAlignLastType: Autoable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// The last line is aligned to the left
    public static var left: Self { .init("left") }
    
    /// The last line is aligned to the right
    public static var right: Self { .init("right") }
    
    /// The last line is center-aligned
    public static var center: Self { .init("center") }
    
    /// The last line is justified as the rest of the lines
    public static var justify: Self { .init("justify") }
    
    /// The last line is aligned at the beginning of the line
    /// (left if the text-direction is left-to-right, and right is the text-direction is right-to-left)
    public static var start: Self { .init("start") }
    
    /// The last line is aligned at the end of the line
    /// (right if the text-direction is left-to-right, and left is the text-direction is right-to-left)
    public static var end: Self { .init("end") }
    
    public var description: String { value }
}

public struct TextAlignType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
        
    /// Aligns the text to the left
    public static var left: Self { .init("left") }
        
    /// Aligns the text to the right
    public static var right: Self { .init("right") }
    
    /// Centers the text
    public static var center: Self { .init("center") }
            
    /// Stretches the lines so that each line has equal width (like in newspapers and magazines)
    public static var justify: Self { .init("justify") }
    
    public var description: String { value }
}

public struct TextCombineUprightType: Noneable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Attempts to typeset all consecutive characters within the box horizontally, such that they take up the space of a single character within the vertical line of the box.
    public static var all: Self { .init("all") }
    
    /// Attempts to display a sequence of consecutive ASCII digits (U+0030–U+0039)
    /// that has as many or fewer characters than the specified integer,
    /// such that it takes up the space of a single character within the vertical line box.
    /// If the integer is omitted, it computes to 2. Integers outside the range of 2-4 are invalid.
    public static func digits(_ n: Int?) -> Self {
        guard let n = n else { return .init("digits") }
        return .init("digits \(n)")
    }
    
    public var description: String { value }
}

public struct TextDecorationLineType: Noneable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Specifies that a line will be displayed under the text    Play it »
    public static var underline: Self { .init("underline") }
    
    /// Specifies that a line will be displayed over the text
    public static var overline: Self { .init("overline") }
    
    /// Specifies that a line will be displayed through the text
    public static var lineThrough: Self { .init("line-through") }
    
    public var description: String { value }
}

public struct TextDecorationStyleType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Default value. The line will display as a single line
    public static var solid: Self { .init("solid") }
    
    /// The line will display as a double line
    public static var double: Self { .init("double") }
    
    /// The line will display as a dotted line
    public static var dotted: Self { .init("dotted") }
    
    /// The line will display as a dashed line
    public static var dashed: Self { .init("dashed") }
    
    /// The line will display as a wavy line
    public static var wavy: Self { .init("wavy") }
    
    public var description: String { value }
}

public struct TextIndentType: Initialable, Inheritable, Lengthable, Percentable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    public var description: String { value }
}

public struct TextJustifyType: Noneable, Autoable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// The text is justified by adding space between words (effectively varying word-spacing),
    /// which is most appropriate for languages that separate words using spaces, like English or Korean.
    public static var interWord: Self { .init("inter-word") }
    
    /// The text is justified by adding space between characters (effectively varying letter-spacing),
    /// which is most appropriate for languages like Japanese.
    public static var interCharacter: Self { .init("inter-character") }
    
    /// Exhibits the same behaviour as inter-character; this value is kept for backwards compatibility.
    public static var distribute: Self { .init("distribute") }
    
    public var description: String { value }
}

public struct TextOrientationType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Rotates the characters of horizontal scripts 90° clockwise. Lays out the characters of vertical scripts naturally. Default value.
    public static var mixed: Self { .init("mixed") }
    
    /// Lays out the characters of horizontal scripts naturally (upright), as well as the glyphs for vertical scripts. Note that this keyword causes all characters to be considered as left-to-right: the used value of direction is forced to be ltr.
    public static var upright: Self { .init("upright") }
    
    /// Causes characters to be laid out as they would be horizontally, but with the whole line rotated 90° clockwise.
    public static var sideways: Self { .init("sideways") }
    
    /// An alias to sideways that is kept for compatibility purposes.
    public static var sidewaysRight: Self { .init("sideways-right") }
    
    /// On SVG elements, this keyword leads to use the value of the deprecated SVG properties glyph-orientation-vertical and glyph-orientation-horizontal.
    public static var useGlyphOrientation: Self { .init("use-glyph-orientation") }
    
    public var description: String { value }
}

public struct TextOverflowType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Default value. The text is clipped and not accessible
    public static var clip: Self { .init("clip") }
    
    /// Render an ellipsis ("...") to represent the clipped text
    public static var ellipsis: Self { .init("ellipsis") }
    
    /// Render the given string to represent the clipped text
    public static func string(_ v: String) -> Self { .init("\"\(v)\"") }
    
    public var description: String { value }
}

public struct TextShadowType: Noneable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    public static func value<H: UnitValuable, V: UnitValuable, B: UnitValuable>(_ hShadow: H, _ vShadow: V, _ blurRadius: B, _ color: ColorType) -> TextShadowType {
        .init(buildValue(h: hShadow.description, v: vShadow.description, blur: blurRadius.description, color: color.description))
    }
    
    static func buildValue(h: String, v: String, blur: String, color: String) -> String {
        [h, v, blur, color].joined(separator: " ")
    }
    
    public var description: String { value }
}

public struct TextTransformType: Noneable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Transforms the first character of each word to uppercase
    public static var capitalize: Self { .init("capitalize") }
        
    /// Transforms all characters to uppercase
    public static var uppercase: Self { .init("uppercase") }
    
    /// Transforms all characters to lowercase
    public static var lowercase: Self { .init("lowercase") }
    
    public var description: String { value }
}

public struct TextUnderlinePositionType: Autoable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// If the font file includes information about a preferred position, use that value.
    /// If the font file doesn't include this information,
    /// behave as if auto was set, with the browser choosing an appropriate position.
    public static var fromFont: Self { .init("from-font") }
    
    /// Forces the line to be set below the alphabetic baseline,
    /// at a position where it won't cross any descenders.
    /// This is useful for ensuring legibility with chemical
    /// and mathematical formulas, which make a large use of subscripts.
    public static var under: Self { .init("under") }
    
    /// In vertical writing-modes, this keyword forces the line to be placed on the left side of the text.
    /// In horizontal writing-modes, it is a synonym of under.
    public static var left: Self { .init("left") }
    
    /// In vertical writing-modes, this keyword forces the line to be placed on the right side of the text.
    /// In horizontal writing-modes, it is a synonym of under.
    public static var right: Self { .init("right") }
    
    /// A synonym of auto, which should be used instead.
    public static var autoPos: Self { .init("auto-pos") }
    
    /// Forces the line to be above the text.
    /// When used with East-Asian text, using the auto keyword will lead to a similar effect.
    public static var above: Self { .init("above") }
    
    /// Forces the line to be below the text.
    /// When used with alphabetic text, using the auto keyword will lead to a similar effect.
    public static var below: Self { .init("below") }
    
    public var description: String { value }
}

public final class TimeType: Initialable, Inheritable, CustomStringConvertible, _PropertyValueInnerChangeable {
    @State public var value = ""
    
    var _changeHandler = {}
    
    public init (_ value: String) { self.value = value }
    
    init<U: TimeUnitValue>(_ value: U) {
        self.value = TimeUnitValueContainer(value.value.doubleValue, value.timeUnit).description
    }
    
    convenience init <A>(_ value: A) where A: StateConvertible, A.Value: TimeUnitValue {
        let value = value.stateValue
        self.init(value.wrappedValue)
        value.listen { self._changeHandler() }
    }
    
    /// Specifies how many seconds or milliseconds a transition effect takes to complete.
    /// Default value is 0s, meaning there will be no effect
    public static func time<V: TimeUnitValue>(_ v: V) -> Self { .init(v.description) }
    
    /// Specifies how many seconds or milliseconds a transition effect takes to complete.
    /// Default value is 0s, meaning there will be no effect
    public static func time<A>(_ v: A) -> Self where A: StateConvertible, A.Value: TimeUnitValue {
        self.init(v)
    }
    
    /// Specifies how many seconds or milliseconds a transition effect takes to complete.
    /// Default value is 0s, meaning there will be no effect
    public static func seconds(_ v: Double) -> Self { .init(TimeUnitValueContainer(v, .s)) }
    
    /// Specifies how many seconds or milliseconds a transition effect takes to complete.
    /// Default value is 0s, meaning there will be no effect
    public static func seconds<A>(_ v: A) -> Self where A: StateConvertible, A.Value == Double {
        self.init(TimeUnitValueContainer(v.stateValue, .s))
    }
    
    /// Specifies how many seconds or milliseconds a transition effect takes to complete.
    /// Default value is 0s, meaning there will be no effect
    public static func milliseconds(_ v: Double) -> Self { .init(TimeUnitValueContainer(v, .ms)) }
    
    /// Specifies how many seconds or milliseconds a transition effect takes to complete.
    /// Default value is 0s, meaning there will be no effect
    public static func milliseconds<A>(_ v: A) -> Self where A: StateConvertible, A.Value == Double {
        self.init(TimeUnitValueContainer(v.stateValue, .ms))
    }
    
    public var description: String { value }
}

public struct TransformFunction: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Defines that there should be no transformation
    public static var none: TransformFunction{ .init("") }
    
    /// Defines a 2D transformation, using a matrix of six values
    public static func matrix(_ a: Double, _ b: Double, _ c: Double, _ d: Double, _ e: Double, _ f: Double) -> TransformFunction {
        .init("matrix(" + [a, b, c, d, e, f].map { "\($0)" }.joined(separator: ", ") + ")")
    }
    
    /// Defines a 3D transformation, using a 4x4 matrix of 16 values
    public static func matrix3d(a: Double, b: Double, c: Double, d: Double, e: Double, f: Double, g: Double, h: Double, i: Double, j: Double, k: Double, l: Double, m: Double, n: Double, o: Double, p: Double) -> TransformFunction {
        .init("matrix3d(" + [a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p].map { "\($0)" }.joined(separator: ", ") + ")")
    }
    
    /// Defines a 2D translation
    public static func translate<X: UnitValuable, Y: UnitValuable>(_ x: X, _ y: Y) -> TransformFunction {
        .init("translate(" + [x.description, y.description].joined(separator: ", ") + ")")
    }
    
    /// Defines a 3D translation
    public static func translate3d<X: UnitValuable, Y: UnitValuable, Z: UnitValuable>(_ x: X, _ y: Y, _ z: Z) -> TransformFunction {
        .init("translate3d(" + [x.description, y.description, z.description].joined(separator: ", ") + ")")
    }
    
    /// Defines a translation, using only the value for the X-axis
    public static func translateX<X: UnitValuable>(_ x: X) -> TransformFunction {
        .init("translateX(" + x.description + ")")
    }
    
    /// Defines a translation, using only the value for the Y-axis
    public static func translateY<Y: UnitValuable>(_ y: Y) -> TransformFunction {
        .init("translateY(" + y.description + ")")
    }
    
    /// Defines a 3D translation, using only the value for the Z-axis
    public static func translateZ<Z: UnitValuable>(_ z: Z) -> TransformFunction {
        .init("translateZ(" + z.description + ")")
    }
    
    /// Defines a 2D scale transformation
    public static func scale(_ x: NumericValue, _ y: NumericValue) -> TransformFunction {
        .init("scale(" + [x.numericValue, y.numericValue].joined(separator: ", ") + ")")
    }
    
    /// Defines a 3D scale transformation
    public static func scale3d(_ x: NumericValue, _ y: NumericValue, _ z: NumericValue) -> TransformFunction {
        .init("scale3d(" + [x.numericValue, y.numericValue, z.numericValue].joined(separator: ", ") + ")")
    }
    
    /// Defines a scale transformation by giving a value for the X-axis
    public static func scaleX(_ x: NumericValue) -> TransformFunction {
        .init("scaleX(" + x.numericValue + ")")
    }
    
    /// Defines a scale transformation by giving a value for the Y-axis
    public static func scaleY(_ y: NumericValue) -> TransformFunction {
        .init("scaleY(" + y.numericValue + ")")
    }
    
    /// Defines a 3D scale transformation by giving a value for the Z-axis
    public static func scaleZ(_ z: NumericValue) -> TransformFunction {
        .init("scaleZ(" + z.numericValue + ")")
    }
    
    /// Defines a 2D rotation, the angle is specified in the parameter
    public static func rotate(_ angle: AngleValue) -> TransformFunction {
        .init("rotate(" + angle.angleValue + ")")
    }
    
    /// Defines a 3D rotation
    public static func rotate3d(_ x: NumericValue, _ y: NumericValue, _ z: NumericValue, _ angle: AngleValue) -> TransformFunction {
        .init("rotate3d(" + [x.numericValue, y.numericValue, z.numericValue, angle.angleValue].joined(separator: ", ") + ")")
    }
    
    /// Defines a 3D rotation along the X-axis
    public static func rotateX(_ angle: AngleValue) -> TransformFunction {
        .init("rotateX(" + angle.angleValue + ")")
    }
    
    /// Defines a 3D rotation along the Y-axis
    public static func rotateY(_ angle: AngleValue) -> TransformFunction {
        .init("rotateY(" + angle.angleValue + ")")
    }
    
    /// Defines a 3D rotation along the Z-axis
    public static func rotateZ(_ angle: AngleValue) -> TransformFunction {
        .init("rotateZ(" + angle.angleValue + ")")
    }
    
    /// Defines a 2D skew transformation along the X- and the Y-axis
    public static func skew(_ xAngle: AngleValue, yAngle: AngleValue) -> TransformFunction {
        .init("skew(" + [xAngle.angleValue, yAngle.angleValue].joined(separator: ", ") + ")")
    }
    
    /// Defines a 2D skew transformation along the X-axis
    public static func skewX(_ angle: AngleValue) -> TransformFunction {
        .init("skewX(" + angle.angleValue + ")")
    }
    
    /// Defines a 2D skew transformation along the Y-axis
    public static func skewY(_ angle: AngleValue) -> TransformFunction {
        .init("skewY(" + angle.angleValue + ")")
    }
    
    /// Defines a perspective view for a 3D transformed element
    public static func perspective<V: UnitValuable>(_ n: V) -> TransformFunction {
        .init("perspective(" + n.description + ")")
    }
    
    public var description: String { value }
}

public struct TransformOriginType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    public static func value(x: XAxis, y: YAxis, z: ZAxis? = nil) -> Self {
        var values: [String] = [x.value, y.value]
        if let z = z {
            values.append(z.value)
        }
        return .init(values.joined(separator: " "))
    }
    
    public var description: String { value }
}

public struct TransformStyleType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Specifies that child elements will NOT preserve its 3D position. This is default
    public static var flat: Self { .init("flat") }
    
    /// Specifies that child elements will preserve its 3D position
    public static var preserve3d: Self { .init("preserve-3d") }
    
    public var description: String { value }
}

public struct TransitionPropertyType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// No property will get a transition effect
    public static var none: Self { .init("") }
    
    /// Default value. All properties will get a transition effect
    public static var all: Self { .init("all") }
    
    /// Defines a comma separated list of CSS property names the transition effect is for
    public static func property(_ properties: PropertyType...) -> Self {
        property(properties)
    }
    
    /// Defines a comma separated list of CSS property names the transition effect is for
    public static func property(_ properties: [PropertyType]) -> Self {
        .init(properties.map { $0.rawValue }.joined(separator: ", "))
    }
    
    public var description: String { value }
}

public struct TransitionTimingFunctionType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Default value. Specifies a transition effect with a slow start, then fast, then end slowly (equivalent to cubic-bezier(0.25,0.1,0.25,1))
    public static var ease: Self { .init("ease") }
    
    /// Specifies a transition effect with the same speed from start to end (equivalent to cubic-bezier(0,0,1,1))
    public static var linear: Self { .init("linear") }
    
    /// Specifies a transition effect with a slow start (equivalent to cubic-bezier(0.42,0,1,1))
    public static var easeIn: Self { .init("ease-in") }
    
    /// Specifies a transition effect with a slow end (equivalent to cubic-bezier(0,0,0.58,1))
    public static var easeOut: Self { .init("ease-out") }
    
    /// Specifies a transition effect with a slow start and end (equivalent to cubic-bezier(0.42,0,0.58,1))
    public static var easeInOut: Self { .init("ease-in-out") }
    
    /// Equivalent to steps(1, start)
    public static var stepStart: Self { .init("step-start") }
    
    /// Equivalent to steps(1, end)
    public static var stepEnd: Self { .init("step-end") }
    
    /// Specifies a stepping function, with two parameters.
    /// The first parameter specifies the number of intervals in the function.
    /// It must be a positive integer (greater than 0).
    /// The second parameter, which is optional, is either the value "start" or "end",
    /// and specifies the point at which the change of values occur within the interval.
    /// If the second parameter is omitted, it is given the value "end"
    public static func steps(_ v: Int, _ type: StepsType) -> Self { .init("steps(\(v), \(type.rawValue))") }
    
    /// Define your own values in the cubic-bezier function. Possible values are numeric values from 0 to 1
    public static func cubicBezier(_ a: Double, _ b: Double, _ c: Double, _ d: Double) -> Self { .init("cubic-bezier(\(a), \(b), \(c), \(d))") }
    
    public var description: String { value }
}

public struct UnicodeBidiType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// The element does not open an additional level of embedding. This is default
    public static var normal: Self { .init("normal") }
    
    /// For inline elements, this value opens an additional level of embedding
    public static var embed: Self { .init("embed") }
    
    /// For inline elements, this creates an override. For block elements, this creates an override for inline-level descendants not within another block element
    public static var bidiOverride: Self { .init("bidi-override") }
    
    /// The element is isolated from its siblings
    public static var isolate: Self { .init("isolate") }
    
    public static var isolateOverride: Self { .init("isolate-override") }
    
    public static var plaintext: Self { .init("plaintext") }
    
    public var description: String { value }
}

public struct UnitValueType: Autoable, Initialable, Inheritable, Lengthable, Percentable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    public var description: String { value }
}

public enum UserSelectType: String, CustomStringConvertible {
    /// Default. Text can be selected if the browser allows it
    case auto
    
    /// Prevent text selection
    case none
    
    /// The text can be selected by the user
    case text
    
    /// Text selection is made with one click instead of a double-click
    case all
    
    public var description: String { rawValue }
}

public struct VerticalAlignType: Initialable, Inheritable, Lengthable, Percentable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// The element is aligned with the baseline of the parent. This is default
    public static var baseline: Self { .init("baseline") }
    
    /// The element is aligned with the subscript baseline of the parent
    public static var sub: Self { .init("sub") }
    
    /// The element is aligned with the superscript baseline of the parent
    public static var `super`: Self { .init("super") }
    
    /// The element is aligned with the top of the tallest element on the line
    public static var top: Self { .init("top") }
    
    /// The element is aligned with the top of the parent element's font
    public static var textTop: Self { .init("text-top") }
    
    /// The element is placed in the middle of the parent element
    public static var middle: Self { .init("middle") }
    
    /// The element is aligned with the lowest element on the line
    public static var bottom: Self { .init("bottom") }
    
    /// The element is aligned with the bottom of the parent element's font
    public static var textBottom: Self { .init("text-bottom") }
    
    public var description: String { value }
}

public struct VisibilityType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Default value. The element is visible
    public static var visible: Self { .init("visible") }
    
    /// The element is hidden (but still takes up space)
    public static var hidden: Self { .init("hidden") }
    
    /// Only for table rows (`<tr>`), row groups (`<tbody>`), columns (`<col>`), column groups (`<colgroup>`).
    /// This value removes a row or column, but it does not affect the table layout.
    /// The space taken up by the row or column will be available for other content.
    /// If collapse is used on other elements, it renders as "hidden"
    public static var collapse: Self { .init("collapse") }
    
    public var description: String { value }
}

public struct WhiteSpaceType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Sequences of whitespace will collapse into a single whitespace. Text will wrap when necessary. This is default
    public static var normal: Self { .init("normal") }
    
    /// Sequences of whitespace will collapse into a single whitespace. Text will never wrap to the next line. The text continues on the same line until a `<br>` tag is encountered
    public static var nowrap: Self { .init("nowrap") }
    
    /// Whitespace is preserved by the browser. Text will only wrap on line breaks. Acts like the `<pre>` tag in HTML
    public static var pre: Self { .init("pre") }
    
    /// Sequences of whitespace will collapse into a single whitespace. Text will wrap when necessary, and on line breaks
    public static var preLine: Self { .init("pre-line") }
    
    /// Whitespace is preserved by the browser. Text will wrap when necessary, and on line breaks
    public static var preWrap: Self { .init("pre-wrap") }
    
    public var description: String { value }
}

public struct WordBreakType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Default value. Uses default line break rules
    public static var normal: Self { .init("normal") }
    
    /// To prevent overflow, word may be broken at any character
    public static var breakAll: Self { .init("break-all") }
    
    /// Word breaks should not be used for Chinese/Japanese/Korean (CJK) text.
    /// Non-CJK text behavior is the same as value "normal"
    public static var keepAll: Self { .init("keep-all") }
    
    /// To prevent overflow, word may be broken at arbitrary points
    public static var breakWord: Self { .init("break-word") }
    
    public var description: String { value }
}

public struct WordSpacingType: Initialable, Inheritable, Lengthable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Defines normal space between words (0.25em) . This is default
    public static var normal: Self { .init("normal") }
    
    public var description: String { value }
}

public enum WordWrapType: String, CustomStringConvertible {
    /// Break words only at allowed break points
    case normal
    
    /// Allows unbreakable words to be broken
    case breakWord = "break-word"
    
    /// Sets this property to its default value.
    ///
    /// [Read about inherit](https://www.w3schools.com/cssref/css_initial.asp)
    case initial
    
    /// Inherits this property from its parent element.
    ///
    /// [Read about inherit](https://www.w3schools.com/cssref/css_inherit.asp)
    case inherit
    
    public var description: String { rawValue }
}

public enum WritingModeType: String, CustomStringConvertible {
    /// Let the content flow horizontally from left to right, vertically from top to bottom
    case horizontalTb = "horizontal-tb"
    
    /// Let the content flow vertically from top to bottom, horizontally from right to left
    case verticalRl = "vertical-rl"
    
    /// Let the content flow vertically from top to bottom, horizontally from left to right
    case verticalLr = "vertical-lr"
    
    public var description: String { rawValue }
}

/// Defines where the view is placed at the x-axis.
public struct XAxis: Lengthable, Percentable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    public static var left: XAxis { .init("left") }
    public static var center: XAxis { .init("center") }
    public static var right: XAxis { .init("right") }
    
    public var description: String { value }
}

/// Defines where the view is placed at the y-axis.
public struct YAxis: Lengthable, Percentable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    public static var top: YAxis { .init("top") }
    public static var center: YAxis { .init("center") }
    public static var bottom: YAxis { .init("bottom") }
    
    public var description: String { value }
}

/// Defines where the view is placed at the z-axis (for 3D transformations).
public struct ZAxis: Lengthable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    public var description: String { value }
}
