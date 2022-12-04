//
//  MediaRule.swift
//  CSS
//
//  Created by Mihael Isaev on 11.07.2020.
//

import JavaScriptKit

infix operator / : AdditionPrecedence
/// e.g. `8/5`
public func / (lhs: MediaRule.MediaFeature.AspectRatioPart, rhs: MediaRule.MediaFeature.AspectRatioPart) -> MediaRule.MediaFeature.AspectRatioValue {
    .init(stringLiteral: "\(lhs)/\(rhs)")
}

prefix operator !
/// write `!.screen`
/// to reach `"not screen"` in CSS
public prefix func ! (rhs: MediaRule.MediaType) -> MediaRule.MediaType {
    .init("!\(rhs.value)")
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
        case .items(let v): v.forEach { parseRulesItem($0) }
        case .rule(let v): _rules.append(v)
        case .keyframes(let v): _keyframes.append(v)
        case .media: print("❗️@media inside of @media doesn't work"); break
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
    
    func render() -> String {
        var result = "@media "
        result.append(_items.map { $0.value }.joined(separator: ", "))
        result.append("{")
        _rules.forEach { rule in
            result.append(rule.render())
        }
        _keyframes.forEach { kf in
            result.append(kf.render())
        }
        result.append("}")
        return result
    }
    
    public struct MediaType {
        let value: String
        
        init (_ value: String) {
            self.value = value
        }
        
        /// Suitable for all devices.
        public static var all: Self { .init("all") }
        /// Intended for paged material and documents viewed on a screen in print preview mode.
        ///
        /// Please see [paged media](https://developer.mozilla.org/en-US/docs/Web/CSS/Paged_Media)
        /// for information about formatting issues that are specific to these formats.
        public static var print: Self { .init("print") }
        public static var screen: Self { .init("screen") }
        
        public func and(_ feature: MediaFeature) -> MediaType {
            .init("\(self.value) and (\(feature.description))")
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
        
        public struct AnyHoverValue: ExpressibleByStringLiteral {
            public let value: String
            
            public init(stringLiteral value: String) {
                self.value = value
            }
            
            /// None of the available input mechanism(s) can hover conveniently, or there is no pointing input mechanism.
            public static var none: Self { "none" }

            /// One or more available input mechanisms can conveniently hover over elements.
            public static var hover: Self { "hover" }
        }
        
        /// Does any available input mechanism allow the user to hover over elements?
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/any-hover)
        public static func anyHover(_ value: AnyHoverValue) -> Self {
            .init(name: "any-hover", value: value.value)
        }
        
        public struct AnyPointerValue: ExpressibleByStringLiteral {
            public let value: String
            
            public init(stringLiteral value: String) {
                self.value = value
            }
            
            /// No pointing device is available.
            public static var none: Self { "none" }
            
            /// At least one input mechanism includes a pointing device of limited accuracy.
            public static var coarse: Self { "coarse" }
            
            /// At least one input mechanism includes an accurate pointing device.
            public static var fine: Self { "fine" }
        }
        
        /// Is any available input mechanism a pointing device, and if so, how accurate is it?
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/any-pointer)
        public static func anyPointer(_ value: AnyPointerValue) -> Self {
            .init(name: "any-pointer", value: value.value)
        }
        
        public struct AspectRatioPart: ExpressibleByIntegerLiteral {
            public let value: String
            
            public init(integerLiteral value: Int) {
                self.value = "\(value)"
            }
        }
        
        public struct AspectRatioValue: ExpressibleByStringLiteral {
            public let value: String
            
            public init(stringLiteral value: String) {
                self.value = value
            }
        }
        
        /// Width-to-height aspect ratio of the viewport
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/aspect-ratio)
        public static func aspectRatio(_ value: AspectRatioValue) -> Self {
            .init(name: "aspect-ratio", value: value.value)
        }
        
        /// Width-to-height aspect ratio of the viewport
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/aspect-ratio)
        public static func minAspectRatio(_ value: AspectRatioValue) -> Self {
            .init(name: "min-aspect-ratio", value: value.value)
        }
        
        /// Width-to-height aspect ratio of the viewport
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/aspect-ratio)
        public static func maxAspectRatio(_ value: AspectRatioValue) -> Self {
            .init(name: "max-aspect-ratio", value: value.value)
        }
        
        /// Any color device
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/color)
        public static var color: Self {
            .init(name: "color", value: nil)
        }
        
        /// Number of bits per color component of the output device, or zero if the device isn't color
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/color)
        public static func minColor(_ bits: UInt) -> Self {
            .init(name: "min-color", value: "\(bits)")
        }
        
        public struct ColorGamut: ExpressibleByStringLiteral {
            public let value: String
            
            public init(stringLiteral value: String) {
                self.value = value
            }
            
            /// The output device can support approximately the sRGB gamut or more.
            /// This includes the vast majority of color displays.
            public static var srgb: Self { "srgb" }
            
            /// The output device can support approximately the gamut specified by the Display P3 Color Space or more.
            /// The p3 gamut is larger than and includes the srgb gamut.
            public static var p3: Self { "p3" }

            /// The output device can support approximately the gamut
            /// specified by the ITU-R Recommendation BT.2020 Color Space or more.
            /// The rec2020 gamut is larger than and includes the p3 gamut.
            public static var rec2020: Self { "rec2020" }
        }
        
        /// Approximate range of colors that are supported by the user agent and output device.
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/color-gamut)
        public static func colorGamut(_ value: ColorGamut) -> Self {
            .init(name: "color-gamut", value: value.value)
        }
        
        /// Number of entries in the output device's color lookup table, or zero if the device does not use such a table
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/color-index)
        public static var colorIndex: Self {
            .init(name: "color-index", value: nil)
        }
        
        /// Number of entries in the output device's color lookup table, or zero if the device does not use such a table
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/color-index)
        public static func minColorIndex(_ index: UInt) -> Self {
            .init(name: "min-color-index", value: "\(index)")
        }
        
        public struct DisplayMode: ExpressibleByStringLiteral {
            public let value: String
            
            public init(stringLiteral value: String) {
                self.value = value
            }
            
            /// All of the available display area is used and no user agent chrome is shown.
            public static var fullscreen: Self { "fullscreen" }
            
            /// The application will look and feel like a standalone application.
            /// This can include the application having a different window, its own icon
            /// in the application launcher, etc. In this mode, the user agent will exclude UI elements
            /// for controlling navigation, but can include other UI elements such as a status bar.
            public static var standalone: Self { "standalone" }
            
            /// The application will look and feel like a standalone application,
            /// but will have a minimal set of UI elements for controlling navigation.
            /// The elements will vary by browser.
            public static var minimalUI: Self { "minimal-ui" }
            
            /// The application opens in a conventional browser tab or new window,
            /// depending on the browser and platform.
            public static var browser: Self { "browser" }
            
            /// In this mode, the application looks and feels like a standalone desktop application,
            /// and the Window Controls Overlay feature is enabled.
            public static var windowControlsOverlay: Self { "window-controls-overlay" }
        }
        
        /// The display mode of the application, as specified in the web app manifest's display member.
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/display-mode)
        public static func displayMode(_ value: DisplayMode) -> Self {
            .init(name: "display-mode", value: value.value)
        }
        
        public struct DynamicRange: ExpressibleByStringLiteral {
            public let value: String
            
            public init(stringLiteral value: String) {
                self.value = value
            }
            
            /// This value matches any visual device and excludes devices lacking visual capabilities.
            /// A user agent or an output device that matches high will also match the standard value.
            public static var standard: Self { "standard" }
            
            /// This value matches user agents and output devices that support high peak brightness,
            /// high contrast ratio, and color depth greater than 24 bit or 8 bit per color component of RGB.
            /// Peak brightness refers to how bright the brightest point a light-emitting device, such as an LCD screen,
            /// can produce. In the case of a light-reflective device, such as paper or e-ink, peak brightness
            /// refers to the point that at least absorbs light. Contrast ratio refers to the ratio
            /// of the luminance of the brightest color to that of the darkest color that the system is capable of producing.
            /// Currently, there is no precise way to measure peak brightness and contrast ratio, and the determination
            /// of what counts as high peak brightness and high contrast ratio depends on the user agent.
            public static var high: Self { "high" }
        }
        
        /// Combination of brightness, contrast ratio, and color depth
        /// that are supported by the user agent and the output device.
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/dynamic-range)
        public static func dynamicRange(_ value: DynamicRange) -> Self {
            .init(name: "dynamic-range", value: value.value)
        }
        
        public struct ForcedColors: ExpressibleByStringLiteral {
            public let value: String
            
            public init(stringLiteral value: String) {
                self.value = value
            }
            
            /// Forced colors mode is not active; the page's colors are not being forced into a limited palette.
            public static var none: Self { "none" }
            
            /// Indicates that forced colors mode is active. The browser provides the color palette
            /// to authors through the CSS system color keywords and, if appropriate,
            /// triggers the appropriate value of prefers-color-scheme so that authors can adapt the page.
            /// The browser selects the value for prefers-color-scheme based on the lightness
            /// of the Canvas system color (see the color adjust spec for more details).
            public static var active: Self { "active" }
        }
        
        /// Detect whether user agent restricts color palette.
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/forced-colors)
        public static func forcedColors(_ value: ForcedColors) -> Self {
            .init(name: "forced-colors", value: value.value)
        }
        
        /// Does the device use a grid or bitmap screen?
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/grid)
        public static func grid(_ value: Bool) -> Self {
            .init(name: "grid", value: value ? "1" : "0")
        }
        
        /// Height of the viewport.
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/height)
        public func height<U: UnitValuable>(_ value: U) -> Self {
            .init(name: "height", value: UnitValue(value.value.doubleValue, value.unit).description)
        }
        
        /// Min height of the viewport.
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/height)
        public func minHeight<U: UnitValuable>(_ value: U) -> Self {
            .init(name: "min-height", value: UnitValue(value.value.doubleValue, value.unit).description)
        }
        
        /// Max height of the viewport.
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/height)
        public func maxHeight<U: UnitValuable>(_ value: U) -> Self {
            .init(name: "max-height", value: UnitValue(value.value.doubleValue, value.unit).description)
        }
        
        public struct Hover: ExpressibleByStringLiteral {
            public let value: String
            
            public init(stringLiteral value: String) {
                self.value = value
            }
            
            /// The primary input mechanism cannot hover at all
            /// or cannot conveniently hover (e.g., many mobile devices emulate hovering
            /// when the user performs an inconvenient long tap), or there is no primary pointing input mechanism.
            public static var none: Self { "none" }
            
            /// The primary input mechanism can conveniently hover over elements.
            public static var hover: Self { "hover" }
        }
        
        /// Does the primary input mechanism allow the user to hover over elements?
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/hover)
        public static func hover(_ value: Hover) -> Self {
            .init(name: "hover", value: value.value)
        }
        
        public struct InvertedColors: ExpressibleByStringLiteral {
            public let value: String
            
            public init(stringLiteral value: String) {
                self.value = value
            }
            
            /// Colors are displayed normally.
            public static var none: Self { "none" }
            
            /// All pixels within the displayed area have been inverted.
            public static var inverted: Self { "inverted" }
        }
        
        /// Is the user agent or underlying OS inverting colors?
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/inverted-colors)
        public static func invertedColors(_ value: InvertedColors) -> Self {
            .init(name: "inverted-colors", value: value.value)
        }
        
        /// Bits per pixel in the output device's monochrome frame buffer, or zero if the device isn't monochrome.
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/monochrome)
        public static var monochrome: Self {
            .init(name: "monochrome", value: nil)
        }
        
        /// Bits per pixel in the output device's monochrome frame buffer, or zero if the device isn't monochrome.
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/monochrome)
        public static func monochrome(_ value: UInt) -> Self {
            .init(name: "monochrome", value: "\(value)")
        }
        
        /// Bits per pixel in the output device's monochrome frame buffer, or zero if the device isn't monochrome.
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/monochrome)
        public static func minMonochrome(_ value: UInt) -> Self {
            .init(name: "min-monochrome", value: "\(value)")
        }
        
        /// Bits per pixel in the output device's monochrome frame buffer, or zero if the device isn't monochrome.
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/monochrome)
        public static func maxMonochrome(_ value: UInt) -> Self {
            .init(name: "max-monochrome", value: "\(value)")
        }
        
        public struct Orientation: ExpressibleByStringLiteral {
            public let value: String
            
            public init(stringLiteral value: String) {
                self.value = value
            }
            
            /// The viewport is in a portrait orientation, i.e., the height is greater than or equal to the width.
            public static var portrait: Self { "portrait" }
            
            /// The viewport is in a landscape orientation, i.e., the width is greater than the height.
            public static var landscape: Self { "landscape" }
        }
        
        /// Orientation of the viewport.
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/orientation)
        public static func orientation(_ value: Orientation) -> Self {
            .init(name: "orientation", value: value.value)
        }
        
        public struct OverflowBlock: ExpressibleByStringLiteral {
            public let value: String
            
            public init(stringLiteral value: String) {
                self.value = value
            }
            
            /// Content that overflows the block axis is not displayed.
            public static var none: Self { "none" }
            
            /// Content that overflows the block axis can be seen by scrolling to it.
            public static var scroll: Self { "scroll" }
            
            /// Content that overflows the block axis can be seen by scrolling to it,
            /// but page breaks can be manually triggered (such as via break-inside, etc.)
            /// to cause the following content to display on the following page.
            public static var optionalPaged: Self { "optional-paged" }
            
            /// Content is broken up into discrete pages; content that overflows
            /// one page in the block axis is displayed on the following page.
            public static var paged: Self { "paged" }
        }
        
        /// How does the output device handle content that overflows the viewport along the block axis?
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/overflow-block)
        public static func overflowBlock(_ value: OverflowBlock) -> Self {
            .init(name: "overflow-block", value: value.value)
        }
        
        public struct OverflowInline: ExpressibleByStringLiteral {
            public let value: String
            
            public init(stringLiteral value: String) {
                self.value = value
            }
            
            /// Content that overflows the inline axis is not displayed.
            public static var none: Self { "none" }
            
            /// Content that overflows the inline axis can be seen by scrolling to it.
            public static var scroll: Self { "scroll" }
        }
        
        /// Can content that overflows the viewport along the inline axis be scrolled?
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/overflow-inline)
        public static func overflowInline(_ value: OverflowInline) -> Self {
            .init(name: "overflow-inline", value: nil)
        }
        
        public struct Pointer: ExpressibleByStringLiteral {
            public let value: String
            
            public init(stringLiteral value: String) {
                self.value = value
            }
            
            /// The primary input mechanism does not include a pointing device.
            public static var none: Self { "none" }
            
            /// The primary input mechanism includes a pointing device of limited accuracy.
            public static var coarse: Self { "coarse" }
            
            /// The primary input mechanism includes an accurate pointing device.
            public static var fine: Self { "fine" }
        }
        
        /// Is the primary input mechanism a pointing device, and if so, how accurate is it?
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/pointer)
        public static func pointer(_ value: Pointer) -> Self {
            .init(name: "pointer", value: value.value)
        }
        
        public struct PrefersColorScheme: ExpressibleByStringLiteral {
            public let value: String
            
            public init(stringLiteral value: String) {
                self.value = value
            }
            
            /// Indicates that user has notified that they prefer an interface
            /// that has a light theme, or has not expressed an active preference.
            public static var light: Self { "light" }
            
            /// Indicates that user has notified that they prefer an interface that has a dark theme.
            public static var dark: Self { "dark" }
        }
        
        /// Detect if the user prefers a light or dark color scheme.
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/prefers-color-scheme)
        public static func prefersColorScheme(_ value: PrefersColorScheme) -> Self {
            .init(name: "prefers-color-scheme", value: value.value)
        }
        
        public struct PrefersContrast: ExpressibleByStringLiteral {
            public let value: String
            
            public init(stringLiteral value: String) {
                self.value = value
            }
            
            /// Indicates that the user has made no preference known to the system.
            /// This keyword value evaluates as false in the Boolean context.
            public static var noPreference: Self { "no-preference" }
            
            /// Indicates that user has notified the system that they prefer
            /// an interface that has a higher level of contrast.
            public static var more: Self { "more" }
            
            /// Indicates that user has notified the system that they prefer
            /// an interface that has a lower level of contrast.
            public static var less: Self { "less" }
            
            /// Indicates that user has notified the system for using a specific set of colors,
            /// and the contrast implied by these colors matches neither more nor less.
            /// This value will match the color palette specified by users of `forced-colors: active`.
            public static var custom: Self { "custom" }
        }
        
        /// Detects if the user has requested the system
        /// increase or decrease the amount of contrast between adjacent colors.
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/prefers-contrast)
        public static func prefersContrast(_ value: PrefersContrast) -> Self {
            .init(name: "prefers-contrast", value: value.value)
        }
        
        /// The user prefers less motion on the page.
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/prefers-reduced-motion)
        public static var prefersReducedMotion: Self {
            .init(name: "prefers-reduced-motion", value: nil)
        }
        
        /// Pixel density of the output device.
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/resolution)
        public static func resolution(_ dpi: UInt) -> Self {
            .init(name: "resolution", value: "\(dpi)dpi")
        }
        
        public struct Scripting: ExpressibleByStringLiteral {
            public let value: String
            
            public init(stringLiteral value: String) {
                self.value = value
            }
            
            /// Scripting is completely unavailable on the current document.
            public static var none: Self { "none" }
            
            /// Scripting is enabled during the initial page load, but not afterwards.
            public static var initialOnly: Self { "initial-only" }
            
            /// Scripting is supported and active on the current document.
            public static var enabled: Self { "enabled" }
        }
        
        /// Detects whether scripting (i.e. JavaScript) is available.
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/scripting)
        public static func scripting(_ value: Scripting) -> Self {
            .init(name: "scripting", value: value.value)
        }
        
        public struct Update: ExpressibleByStringLiteral {
            public let value: String
            
            public init(stringLiteral value: String) {
                self.value = value
            }
            
            /// Once it has been rendered, the layout can no longer be updated.
            ///
            /// Example: documents printed on paper.
            public static var none: Self { "none" }
            
            /// The layout may change dynamically according to the usual rules of CSS,
            /// but the output device is not able to render or display changes quickly enough
            /// for them to be perceived as a smooth animation.
            ///
            /// Examples: e-book readers or severely underpowered devices.
            public static var slow: Self { "slow" }
            
            /// The layout may change dynamically according to the usual rules of CSS,
            /// and the output device is not unusually constrained in speed,
            /// so regularly-updating things like CSS Animations can be used.
            ///
            /// Example: computer screens.
            public static var fast: Self { "fast" }
        }
        
        /// How frequently the output device can modify the appearance of content.
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/update-frequency)
        public static func update(_ value: Update) -> Self {
            .init(name: "update", value: value.value)
        }
        
        public struct VideoDynamicRange: ExpressibleByStringLiteral {
            public let value: String
            
            public init(stringLiteral value: String) {
                self.value = value
            }
            
            /// This value matches any visual device and excludes devices lacking visual capabilities.
            /// A user agent or an output device that matches high will also match the standard value.
            public static var standard: Self { "standard" }
            
            /// This value matches user agents and output devices that support high peak brightness,
            /// high contrast ratio, and color depth greater than 24 bit or 8 bit per color component of RGB.
            /// Peak brightness refers to how bright the brightest point a light-emitting device,
            /// such as an LCD screen, can produce. In the case of a light-reflective device, such as paper or e-ink,
            /// peak brightness refers to the point that at least absorbs light. Contrast ratio refers to the ratio
            /// of the luminance of the brightest color to that of the darkest color that the system is capable of producing.
            /// Currently, there is no precise way to measure peak brightness and contrast ratio,
            /// and the determination of what counts as high peak brightness and high contrast ratio depends on the user agent.
            public static var high: Self { "high" }
        }
        
        /// Combination of brightness, contrast ratio, and color depth
        /// that are supported by the video plane of user agent and the output device.
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/video-dynamic-range)
        public static func videoDynamicRange(_ value: VideoDynamicRange) -> Self {
            .init(name: "video-dynamic-range", value: value.value)
        }
        
        /// Width of the viewport including width of scrollbar.
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/width)
        public static func width<U: UnitValuable>(_ value: U) -> Self {
            .init(name: "width", value: UnitValue(value.value.doubleValue, value.unit).description)
        }
        
        /// Minimum width of the viewport including width of scrollbar.
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/width)
        public static func minWidth<U: UnitValuable>(_ value: U) -> Self {
            .init(name: "min-width", value: UnitValue(value.value.doubleValue, value.unit).description)
        }
        
        /// Maximum width of the viewport including width of scrollbar.
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/width)
        public static func maxWidth<U: UnitValuable>(_ value: U) -> Self {
            .init(name: "max-width", value: UnitValue(value.value.doubleValue, value.unit).description)
        }
    }
    
}
