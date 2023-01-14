//
//  MediaRule.swift
//  CSS
//
//  Created by Mihael Isaev on 11.07.2020.
//

import JavaScriptKit

infix operator / : AdditionPrecedence
/// e.g. `8/5`
public func / (lhs: MediaRule.MediaType.AspectRatioPart, rhs: MediaRule.MediaType.AspectRatioPart) -> MediaRule.MediaType.AspectRatioValue {
    .init("\(lhs.value)/\(rhs.value)")
}

prefix operator !
/// write `!.screen`
/// to reach `"not screen"` in CSS
public prefix func ! (rhs: MediaRule.MediaType) -> MediaRule.MediaType {
    .init("not \(rhs.value)")
}

extension String: RulesContent {
    public var rulesContent: Rules.Item { .raw(self) }
}

/// A conditional group rule that will apply its content
/// if the device meets the criteria of the condition defined using a media query.
/// Sets the style rules for different media types/devices/sizes
///
/// ```html
/// @media screen and (max-width: 600px) {
///     body {
///         background-color: lightblue;
///     }
/// }
/// ```
///
/// /// ```html
/// MediaRule(.screen.and(.maxWidth(600.px))) {
///     Rule(Body.pointer)
///         .backgroundColor(.lightblue)
/// }
/// ```
///
/// [Learn more](https://www.w3schools.com/cssref/css3_pr_mediaquery.asp)
public class MediaRule: RulesContent, CSSRulable {
    public typealias Rule = CSSRule
    public typealias RuleItems = Rules.Content
    public var rulesContent: Rules.Item { .media(self) }
    
    public internal(set) var domElement: JSValue?
    var _items: [MediaType] = []
    public private(set) var _rawStyles: [String] = []
    public private(set) var _rules: [CSSRule] = []
    public private(set) var _keyframes: [Keyframes] = []
    
    let propertyKey = "@media"
    
    init (domElement: JSValue) {
        self.domElement = domElement
    }
    
    public init (_ items: [MediaType], @Rules content: @escaping Rules.Block) {
        self._items = items
        parseRulesItem(content().rulesContent)
        parseRulesItem(rules.rulesContent)
        processRules()
    }
    
    public convenience init (_ items: MediaType..., @Rules content: @escaping Rules.Block) {
        self.init(items, content: content)
    }
    
    @Rules open var rules: RuleItems { _RulesContent(rulesContent: .none) }
    
    private func parseRulesItem(_ item: Rules.Item) {
        switch item {
        case .raw(let v): _rawStyles.append(v)
        case .items(let v): v.forEach { parseRulesItem($0) }
        case .rule(let v): _rules.append(v)
        case .keyframes(let v): _keyframes.append(v)
        case .media: print("❗️@media inside of @media doesn't work"); break
        case .forEach(let fr): fr.allItems().forEach { parseRulesItem($0.rulesContent) }
        case .none: break
        }
    }
    
    public func processRules() {
        // TODO: ??? Need to test with JS to investigate how to manipulate in runtime
//        _rules.enumerated().forEach { i, rule in
//            let cssText = rule.render()
//            #if !WEBPREVIEW
//            guard let index = sheet.insertRule.function?.callAsFunction(optionalThis: sheet.object, cssText)?.number else { return }
//            rule.domElement = sheet.rules.item.function?.callAsFunction(optionalThis: sheet.rules.object, Int(index))
//            #endif
//        }
//        _keyframes.enumerated().forEach { i, kf in
//            let cssText = kf.render()
//            #if !WEBPREVIEW
//            guard let index = sheet.insertRule.function?.callAsFunction(optionalThis: sheet.object, cssText)?.number else { return }
//            kf.domElement = sheet.rules.item.function?.callAsFunction(optionalThis: sheet.rules.object, Int(index))
//            #endif
//        }
    }
    
    public func render() -> String {
        var result = "@media "
        result.append(_items.map { $0.value }.joined(separator: ", "))
        result.append("{")
        _rawStyles.forEach { raw in
            result.append(raw)
        }
        _rules.forEach { rule in
            result.append(rule.render())
        }
        _keyframes.forEach { kf in
            result.append(kf.render())
        }
        result.append("}")
        return result
    }
    
    public struct MediaType: CustomStringConvertible {
        let value: String
        let label: String?
        
        public var description: String { label ?? value }
        
        public init (_ value: String, label: String? = nil) {
            self.value = value
            self.label = label
        }
        
        public init (_ mediaType: MediaType, label: String? = nil) {
            self.value = mediaType.value
            self.label = label
        }
        
        /// Suitable for all devices.
        ///
        /// ```
        /// !.all // to reach `not all`
        /// ```
        ///
        public static var all: Self { .init("all") }
        /// Intended for paged material and documents viewed on a screen in print preview mode.
        ///
        /// ```
        /// !.print // to reach `not print`
        /// ```
        ///
        /// Please see [paged media](https://developer.mozilla.org/en-US/docs/Web/CSS/Paged_Media)
        /// for information about formatting issues that are specific to these formats.
        public static var print: Self { .init("print") }
        
        ///
        /// ```
        /// !.screen // to reach `not screen`
        /// ```
        ///
        public static var screen: Self { .init("screen") }
        
        // MARK: Helper
        
        func and(_ feature: MediaFeature) -> MediaType {
            .init("\(self.value) and (\(feature.description))")
        }
        
        // MARK: Media Features
        
        public struct AnyHoverValue {
            public let value: String
            
            public init(_ value: String) {
                self.value = value
            }
            
            /// None of the available input mechanism(s) can hover conveniently, or there is no pointing input mechanism.
            public static var none: Self { .init("none") }

            /// One or more available input mechanisms can conveniently hover over elements.
            public static var hover: Self { .init("hover") }
        }
        
        /// Does any available input mechanism allow the user to hover over elements?
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/any-hover)
        public func anyHover(_ value: AnyHoverValue) -> MediaType {
            and(.init(name: "any-hover", value: value.value))
        }
        
        public struct AnyPointerValue {
            public let value: String
            
            public init(_ value: String) {
                self.value = value
            }
            
            /// No pointing device is available.
            public static var none: Self { .init("none") }
            
            /// At least one input mechanism includes a pointing device of limited accuracy.
            public static var coarse: Self { .init("coarse") }
            
            /// At least one input mechanism includes an accurate pointing device.
            public static var fine: Self { .init("fine") }
        }
        
        /// Is any available input mechanism a pointing device, and if so, how accurate is it?
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/any-pointer)
        public func anyPointer(_ value: AnyPointerValue) -> MediaType {
            and(.init(name: "any-pointer", value: value.value))
        }
        
        public struct AspectRatioPart: ExpressibleByIntegerLiteral {
            public let value: String
            
            public init(integerLiteral value: Int) {
                self.value = "\(value)"
            }
        }
        
        public struct AspectRatioValue {
            public let value: String
            
            public init(_ value: String) {
                self.value = value
            }
        }
        
        /// Width-to-height aspect ratio of the viewport
        ///
        /// ```
        /// .aspectRatio(4 / 3)
        /// ```
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/aspect-ratio)
        public func aspectRatio(_ value: AspectRatioValue) -> MediaType {
            and(.init(name: "aspect-ratio", value: value.value))
        }
        
        /// Width-to-height aspect ratio of the viewport
        ///
        /// ```
        /// .minAspectRatio(4 / 3)
        /// ```
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/aspect-ratio)
        public func minAspectRatio(_ value: AspectRatioValue) -> MediaType {
            and(.init(name: "min-aspect-ratio", value: value.value))
        }
        
        /// Width-to-height aspect ratio of the viewport
        ///
        /// ```
        /// .maxAspectRatio(4 / 3)
        /// ```
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/aspect-ratio)
        public func maxAspectRatio(_ value: AspectRatioValue) -> MediaType {
            and(.init(name: "max-aspect-ratio", value: value.value))
        }
        
        /// Any color device
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/color)
        public var color: MediaType {
            and(.init(name: "color", value: nil))
        }
        
        /// Number of bits per color component of the output device, or zero if the device isn't color
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/color)
        public func minColor(_ bits: UInt) -> MediaType {
            and(.init(name: "min-color", value: "\(bits)"))
        }
        
        public struct ColorGamut {
            public let value: String
            
            public init(_ value: String) {
                self.value = value
            }
            
            /// The output device can support approximately the sRGB gamut or more.
            /// This includes the vast majority of color displays.
            public static var srgb: Self { .init("srgb") }
            
            /// The output device can support approximately the gamut specified by the Display P3 Color Space or more.
            /// The p3 gamut is larger than and includes the srgb gamut.
            public static var p3: Self { .init("p3") }

            /// The output device can support approximately the gamut
            /// specified by the ITU-R Recommendation BT.2020 Color Space or more.
            /// The rec2020 gamut is larger than and includes the p3 gamut.
            public static var rec2020: Self { .init("rec2020") }
        }
        
        /// Approximate range of colors that are supported by the user agent and output device.
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/color-gamut)
        public func colorGamut(_ value: ColorGamut) -> MediaType {
            and(.init(name: "color-gamut", value: value.value))
        }
        
        /// Number of entries in the output device's color lookup table, or zero if the device does not use such a table
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/color-index)
        public var colorIndex: Self {
            and(.init(name: "color-index", value: nil))
        }
        
        /// Number of entries in the output device's color lookup table, or zero if the device does not use such a table
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/color-index)
        public func minColorIndex(_ index: UInt) -> MediaType {
            and(.init(name: "min-color-index", value: "\(index)"))
        }
        
        public struct DisplayMode {
            public let value: String
            
            public init(_ value: String) {
                self.value = value
            }
            
            /// All of the available display area is used and no user agent chrome is shown.
            public static var fullscreen: Self { .init("fullscreen") }
            
            /// The application will look and feel like a standalone application.
            /// This can include the application having a different window, its own icon
            /// in the application launcher, etc. In this mode, the user agent will exclude UI elements
            /// for controlling navigation, but can include other UI elements such as a status bar.
            public static var standalone: Self { .init("standalone") }
            
            /// The application will look and feel like a standalone application,
            /// but will have a minimal set of UI elements for controlling navigation.
            /// The elements will vary by browser.
            public static var minimalUI: Self { .init("minimal-ui") }
            
            /// The application opens in a conventional browser tab or new window,
            /// depending on the browser and platform.
            public static var browser: Self { .init("browser") }
            
            /// In this mode, the application looks and feels like a standalone desktop application,
            /// and the Window Controls Overlay feature is enabled.
            public static var windowControlsOverlay: Self { .init("window-controls-overlay") }
        }
        
        /// The display mode of the application, as specified in the web app manifest's display member.
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/display-mode)
        public func displayMode(_ value: DisplayMode) -> MediaType {
            and(.init(name: "display-mode", value: value.value))
        }
        
        public struct DynamicRange {
            public let value: String
            
            public init(_ value: String) {
                self.value = value
            }
            
            /// This value matches any visual device and excludes devices lacking visual capabilities.
            /// A user agent or an output device that matches high will also match the standard value.
            public static var standard: Self { .init("standard") }
            
            /// This value matches user agents and output devices that support high peak brightness,
            /// high contrast ratio, and color depth greater than 24 bit or 8 bit per color component of RGB.
            /// Peak brightness refers to how bright the brightest point a light-emitting device, such as an LCD screen,
            /// can produce. In the case of a light-reflective device, such as paper or e-ink, peak brightness
            /// refers to the point that at least absorbs light. Contrast ratio refers to the ratio
            /// of the luminance of the brightest color to that of the darkest color that the system is capable of producing.
            /// Currently, there is no precise way to measure peak brightness and contrast ratio, and the determination
            /// of what counts as high peak brightness and high contrast ratio depends on the user agent.
            public static var high: Self { .init("high") }
        }
        
        /// Combination of brightness, contrast ratio, and color depth
        /// that are supported by the user agent and the output device.
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/dynamic-range)
        public func dynamicRange(_ value: DynamicRange) -> MediaType {
            and(.init(name: "dynamic-range", value: value.value))
        }
        
        public struct ForcedColors {
            public let value: String
            
            public init(_ value: String) {
                self.value = value
            }
            
            /// Forced colors mode is not active; the page's colors are not being forced into a limited palette.
            public static var none: Self { .init("none") }
            
            /// Indicates that forced colors mode is active. The browser provides the color palette
            /// to authors through the CSS system color keywords and, if appropriate,
            /// triggers the appropriate value of prefers-color-scheme so that authors can adapt the page.
            /// The browser selects the value for prefers-color-scheme based on the lightness
            /// of the Canvas system color (see the color adjust spec for more details).
            public static var active: Self { .init("active") }
        }
        
        /// Detect whether user agent restricts color palette.
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/forced-colors)
        public func forcedColors(_ value: ForcedColors) -> MediaType {
            and(.init(name: "forced-colors", value: value.value))
        }
        
        /// Does the device use a grid or bitmap screen?
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/grid)
        public func grid(_ value: Bool) -> MediaType {
            and(.init(name: "grid", value: value ? "1" : "0"))
        }
        
        /// Height of the viewport.
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/height)
        public func height<U: UnitValuable>(_ value: U) -> MediaType {
            and(.init(name: "height", value: UnitValue(value.value.doubleValue, value.unit).description))
        }
        
        /// Min height of the viewport.
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/height)
        public func minHeight<U: UnitValuable>(_ value: U) -> MediaType {
            and(.init(name: "min-height", value: UnitValue(value.value.doubleValue, value.unit).description))
        }
        
        /// Max height of the viewport.
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/height)
        public func maxHeight<U: UnitValuable>(_ value: U) -> MediaType {
            and(.init(name: "max-height", value: UnitValue(value.value.doubleValue, value.unit).description))
        }
        
        public struct Hover {
            public let value: String
            
            public init(_ value: String) {
                self.value = value
            }
            
            /// The primary input mechanism cannot hover at all
            /// or cannot conveniently hover (e.g., many mobile devices emulate hovering
            /// when the user performs an inconvenient long tap), or there is no primary pointing input mechanism.
            public static var none: Self { .init("none") }
            
            /// The primary input mechanism can conveniently hover over elements.
            public static var hover: Self { .init("hover") }
        }
        
        /// Does the primary input mechanism allow the user to hover over elements?
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/hover)
        public func hover(_ value: Hover) -> MediaType {
            and(.init(name: "hover", value: value.value))
        }
        
        public struct InvertedColors {
            public let value: String
            
            public init(_ value: String) {
                self.value = value
            }
            
            /// Colors are displayed normally.
            public static var none: Self { .init("none") }
            
            /// All pixels within the displayed area have been inverted.
            public static var inverted: Self { .init("inverted") }
        }
        
        /// Is the user agent or underlying OS inverting colors?
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/inverted-colors)
        public func invertedColors(_ value: InvertedColors) -> MediaType {
            and(.init(name: "inverted-colors", value: value.value))
        }
        
        /// Bits per pixel in the output device's monochrome frame buffer, or zero if the device isn't monochrome.
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/monochrome)
        public var monochrome: MediaType {
            and(.init(name: "monochrome", value: nil))
        }
        
        /// Bits per pixel in the output device's monochrome frame buffer, or zero if the device isn't monochrome.
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/monochrome)
        public func monochrome(_ value: UInt) -> MediaType {
            and(.init(name: "monochrome", value: "\(value)"))
        }
        
        /// Bits per pixel in the output device's monochrome frame buffer, or zero if the device isn't monochrome.
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/monochrome)
        public func minMonochrome(_ value: UInt) -> MediaType {
            and(.init(name: "min-monochrome", value: "\(value)"))
        }
        
        /// Bits per pixel in the output device's monochrome frame buffer, or zero if the device isn't monochrome.
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/monochrome)
        public func maxMonochrome(_ value: UInt) -> MediaType {
            and(.init(name: "max-monochrome", value: "\(value)"))
        }
        
        public struct Orientation {
            public let value: String
            
            public init(_ value: String) {
                self.value = value
            }
            
            /// The viewport is in a portrait orientation, i.e., the height is greater than or equal to the width.
            public static var portrait: Self { .init("portrait") }
            
            /// The viewport is in a landscape orientation, i.e., the width is greater than the height.
            public static var landscape: Self { .init("landscape") }
        }
        
        /// Orientation of the viewport.
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/orientation)
        public func orientation(_ value: Orientation) -> MediaType {
            and(.init(name: "orientation", value: value.value))
        }
        
        public struct OverflowBlock {
            public let value: String
            
            public init(_ value: String) {
                self.value = value
            }
            
            /// Content that overflows the block axis is not displayed.
            public static var none: Self { .init("none") }
            
            /// Content that overflows the block axis can be seen by scrolling to it.
            public static var scroll: Self { .init("scroll") }
            
            /// Content that overflows the block axis can be seen by scrolling to it,
            /// but page breaks can be manually triggered (such as via break-inside, etc.)
            /// to cause the following content to display on the following page.
            public static var optionalPaged: Self { .init("optional-paged") }
            
            /// Content is broken up into discrete pages; content that overflows
            /// one page in the block axis is displayed on the following page.
            public static var paged: Self { .init("paged") }
        }
        
        /// How does the output device handle content that overflows the viewport along the block axis?
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/overflow-block)
        public func overflowBlock(_ value: OverflowBlock) -> MediaType {
            and(.init(name: "overflow-block", value: value.value))
        }
        
        public struct OverflowInline {
            public let value: String
            
            public init(_ value: String) {
                self.value = value
            }
            
            /// Content that overflows the inline axis is not displayed.
            public static var none: Self { .init("none") }
            
            /// Content that overflows the inline axis can be seen by scrolling to it.
            public static var scroll: Self { .init("scroll") }
        }
        
        /// Can content that overflows the viewport along the inline axis be scrolled?
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/overflow-inline)
        public func overflowInline(_ value: OverflowInline) -> MediaType {
            and(.init(name: "overflow-inline", value: nil))
        }
        
        public struct Pointer {
            public let value: String
            
            public init(_ value: String) {
                self.value = value
            }
            
            /// The primary input mechanism does not include a pointing device.
            public static var none: Self { .init("none") }
            
            /// The primary input mechanism includes a pointing device of limited accuracy.
            public static var coarse: Self { .init("coarse") }
            
            /// The primary input mechanism includes an accurate pointing device.
            public static var fine: Self { .init("fine") }
        }
        
        /// Is the primary input mechanism a pointing device, and if so, how accurate is it?
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/pointer)
        public func pointer(_ value: Pointer) -> MediaType {
            and(.init(name: "pointer", value: value.value))
        }
        
        public struct PrefersColorScheme {
            public let value: String
            
            public init(_ value: String) {
                self.value = value
            }
            
            /// Indicates that user has notified that they prefer an interface
            /// that has a light theme, or has not expressed an active preference.
            public static var light: Self { .init("light") }
            
            /// Indicates that user has notified that they prefer an interface that has a dark theme.
            public static var dark: Self { .init("dark") }
        }
        
        /// Detect if the user prefers a light or dark color scheme.
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/prefers-color-scheme)
        public func prefersColorScheme(_ value: PrefersColorScheme) -> MediaType {
            and(.init(name: "prefers-color-scheme", value: value.value))
        }
        
        public struct PrefersContrast {
            public let value: String
            
            public init(_ value: String) {
                self.value = value
            }
            
            /// Indicates that the user has made no preference known to the system.
            /// This keyword value evaluates as false in the Boolean context.
            public static var noPreference: Self { .init("no-preference") }
            
            /// Indicates that user has notified the system that they prefer
            /// an interface that has a higher level of contrast.
            public static var more: Self { .init("more") }
            
            /// Indicates that user has notified the system that they prefer
            /// an interface that has a lower level of contrast.
            public static var less: Self { .init("less") }
            
            /// Indicates that user has notified the system for using a specific set of colors,
            /// and the contrast implied by these colors matches neither more nor less.
            /// This value will match the color palette specified by users of `forced-colors: active`.
            public static var custom: Self { .init("custom") }
        }
        
        /// Detects if the user has requested the system
        /// increase or decrease the amount of contrast between adjacent colors.
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/prefers-contrast)
        public func prefersContrast(_ value: PrefersContrast) -> MediaType {
            and(.init(name: "prefers-contrast", value: value.value))
        }
        
        /// The user prefers less motion on the page.
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/prefers-reduced-motion)
        public var prefersReducedMotion: MediaType {
            and(.init(name: "prefers-reduced-motion", value: nil))
        }
        
        /// Pixel density of the output device.
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/resolution)
        public func resolution(_ dpi: UInt) -> MediaType {
            and(.init(name: "resolution", value: "\(dpi)dpi"))
        }
        
        public struct Scripting {
            public let value: String
            
            public init(_ value: String) {
                self.value = value
            }
            
            /// Scripting is completely unavailable on the current document.
            public static var none: Self { .init("none") }
            
            /// Scripting is enabled during the initial page load, but not afterwards.
            public static var initialOnly: Self { .init("initial-only") }
            
            /// Scripting is supported and active on the current document.
            public static var enabled: Self { .init("enabled") }
        }
        
        /// Detects whether scripting (i.e. JavaScript) is available.
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/scripting)
        public func scripting(_ value: Scripting) -> MediaType {
            and(.init(name: "scripting", value: value.value))
        }
        
        public struct Update {
            public let value: String
            
            public init(_ value: String) {
                self.value = value
            }
            
            /// Once it has been rendered, the layout can no longer be updated.
            ///
            /// Example: documents printed on paper.
            public static var none: Self { .init("none") }
            
            /// The layout may change dynamically according to the usual rules of CSS,
            /// but the output device is not able to render or display changes quickly enough
            /// for them to be perceived as a smooth animation.
            ///
            /// Examples: e-book readers or severely underpowered devices.
            public static var slow: Self { .init("slow") }
            
            /// The layout may change dynamically according to the usual rules of CSS,
            /// and the output device is not unusually constrained in speed,
            /// so regularly-updating things like CSS Animations can be used.
            ///
            /// Example: computer screens.
            public static var fast: Self { .init("fast") }
        }
        
        /// How frequently the output device can modify the appearance of content.
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/update-frequency)
        public func update(_ value: Update) -> MediaType {
            and(.init(name: "update", value: value.value))
        }
        
        public struct VideoDynamicRange {
            public let value: String
            
            public init(_ value: String) {
                self.value = value
            }
            
            /// This value matches any visual device and excludes devices lacking visual capabilities.
            /// A user agent or an output device that matches high will also match the standard value.
            public static var standard: Self { .init("standard") }
            
            /// This value matches user agents and output devices that support high peak brightness,
            /// high contrast ratio, and color depth greater than 24 bit or 8 bit per color component of RGB.
            /// Peak brightness refers to how bright the brightest point a light-emitting device,
            /// such as an LCD screen, can produce. In the case of a light-reflective device, such as paper or e-ink,
            /// peak brightness refers to the point that at least absorbs light. Contrast ratio refers to the ratio
            /// of the luminance of the brightest color to that of the darkest color that the system is capable of producing.
            /// Currently, there is no precise way to measure peak brightness and contrast ratio,
            /// and the determination of what counts as high peak brightness and high contrast ratio depends on the user agent.
            public static var high: Self { .init("high") }
        }
        
        /// Combination of brightness, contrast ratio, and color depth
        /// that are supported by the video plane of user agent and the output device.
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/video-dynamic-range)
        public func videoDynamicRange(_ value: VideoDynamicRange) -> MediaType {
            and(.init(name: "video-dynamic-range", value: value.value))
        }
        
        /// Width of the viewport including width of scrollbar.
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/width)
        public func width<U: UnitValuable>(_ value: U) -> MediaType {
            and(.init(name: "width", value: UnitValue(value.value.doubleValue, value.unit).description))
        }
        
        /// Minimum width of the viewport including width of scrollbar.
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/width)
        public func minWidth<U: UnitValuable>(_ value: U) -> MediaType {
            and(.init(name: "min-width", value: UnitValue(value.value.doubleValue, value.unit).description))
        }
        
        /// Maximum width of the viewport including width of scrollbar.
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/width)
        public func maxWidth<U: UnitValuable>(_ value: U) -> MediaType {
            and(.init(name: "max-width", value: UnitValue(value.value.doubleValue, value.unit).description))
        }
    }
    
    public struct MediaFeature: CustomStringConvertible {
        public let name: String
        public let value: String?
        
        public var description: String {
            var result = name
            if let value = value {
                result.append(": \(value)")
            }
            return result
        }
        
        public init (name: String, value: String?) {
            self.name = name
            self.value = value
        }
    }
    
}
