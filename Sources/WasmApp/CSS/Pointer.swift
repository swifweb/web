//
//  CSSPointer.swift
//  WasmApp
//
//  Created by Mihael Isaev on 03.01.2021.
//

import Foundation

open class Pointer: StaticPointerable, ExpressibleByStringLiteral {
    public var pointer: Pointer { self }
    public let selector: String
    
    public required init() {
        selector = ""
    }
    
    required public init (stringLiteral value: String) {
        selector = value
    }
    
    required public init (_ selector: String) {
        self.selector = selector
    }
    
    /// Selects all elements
    public static var any: Self { .init("*") }
}

public protocol Pointerable: class {
    var pointer: Pointer { get }
}

public protocol StaticPointerable: Pointerable {
    init ()
}

extension StaticPointerable {
    public static var pointer: Pointer { Self.init().pointer }
    
    /// Selects all elements with class="intro"
    ///
    /// ```
    /// .intro
    /// ```
    public static func `class`(_ name: String) -> Pointer {
        .init(pointer.selector + "." + name)
    }
    
    /// Selects all elements with class="intro"
    ///
    /// ```
    /// .intro
    /// ```
    public static func `class`(_ class: Class) -> Pointer {
        Self.`class`(`class`.name)
    }

    /// Selects all elements with id="intro"
    ///
    /// ```
    /// #intro
    /// ```
    public static func id(_ id: String) -> Pointer {
        .init(pointer.selector + "#" + id)
    }
    
    /// Selects all elements with id="intro"
    ///
    /// ```
    /// #intro
    /// ```
    public static func id(_ id: Id) -> Pointer {
        Self.id(id.name)
    }

//    /// Selects all `<p>` elements
//    ///
//    /// ```
//    /// p
//    /// ```
//    public static func element(_ element: String) -> Pointer {
//        .init(pointer.selector + element)
//    }
    
    /// The :active CSS pseudo-class represents an element (such as a button)
    /// that is being activated by the user. When using a mouse, "activation" typically starts
    /// when the user presses down the primary mouse button.
    ///
    /// ```
    /// /* Selects any <a> that is being activated */
    /// a:active {
    ///     color: red;
    /// }
    /// The :active pseudo-class is commonly used on <a> and <button> elements.
    /// Other common targets of this pseudo-class include elements that contain an activated element,
    /// and form elements that are being activated through their associated <label>.
    ///
    /// Styles defined by the :active pseudo-class will be overridden
    /// by any subsequent link-related pseudo-class (:link, :hover, or :visited)
    /// that has at least equal specificity. To style links appropriately, put the :active rule
    /// after all other link-related rules, as defined by the LVHA-order: :link — :visited — :hover — :active.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:active)
    public static var active: Pointer { .init(pointer.selector + ":active") }
    
    /// The :any-link CSS pseudo-class selector represents an element
    /// that acts as the source anchor of a hyperlink, independent of whether it has been visited.
    /// In other words, it matches every `<a>`, `<area>`, or `<link>` element that has an href attribute.
    /// Thus, it matches all elements that match :link or :visited.
    ///
    /// ```
    /// /* Selects any element that would be matched by :link or :visited */
    /// :any-link {
    ///     color: green;
    /// }
    /// ```
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:any-link)
    public static var anyLink: Pointer { .init(pointer.selector + ":any-link") }

    /// Insert something after the content of each `<p>` element
    ///
    /// ```
    /// p::after
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/::after)
    public static var after: Pointer { .init(pointer.selector + "::after") }

    /// Insert something before the content of each `<p>` element
    ///
    /// ```
    /// p::before
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/::before)
    public static var before: Pointer { .init(pointer.selector + "::before") }

    /// Selects every checked `<input>` element
    ///
    /// ```
    /// input:checked
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:checked)
    public static var checked: Pointer { .init(pointer.selector + ":checked") }
    
    /// The :current CSS pseudo-class selector is a time-dimensional pseudo-class
    /// that represents the element, or an ancestor of the element, that is currently being displayed.
    /// For example in a video with captions which are being displayed by WebVTT.
    ///
    /// ```
    /// :current(p, span) {
    ///     background-color: yellow;
    /// }
    /// ```
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:current)
    public static func current(_ values: String...) -> Pointer { .init(pointer.selector + ":current\(values.joined(separator: ", "))") }
    
    /// The :blank CSS pseudo-class selects empty user input elements (e.g. `<input>` or `<textarea>`).
    ///
    /// ```
    /// textarea:blank {
    ///     border: 3px solid red;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:blank)
    public static var blank: Pointer { .init(pointer.selector + ":blank") }

    /// Selects the default `<input>` element
    ///
    /// ```
    /// input:default
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:default)
    public static var `default`: Pointer { .init(pointer.selector + ":default") }
    
    /// The :defined CSS pseudo-class represents any element that has been defined.
    /// This includes any standard element built in to the browser, and custom elements
    /// that have been successfully defined (i.e. with the CustomElementRegistry.define() method).
    ///
    /// ```
    /// /* Selects any defined element */
    /// :defined {
    ///     font-style: italic;
    /// }
    ///
    /// /* Selects any instance of a specific custom element */
    /// simple-custom:defined {
    ///     display: block;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:defined)
    public static var defined: Pointer { .init(pointer.selector + ":defined") }

    /// The :dir() CSS pseudo-class matches elements based on the directionality of the text contained in them.
    ///
    /// ```
    /// /* Selects any element with right-to-left text */
    /// :dir(rtl) {
    ///     background-color: red;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:dir)
    public static func dir(_ type: DirType) -> Pointer { .init(pointer.selector + ":dir(\(type.value)") }
    
    /// Selects every disabled `<input>` element
    ///
    /// ```
    /// input:disabled
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:disabled)
    public static var disabled: Pointer { .init(pointer.selector + ":disabled") }

    /// Selects every `<p>` element that has no children (including text nodes)
    ///
    /// ```
    /// p:empty
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:empty)
    public static var empty: Pointer { .init(pointer.selector + ":empty") }

    /// Selects every enabled `<input>` element
    ///
    /// ```
    /// input:enabled
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:enabled)
    public static var enabled: Pointer { .init(pointer.selector + ":enabled") }

    /// The :first CSS pseudo-class, used with the `@page at`-rule,
    /// represents the first page of a printed document.
    /// (See :first-child for general first element of a node.)
    ///
    /// ```
    /// /* Selects the first page when printing */
    /// @page :first {
    ///     margin-left: 50%;
    ///     margin-top: 50%;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:first)
    public static var first: Pointer { .init(pointer.selector + ":first") }
    
    /// Selects every `<p>` element that is the first child of its parent
    ///
    /// ```
    /// p:first-child
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:first-child)
    public static var firstChild: Pointer { .init(pointer.selector + ":first-child") }

    /// Selects the first letter of every `<p>` element
    ///
    /// ```
    /// p::first-letter
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/::first-letter)
    public static var firstLetter: Pointer { .init(pointer.selector + "::first-letter") }

    /// Selects the first line of every `<p>` element
    ///
    /// ```
    /// p::first-line
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/::first-line)
    public static var firstLine: Pointer { .init(pointer.selector + "::first-line") }

    /// Selects every `<p>` element that is the first `<p>` element of its parent
    ///
    /// ```
    /// p:first-of-type
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:first-of-type)
    public static var firstOfType: Pointer { .init(pointer.selector + ":first-of-type") }

    /// Selects the input element which has focus
    ///
    /// ```
    /// input:focus
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:focus)
    public static var focus: Pointer { .init(pointer.selector + ":focus") }
    
    /// Selects the input element which has focus
    ///
    /// ```
    /// .focus-visible-only:focus-visible {
    ///     outline: 4px dashed darkorange;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:focus-visible)
    public static var focusVisible: Pointer { .init(pointer.selector + ":focus-visible") }
    
    /// The :focus-within CSS pseudo-class represents an element
    /// that has received focus or contains an element that has received focus.
    /// In other words, it represents an element that is itself matched by the :focus pseudo-class
    /// or has a descendant that is matched by :focus.
    /// (This includes descendants in shadow trees.)
    ///
    /// ```
    /// /* Selects a <div> when one of its descendants is focused */
    /// div:focus-within {
    ///     background: cyan;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:focus-within)
    public static var focusWithin: Pointer { .init(pointer.selector + ":focus-within") }
    
    /// The :fullscreen CSS pseudo-class matches every element which is currently in full-screen mode.
    /// If multiple elements have been put into full-screen mode, this selects them all.
    ///
    /// ```
    /// #fs-toggle:not(:fullscreen) {
    ///     background-color: #afa;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:fullscreen)
    public static var fullscreen: Pointer { .init(pointer.selector + ":fullscreen") }
    
    /// The :future CSS pseudo-class selector is a time-dimensional pseudo-class
    /// that will match for any element which appears entirely after an element that matches :current.
    /// For example in a video with captions which are being displayed by WebVTT.
    ///
    /// ```
    /// :future(p, span) {
    ///     display: none;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:future)
    public static func future(_ types: String...) -> Pointer { .init(pointer.selector + ":future(\(types.joined(separator: ", ")))") }

    /// The :has() CSS pseudo-class represents an element if any of the selectors
    /// passed as parameters (relative to the :scope of the given element) match at least one element.
    ///
    /// ```
    /// /* The following selector matches only <a> elements that directly contain an <img> child: */
    /// a:has(> img)
    ///
    /// /* The following selector matches <h1> elements only if they have a <p> element directly following them: */
    /// h1:has(+ p)
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:has)
    public static func has(_ expression: String) -> Pointer { .init(pointer.selector + ":has(\(expression)") }
    
    /// Selects links on mouse over
    ///
    /// ```
    /// a:hover
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:hover)
    public static var hover: Pointer { .init(pointer.selector + ":hover") }

    /// Selects input elements with a value within a specified range
    ///
    /// ```
    /// input:in-range
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:in-range)
    public static var inRange: Pointer { .init(pointer.selector + ":in-range") }

    /// Selects input elements that are in an indeterminate state
    ///
    /// ```
    /// input:indeterminate
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:indeterminate)
    public static var indeterminate: Pointer { .init(pointer.selector + ":indeterminate") }

    /// Selects all input elements with an invalid value
    ///
    /// ```
    /// input:invalid
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:invalid)
    public static var invalid: Pointer { .init(pointer.selector + ":invalid") }

    /// Selects every `<p>` element with a lang attribute equal to "it" (Italian)
    ///
    /// ```
    /// p:lang(it)
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:lang)
    public static func lang(_ language: String) -> Pointer { .init(pointer.selector + ":lang(\(language))") }

    /// Selects every `<p>` element that is the last child of its parent
    ///
    /// ```
    /// p:last-child
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:last-child)
    public static var lastChild: Pointer { .init(pointer.selector + ":last-child") }

    /// Selects every `<p>` element that is the last `<p>` element of its parent
    ///
    /// ```
    /// p:last-of-type
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:last-of-type)
    public static var lastOfType: Pointer { .init(pointer.selector + ":last-of-type") }

    /// Selects all unvisited links
    ///
    /// ```
    /// a:link
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:link)
    public static var link: Pointer { .init(pointer.selector + ":link") }
    
    /// The :local-link CSS pseudo-class represents an link to the same document.
    /// Therefore an element that is the source anchor of a hyperlink
    /// whose target’s absolute URL matches the element’s own document URL.
    ///
    /// ```
    /// a:local-link
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:local-link)
    public static var localLink: Pointer { .init(pointer.selector + ":local-link") }

    /// Selects every element that is not a `<p>` element
    ///
    /// ```
    /// :not(p)
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:not)
    public static func not(_ selector: String) -> Pointer { .init(pointer.selector + ":not(\(selector))") }

    /// Selects every `<p>` element that is the second child of its parent
    ///
    /// ```
    /// /* Selects the second <li> element in a list */
    /// li:nth-child(2) {
    ///     color: lime;
    /// }
    ///
    /// /* Selects every fourth element among any group of siblings */
    /// :nth-child(4n) {
    ///     color: lime;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:nth-child)
    public static func nthChild(_ expression: String) -> Pointer { .init(pointer.selector + ":nth-child(\(expression))") }
    
    /// Selects every `<p>` element that is the second child of its parent
    ///
    /// ```
    /// /* Selects every odd column in a table */
    /// :nth-col(odd) {
    ///     background-color: pink;
    /// }
    ///
    /// /* Odd columns */
    /// :nth-col(2n+1) {
    ///     background-color: pink;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:nth-col)
    public static func nthCol(_ expression: String) -> Pointer { .init(pointer.selector + ":nth-col(\(expression))") }
    
    /// Selects every `<p>` element that is the second child of its parent, counting from the last child
    ///
    /// ```
    /// p:nth-last-child(2)
    ///
    /// /* Selects every fourth element among any group of siblings, counting backwards from the last one */
    /// :nth-last-child(4n) {
    ///     color: lime;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:nth-last-child)
    public static func nthLastChild(_ expression: String) -> Pointer { .init(pointer.selector + ":nth-last-child(\(expression))") }
    
    /// The :nth-last-col() CSS pseudo-class is designed for tables and grids.
    /// It accepts the An+B notation such as used with the :nth-child selector,
    /// using this to target every nth column before it, therefore counting back
    /// from the end of the set of columns. The values odd and even are also valid.
    ///
    /// ```
    /// /* Selects every odd column in a table */
    /// :nth-last-col(odd) {
    ///     background-color: pink;
    /// }
    ///
    /// /* Odd columns starting with the final column of the table */
    /// :nth-last-col(2n+1) {
    ///     background-color: pink;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:nth-last-col)
    public static func nthLastCol(_ expression: String) -> Pointer { .init(pointer.selector + ":nth-last-col(\(expression))") }

    /// Selects every `<p>` element that is the second `<p>` element of its parent, counting from the last child
    ///
    /// ```
    /// /* Selects every fourth <p> element among any group of siblings, counting backwards from the last one */
    /// p:nth-last-of-type(4n) {
    ///     color: lime;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:nth-last-of-type)
    public static func nthLastOfType(_ expression: String) -> Pointer { .init(pointer.selector + ":nth-last-of-type(\(expression))") }
    
    /// Selects every `<p>` element that is the second `<p>` element of its parent
    ///
    /// ```
    /// /* Selects every fourth <p> element among any group of siblings */
    /// p:nth-of-type(4n) {
    ///     color: lime;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:nth-of-type)
    public static func nthOfType(_ expression: String) -> Pointer { .init(pointer.selector + ":nth-of-type(\(expression))") }

    /// Selects every `<p>` element that is the only `<p>` element of its parent
    ///
    /// ```
    /// p:only-of-type
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:only-of-type)
    public static var onlyOfType: Pointer { .init(pointer.selector + ":only-of-type") }

    /// Selects every `<p>` element that is the only child of its parent
    ///
    /// ```
    /// p:only-child
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:only-child)
    public static var onlyChild: Pointer { .init(pointer.selector + ":only-child") }

    /// Selects input elements with no "required" attribute
    ///
    /// ```
    /// input:optional
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:optional)
    public static var optional: Pointer { .init(pointer.selector + ":optional") }

    /// Selects input elements with a value outside a specified range
    ///
    /// ```
    /// input:out-of-range
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:out-of-range)
    public static var outOfRange: Pointer { .init(pointer.selector + ":out-of-range") }
    
    /// The :past CSS pseudo-class selector is a time-dimensional pseudo-class
    /// that will match for any element which appears entirely before an element that matches :current.
    /// For example in a video with captions which are being displayed by WebVTT.
    ///
    /// ```
    /// :past(p, span) {
    ///     display: none;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:past)
    public static func past(_ types: String...) -> Pointer { .init(pointer.selector + ":past(\(types.joined(separator: ", "))") }
    
    /// The :paused CSS pseudo-class selector is a resource state pseudo-class
    /// that will match an audio, video, or similar resource
    /// that is capable of being “played” or “paused”, when that element is “paused”.
    ///
    /// ```
    /// :paused
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:paused)
    public static var paused: Pointer { .init(pointer.selector + ":paused") }
    
    /// The :playing CSS pseudo-class selector is a resource state pseudo-class
    /// that will match an audio, video, or similar resource that is capable
    /// of being “played” or “paused”, when that element is “playing”.
    ///
    /// ```
    /// :playing
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:playing)
    public static var playing: Pointer { .init(pointer.selector + ":playing") }
    
    /// The :placeholder-shown CSS pseudo-class represents
    /// any `<input>` or `<textarea>` element that is currently displaying placeholder text.
    ///
    /// ```
    /// /* Selects any element with an active placeholder */
    /// :placeholder-shown {
    ///     border: 2px solid silver;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:placeholder-shown)
    public static var placeholderShown: Pointer { .init(pointer.selector + ":placeholder-shown") }

    /// Selects input elements with the "placeholder" attribute specified
    ///
    /// ```
    /// input::placeholder
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/::placeholder)
    public static var placeholder: Pointer { .init(pointer.selector + "::placeholder") }

    /// Selects input elements with the "readonly" attribute specified
    ///
    /// ```
    /// input:read-only
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:read-only)
    public static var readOnly: Pointer { .init(pointer.selector + ":read-only") }

    /// Selects input elements with the "readonly" attribute NOT specified
    ///
    /// ```
    /// input:read-write
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:read-write)
    public static var readWrite: Pointer { .init(pointer.selector + ":read-write") }

    /// Selects input elements with the "required" attribute specified
    ///
    /// ```
    /// input:required
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:required)
    public static var required: Pointer { .init(pointer.selector + ":required") }

    /// Selects the document's root element
    ///
    /// ```
    /// :root
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:root)
    public static var root: Pointer { .init(pointer.selector + ":root") }
    
    /// The :scope CSS pseudo-class represents elements that are a reference point for selectors to match against.
    ///
    /// ```
    /// :scope
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:scope)
    public static var scope: Pointer { .init(pointer.selector + ":scope") }

    /// Selects the portion of an element that is selected by a user
    ///
    /// ```
    /// ::selection
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/::selection)
    public static var selection: Pointer { .init(pointer.selector + "::selection") }

    /// Selects the current active #news element (clicked on a URL containing that anchor name)
    ///
    /// ```
    /// #news:target
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:target)
    public static var target: Pointer { .init(pointer.selector + ":target") }
    
    /// The :target-within CSS pseudo-class represents an element
    /// that is a target element or contains an element that is a target.
    /// A target element is a unique element with an id matching the URL's fragment.
    /// In other words, it represents an element that is itself matched by the :target pseudo-class
    /// or has a descendant that is matched by :target.
    /// (This includes descendants in shadow trees.)
    ///
    /// ```
    /// div:target-within
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:target-within)
    public static var targetWithin: Pointer { .init(pointer.selector + ":target-within") }

    /// The :user-invalid aka :-moz-ui-invalid CSS pseudo-class represents any validated form element
    /// whose value isn't valid based on their validation constraints, after the user has interacted with it.
    ///
    /// ```
    /// input:user-invalid
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:user-invalid)
    public static var userInvalid: Pointer { .init(pointer.selector + ":user-invalid") }
    
    /// The :-moz-ui-invalid aka :user-invalid CSS pseudo-class represents any validated form element
    /// whose value isn't valid based on their validation constraints, after the user has interacted with it.
    ///
    /// ```
    /// input:-moz-ui-invalid
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:user-invalid)
    public static var mozUiinvalid: Pointer { .init(pointer.selector + ":-moz-ui-invalid") }
    
    /// Selects all input elements with a valid value
    ///
    /// ```
    /// input:valid
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:valid)
    public static var valid: Pointer { .init(pointer.selector + ":valid") }

    /// Selects all visited links
    ///
    /// ```
    /// a:visited
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:visited)
    public static var visited: Pointer { .init(pointer.selector + ":visited") }
    
    /// The :picture-in-picture CSS pseudo-class matches the element which is currently in picture-in-picture mode.
    ///
    /// ```
    /// :picture-in-picture {
    ///     box-shadow: 0 0 0 5px red;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:picture-in-picture)
    public static var pictureInPicture: Pointer { .init(pointer.selector + ":picture-in-picture") }
    
    // MARK: Other
    
    ///
    ///
    /// ```
    ///
    /// ```
    /// (No link)
    public static var webkitSliderThumb: Pointer { .init(pointer.selector + "::-webkit-slider-thumb") }
    
    /// The ::-moz-progress-bar CSS pseudo-element is a Mozilla extension
    /// that represents the progress bar inside a `<progress>` element.
    /// (The bar represents the amount of progress that has been made.)
    ///
    /// ```
    /// ::-moz-progress-bar {
    ///     background-color: red;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/::-moz-progress-bar)
    public static var mozProgressBar: Pointer { .init(pointer.selector + "::-moz-progress-bar") }
    
    /// The ::-moz-range-progress CSS pseudo-element is a Mozilla extension
    /// that represents the lower portion of the track (i.e., groove) in
    /// which the indicator slides in an `<input>` of type="range".
    /// This portion corresponds to values lower than the value currently selected by the thumb (i.e., virtual knob).
    ///
    /// ```
    /// input[type=range]::-moz-range-progress {
    ///     background-color: green;
    ///     height: 1em;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/::-moz-range-progress)
    public static var mozRangeProgress: Pointer { .init(pointer.selector + "::-moz-range-progress") }
    
    /// The ::-moz-range-thumb CSS pseudo-element is a Mozilla extension
    /// that represents the thumb (i.e., virtual knob) of an `<input>` of type="range".
    /// The user can move the thumb along the input's track to alter its numerical value.
    ///
    /// ```
    /// input[type=range]::-moz-range-thumb {
    ///     background-color: green;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/::-moz-range-thumb)
    public static var mozRangeThumb: Pointer { .init(pointer.selector + "::-moz-range-thumb") }
    
    /// The ::-moz-range-track CSS pseudo-element is a Mozilla extension
    /// that represents the track (i.e., groove) in which the indicator slides in an `<input>` of type="range".
    ///
    /// ```
    /// input[type=range]::-moz-range-track {
    ///     background-color: green;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/::-moz-range-track)
    public static var mozRangeTrack: Pointer { .init(pointer.selector + "::-moz-range-track") }
    
    /// The ::-webkit-progress-bar CSS pseudo-element represents the entire bar of a `<progress>` element.
    /// Normally it's only visible as the unfilled portion of the bar,
    /// since by default it's rendered below the ::-webkit-progress-value pseudo-element.
    /// It is a child of the ::-webkit-progress-inner-element pseudo-element
    /// and the parent of the ::-webkit-progress-value pseudo-element.
    ///
    /// ```
    /// ::-webkit-progress-bar {
    ///     background-color: orange;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/::-webkit-progress-bar)
    public static var webkitProgressBar: Pointer { .init(pointer.selector + "::-webkit-progress-bar") }
    
    /// The ::-webkit-progress-value CSS pseudo-element represents the filled-in portion
    /// of the bar of a `<progress>` element. It is a child of the ::-webkit-progress-bar pseudo-element.
    ///
    /// Note: In order to let ::-webkit-progress-value take effect, -webkit-appearance needs to be set to none on the `<progress>` element.
    ///
    /// ```
    /// progress {
    ///     -webkit-appearance: none;
    /// }
    ///
    /// ::-webkit-progress-value {
    ///     background-color: orange;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/::-webkit-progress-value)
    public static var webkitProgressValue: Pointer { .init(pointer.selector + "::-webkit-progress-value") }
    
    /// The ::-webkit-slider-runnable-track CSS pseudo-element
    /// represents the "track" (the groove in which the indicator slides) of an `<input type="range">`.
    ///
    /// ```
    /// ::-webkit-slider-runnable-track
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/::-webkit-slider-runnable-track)
    public static var webkitSliderRunnableTrack: Pointer { .init(pointer.selector + "::-webkit-slider-runnable-track") }
    
    /// The ::backdrop CSS pseudo-element is a box the size of the viewport
    /// which is rendered immediately beneath any element being presented in full-screen mode.
    /// This includes both elements which have been placed in full-screen mode using the Fullscreen API and `<dialog>` elements.
    ///
    /// ```
    /// video::backdrop {
    ///     background-color: #448;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/::backdrop)
    public static var backdrop: Pointer { .init(pointer.selector + "::backdrop") }
    
    /// The ::cue CSS pseudo-element matches WebVTT cues within a selected element.
    /// This can be used to style captions and other cues in media with VTT tracks.
    ///
    /// ```
    /// ::cue {
    ///     color: yellow;
    ///     font-weight: bold;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/::cue)
    public static var cue: Pointer { .init(pointer.selector + "::cue") }
    
    /// The ::cue-region CSS pseudo-element matches WebVTT cues within a selected element.
    /// This can be used to style captions and other cues in media with VTT tracks.
    ///
    /// ```
    /// ::cue-region {
    ///     color: yellow;
    ///     font-weight: bold;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/::cue-region)
    public static var cueRegion: Pointer { .init(pointer.selector + "::cue-region") }
    
    /// The ::grammar-error CSS pseudo-element represents a text segment which the user agent has flagged as grammatically incorrect.
    ///
    /// ```
    /// ::grammar-error  {
    ///     text-decoration: underline red;
    ///     color: red;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/::grammar-error)
    public static var grammarError: Pointer { .init(pointer.selector + "::grammar-error") }
    
    /// The ::marker CSS pseudo-element selects the marker box of a list item,
    /// which typically contains a bullet or number. It works on any element
    /// or pseudo-element set to display: list-item, such as the `<li>` and `<summary>` elements.
    ///
    /// ```
    /// ::marker {
    ///     color: blue;
    ///     font-size: 1.2em;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/::marker)
    public static var marker: Pointer { .init(pointer.selector + "::marker") }
    
    /// The ::part CSS pseudo-element represents any element within a shadow tree that has a matching part attribute.
    ///
    /// ```
    /// custom-element::part(foo) {
    ///     /* Styles to apply to the `foo` part */
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/::part)
    public static func part(_ expression: String) -> Pointer { .init(pointer.selector + "::part(\(expression)") }
    
    /// The ::slotted() CSS pseudo-element represents any element
    /// that has been placed into a slot inside an HTML template
    /// (see Using templates and slots for more information).
    ///
    /// This only works when used inside CSS placed within a shadow DOM.
    /// Note also that this selector won't select a text node placed into a slot; it only targets actual elements.
    ///
    /// ```
    /// /* Selects any element placed inside a slot */
    /// ::slotted(*) {
    ///     font-weight: bold;
    /// }
    ///
    /// /* Selects any <span> placed inside a slot */
    /// ::slotted(span) {
    ///     font-weight: bold;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/::slotted)
    public static func slotted() -> Pointer { .init(pointer.selector + "::slotted") }
    
    /// The ::spelling-error CSS pseudo-element represents a text segment
    /// which the user agent has flagged as incorrectly spelled.
    ///
    /// ```
    /// ::spelling-error  {
    ///     text-decoration: wavy red;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/::spelling-error)
    public static var spellingError: Pointer { .init(pointer.selector + "::spelling-error") }
}

extension Pointerable {
    /// Selects all elements with `class="intro"`
    ///
    /// ```
    /// .intro
    /// ```
    public func `class`(_ name: String) -> Pointer {
        .init(pointer.selector + "." + name)
    }
    
    /// Selects all elements with `class="intro"`
    ///
    /// ```
    /// .intro
    /// ```
    public func `class`(_ class: Class) -> Pointer {
        self.class(`class`.name)
    }

    /// Selects all elements with id="intro"
    ///
    /// ```
    /// #intro
    /// ```
    public func id(_ id: String) -> Pointer {
        .init(pointer.selector + "#" + id)
    }
    
    /// Selects all elements with id="intro"
    ///
    /// ```
    /// #intro
    /// ```
    public func id(_ id: Id) -> Pointer {
        self.id(id.name)
    }

    /// Selects all `<p>` elements
    ///
    /// ```
    /// p
    /// ```
    public func element(_ element: String) -> Pointer {
        .init(pointer.selector + element)
    }

//    /// Selects all `<div>` elements and all `<p>` elements
//    ///
//    /// ```
//    /// div, p
//    /// ```
//    public func several(_ values: Pointer...) -> Pointer {
//        several(values)
//    }
//
//    /// Selects all `<div>` elements and all `<p>` elements
//    ///
//    /// ```
//    /// div, p
//    /// ```
//    public func several(_ values: [Pointer]) -> Pointer {
//        .init(values.map { $0.value }.joined(separator: ", "))
//    }

//    /// Selects all `<p>` elements with class="intro"
//    ///
//    /// ```
//    /// p.intro
//    /// ```
//    public func both(_ values: Pointer...) -> Self {
//        both(values)
//    }
//
//    /// Selects all `<p>` elements with class="intro"
//    ///
//    /// ```
//    /// p.intro
//    /// ```
//    public func both(_ values: [Pointer]) -> Self {
//        .init(values.map { $0.value }.joined(separator: ""))
//    }

    /// Selects all `<p>` elements inside `<div>` elements
    ///
    /// ```
    /// .name1 .name2
    /// ```
    public func inside(_ values: Pointerable...) -> Pointer {
        inside(values)
    }

    /// Selects all `<p>` elements inside `<div>` elements
    ///
    /// ```
    /// .name1 .name2
    /// ```
    public func inside(_ values: [Pointerable]) -> Pointer {
        .init(values.map { $0.pointer.selector }.joined(separator: " "))
    }

    /// Selects all `<p>` elements where the parent is a `<div>` element
    ///
    /// ```
    /// div >` p
    /// ```
    public func parent(_ values: Pointerable...) -> Pointer {
        parent(values)
    }

    /// Selects all `<p>` elements where the parent is a `<div>` element
    ///
    /// ```
    /// div >` p
    /// ```
    public func parent(_ values: [Pointerable]) -> Pointer {
        .init(values.map { $0.pointer.selector }.joined(separator: " >` "))
    }

    /// Selects all `<p>` elements that are placed immediately after `<div>` elements
    ///
    /// ```
    /// div + p
    /// ```
    public func immediatedlyAfter(_ values: Pointerable...) -> Pointer {
        immediatedlyAfter(values)
    }

    /// Selects all `<p>` elements that are placed immediately after `<div>` elements
    ///
    /// ```
    /// div + p
    /// ```
    public func immediatedlyAfter(_ values: [Pointerable]) -> Pointer {
        .init(values.map { $0.pointer.selector }.joined(separator: " + "))
    }

    /// Selects every `<ul>` element that are preceded by a `<p>` element
    ///
    /// ```
    /// p ~ ul
    /// ```
    public func precededBy(_ values: Pointerable...) -> Pointer {
        precededBy(values)
    }

    /// Selects every `<ul>` element that are preceded by a `<p>` element
    ///
    /// ```
    /// p ~ ul
    /// ```
    public func precededBy(_ values: [Pointerable]) -> Pointer {
        .init(values.map { $0.pointer.selector }.joined(separator: " ~ "))
    }

    /// Selects all elements with a target attribute
    ///
    /// ```
    /// [target]
    /// ```
    public func byAttribute(_ attributeName: String) -> Pointer {
        .init("[\(attributeName)]")
    }

    /// Selects all elements with target="_blank"
    ///
    /// ```
    /// [target=_blank]
    /// ```
    public func byAttribute(_ attributeName: String, _ value: String) -> Pointer {
        .init("[\(attributeName)=\(value)]")
    }

    /// Selects all elements with a title attribute containing the word "flower"
    ///
    /// ```
    /// [title~=flower]
    /// ```
    public func byAttribute(_ attributeName: String, contains value: String) -> Pointer {
        .init("[\(attributeName)~=\(value)]")
    }

    /// Selects all elements with a lang attribute value starting with "en"
    ///
    /// ```
    /// [lang|=en]
    /// ```
    public func byAttribute(_ attributeName: String, startingWith value: String) -> Pointer {
        .init("[\(attributeName)|=\(value)]")
    }

    /// Selects every `<a>` element whose href attribute value begins with "https"
    ///
    /// ```
    /// a[href^="https"]
    /// ```
    public func byAttribute(_ attributeName: String, beginsWith value: String) -> Pointer {
        .init("[\(attributeName)^=\"\(value)\"]")
    }

    /// Selects every `<a>` element whose href attribute value ends with ".pdf"
    ///
    /// ```
    /// a[href$=".pdf"]
    /// ```
    public func byAttribute(_ attributeName: String, endsWith value: String) -> Pointer {
        .init("[\(attributeName)$=\"\(value)\"]")
    }

    /// Selects every `<a>` element whose href attribute value contains the substring "w3schools"
    ///
    /// ```
    /// a[href*="w3schools"]
    /// ```
    public func byAttribute(_ attributeName: String, containsSubstring value: String) -> Pointer {
        .init("[\(attributeName)*=\"\(value)\"]")
    }
    
    /// The :active CSS pseudo-class represents an element (such as a button)
    /// that is being activated by the user. When using a mouse, "activation" typically starts
    /// when the user presses down the primary mouse button.
    ///
    /// ```
    /// /* Selects any <a> that is being activated */
    /// a:active {
    ///     color: red;
    /// }
    /// The :active pseudo-class is commonly used on <a> and <button> elements.
    /// Other common targets of this pseudo-class include elements that contain an activated element,
    /// and form elements that are being activated through their associated <label>.
    ///
    /// Styles defined by the :active pseudo-class will be overridden
    /// by any subsequent link-related pseudo-class (:link, :hover, or :visited)
    /// that has at least equal specificity. To style links appropriately, put the :active rule
    /// after all other link-related rules, as defined by the LVHA-order: :link — :visited — :hover — :active.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:active)
    public var active: Pointer { .init(pointer.selector + ":active") }
    
    /// The :any-link CSS pseudo-class selector represents an element
    /// that acts as the source anchor of a hyperlink, independent of whether it has been visited.
    /// In other words, it matches every `<a>`, `<area>`, or `<link>` element that has an href attribute.
    /// Thus, it matches all elements that match :link or :visited.
    ///
    /// ```
    /// /* Selects any element that would be matched by :link or :visited */
    /// :any-link {
    ///     color: green;
    /// }
    /// ```
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:any-link)
    public var anyLink: Pointer { .init(pointer.selector + ":any-link") }

    /// Insert something after the content of each `<p>` element
    ///
    /// ```
    /// p::after
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/::after)
    public var after: Pointer { .init(pointer.selector + "::after") }

    /// Insert something before the content of each `<p>` element
    ///
    /// ```
    /// p::before
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/::before)
    public var before: Pointer { .init(pointer.selector + "::before") }

    /// Selects every checked `<input>` element
    ///
    /// ```
    /// input:checked
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:checked)
    public var checked: Pointer { .init(pointer.selector + ":checked") }
    
    /// The :current CSS pseudo-class selector is a time-dimensional pseudo-class
    /// that represents the element, or an ancestor of the element, that is currently being displayed.
    /// For example in a video with captions which are being displayed by WebVTT.
    ///
    /// ```
    /// :current(p, span) {
    ///     background-color: yellow;
    /// }
    /// ```
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:current)
    public func current(_ values: String...) -> Pointer { .init(pointer.selector + ":current\(values.joined(separator: ", "))") }
    
    /// The :blank CSS pseudo-class selects empty user input elements (e.g. `<input>` or `<textarea>`).
    ///
    /// ```
    /// textarea:blank {
    ///     border: 3px solid red;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:blank)
    public var blank: Pointer { .init(pointer.selector + ":blank") }

    /// Selects the default `<input>` element
    ///
    /// ```
    /// input:default
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:default)
    public var `default`: Pointer { .init(pointer.selector + ":default") }
    
    /// The :defined CSS pseudo-class represents any element that has been defined.
    /// This includes any standard element built in to the browser, and custom elements
    /// that have been successfully defined (i.e. with the CustomElementRegistry.define() method).
    ///
    /// ```
    /// /* Selects any defined element */
    /// :defined {
    ///     font-style: italic;
    /// }
    ///
    /// /* Selects any instance of a specific custom element */
    /// simple-custom:defined {
    ///     display: block;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:defined)
    public var defined: Pointer { .init(pointer.selector + ":defined") }
    
    /// The :dir() CSS pseudo-class matches elements based on the directionality of the text contained in them.
    ///
    /// ```
    /// /* Selects any element with right-to-left text */
    /// :dir(rtl) {
    ///     background-color: red;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:dir)
    public func dir(_ type: DirType) -> Pointer { .init(pointer.selector + ":dir(\(type.value)") }

    /// Selects every disabled `<input>` element
    ///
    /// ```
    /// input:disabled
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:disabled)
    public var disabled: Pointer { .init(pointer.selector + ":disabled") }

    /// Selects every `<p>` element that has no children (including text nodes)
    ///
    /// ```
    /// p:empty
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:empty)
    public var empty: Pointer { .init(pointer.selector + ":empty") }

    /// Selects every enabled `<input>` element
    ///
    /// ```
    /// input:enabled
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:enabled)
    public var enabled: Pointer { .init(pointer.selector + ":enabled") }
    
    /// The :first CSS pseudo-class, used with the `@page at`-rule,
    /// represents the first page of a printed document.
    /// (See :first-child for general first element of a node.)
    ///
    /// ```
    /// /* Selects the first page when printing */
    /// @page :first {
    ///     margin-left: 50%;
    ///     margin-top: 50%;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:first)
    public var first: Pointer { .init(pointer.selector + ":first") }

    /// Selects every `<p>` element that is the first child of its parent
    ///
    /// ```
    /// p:first-child
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:first-child)
    public var firstChild: Pointer { .init(pointer.selector + ":first-child") }

    /// Selects the first letter of every `<p>` element
    ///
    /// ```
    /// p::first-letter
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/::first-letter)
    public var firstLetter: Pointer { .init(pointer.selector + "::first-letter") }

    /// Selects the first line of every `<p>` element
    ///
    /// ```
    /// p::first-line
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/::first-line)
    public var firstLine: Pointer { .init(pointer.selector + "::first-line") }

    /// Selects every `<p>` element that is the first `<p>` element of its parent
    ///
    /// ```
    /// p:first-of-type
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:first-of-type)
    public var firstOfType: Pointer { .init(pointer.selector + ":first-of-type") }

    /// Selects the input element which has focus
    ///
    /// ```
    /// input:focus
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:focus)
    public var focus: Pointer { .init(pointer.selector + ":focus") }
    
    /// Selects the input element which has focus
    ///
    /// ```
    /// .focus-visible-only:focus-visible {
    ///     outline: 4px dashed darkorange;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:focus-visible)
    public var focusVisible: Pointer { .init(pointer.selector + ":focus-visible") }
    
    /// The :focus-within CSS pseudo-class represents an element
    /// that has received focus or contains an element that has received focus.
    /// In other words, it represents an element that is itself matched by the :focus pseudo-class
    /// or has a descendant that is matched by :focus.
    /// (This includes descendants in shadow trees.)
    ///
    /// ```
    /// /* Selects a <div> when one of its descendants is focused */
    /// div:focus-within {
    ///     background: cyan;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:focus-within)
    public var focusWithin: Pointer { .init(pointer.selector + ":focus-within") }
    
    /// The :fullscreen CSS pseudo-class matches every element which is currently in full-screen mode.
    /// If multiple elements have been put into full-screen mode, this selects them all.
    ///
    /// ```
    /// #fs-toggle:not(:fullscreen) {
    ///     background-color: #afa;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:fullscreen)
    public var fullscreen: Pointer { .init(pointer.selector + ":fullscreen") }
    
    /// The :future CSS pseudo-class selector is a time-dimensional pseudo-class
    /// that will match for any element which appears entirely after an element that matches :current.
    /// For example in a video with captions which are being displayed by WebVTT.
    ///
    /// ```
    /// :future(p, span) {
    ///     display: none;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:future)
    public func future(_ types: String...) -> Pointer { .init(pointer.selector + ":future(\(types.joined(separator: ", ")))") }
    
    /// The :has() CSS pseudo-class represents an element if any of the selectors
    /// passed as parameters (relative to the :scope of the given element) match at least one element.
    ///
    /// ```
    /// /* The following selector matches only <a> elements that directly contain an <img> child: */
    /// a:has(> img)
    ///
    /// /* The following selector matches <h1> elements only if they have a <p> element directly following them: */
    /// h1:has(+ p)
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:has)
    public func has(_ expression: String) -> Pointer { .init(pointer.selector + ":has(\(expression)") }

    /// Selects links on mouse over
    ///
    /// ```
    /// a:hover
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:hover)
    public var hover: Pointer { .init(pointer.selector + ":hover") }

    /// Selects input elements with a value within a specified range
    ///
    /// ```
    /// input:in-range
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:in-range)
    public var inRange: Pointer { .init(pointer.selector + ":in-range") }

    /// Selects input elements that are in an indeterminate state
    ///
    /// ```
    /// input:indeterminate
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:indeterminate)
    public var indeterminate: Pointer { .init(pointer.selector + ":indeterminate") }

    /// Selects all input elements with an invalid value
    ///
    /// ```
    /// input:invalid
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:invalid)
    public var invalid: Pointer { .init(pointer.selector + ":invalid") }

    /// Selects every `<p>` element with a lang attribute equal to "it" (Italian)
    ///
    /// ```
    /// p:lang(it)
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:lang)
    public func lang(_ language: String) -> Pointer { .init(pointer.selector + ":lang(\(language))") }

    /// Selects every `<p>` element that is the last child of its parent
    ///
    /// ```
    /// p:last-child
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:last-child)
    public var lastChild: Pointer { .init(pointer.selector + ":last-child") }

    /// Selects every `<p>` element that is the last `<p>` element of its parent
    ///
    /// ```
    /// p:last-of-type
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:last-of-type)
    public var lastOfType: Pointer { .init(pointer.selector + ":last-of-type") }

    /// Selects all unvisited links
    ///
    /// ```
    /// a:link
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:link)
    public var link: Pointer { .init(pointer.selector + ":link") }
    
    /// The :local-link CSS pseudo-class represents an link to the same document.
    /// Therefore an element that is the source anchor of a hyperlink
    /// whose target’s absolute URL matches the element’s own document URL.
    ///
    /// ```
    /// a:local-link
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:local-link)
    public var localLink: Pointer { .init(pointer.selector + ":local-link") }

    /// Selects every element that is not a `<p>` element
    ///
    /// ```
    /// :not(p)
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:not)
    public func not(_ selector: String) -> Pointer { .init(pointer.selector + ":not(\(selector))") }
    
    /// Selects every `<p>` element that is the second child of its parent
    ///
    /// ```
    /// /* Selects the second <li> element in a list */
    /// li:nth-child(2) {
    ///     color: lime;
    /// }
    ///
    /// /* Selects every fourth element among any group of siblings */
    /// :nth-child(4n) {
    ///     color: lime;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:nth-child)
    public func nthChild(_ expression: String) -> Pointer { .init(pointer.selector + ":nth-child(\(expression))") }
    
    /// Selects every `<p>` element that is the second child of its parent
    ///
    /// ```
    /// /* Selects every odd column in a table */
    /// :nth-col(odd) {
    ///     background-color: pink;
    /// }
    ///
    /// /* Odd columns */
    /// :nth-col(2n+1) {
    ///     background-color: pink;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:nth-col)
    public func nthCol(_ expression: String) -> Pointer { .init(pointer.selector + ":nth-col(\(expression))") }

    /// Selects every `<p>` element that is the second child of its parent, counting from the last child
    ///
    /// ```
    /// p:nth-last-child(2)
    ///
    /// /* Selects every fourth element among any group of siblings, counting backwards from the last one */
    /// :nth-last-child(4n) {
    ///     color: lime;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:nth-last-child)
    public func nthLastChild(_ expression: String) -> Pointer { .init(pointer.selector + ":nth-last-child(\(expression))") }
    
    /// The :nth-last-col() CSS pseudo-class is designed for tables and grids.
    /// It accepts the An+B notation such as used with the :nth-child selector,
    /// using this to target every nth column before it, therefore counting back
    /// from the end of the set of columns. The values odd and even are also valid.
    ///
    /// ```
    /// /* Selects every odd column in a table */
    /// :nth-last-col(odd) {
    ///     background-color: pink;
    /// }
    ///
    /// /* Odd columns starting with the final column of the table */
    /// :nth-last-col(2n+1) {
    ///     background-color: pink;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:nth-last-col)
    public func nthLastCol(_ expression: String) -> Pointer { .init(pointer.selector + ":nth-last-col(\(expression))") }
    
    /// Selects every `<p>` element that is the second `<p>` element of its parent, counting from the last child
    ///
    /// ```
    /// /* Selects every fourth <p> element among any group of siblings, counting backwards from the last one */
    /// p:nth-last-of-type(4n) {
    ///     color: lime;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:nth-last-of-type)
    public func nthLastOfType(_ expression: String) -> Pointer { .init(pointer.selector + ":nth-last-of-type(\(expression))") }

    /// Selects every `<p>` element that is the second `<p>` element of its parent
    ///
    /// ```
    /// /* Selects every fourth <p> element among any group of siblings */
    /// p:nth-of-type(4n) {
    ///     color: lime;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:nth-of-type)
    public func nthOfType(_ expression: String) -> Pointer { .init(pointer.selector + ":nth-of-type(\(expression))") }

    /// Selects every `<p>` element that is the only `<p>` element of its parent
    ///
    /// ```
    /// p:only-of-type
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:only-of-type)
    public var onlyOfType: Pointer { .init(pointer.selector + ":only-of-type") }

    /// Selects every `<p>` element that is the only child of its parent
    ///
    /// ```
    /// p:only-child
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:only-child)
    public var onlyChild: Pointer { .init(pointer.selector + ":only-child") }

    /// Selects input elements with no "required" attribute
    ///
    /// ```
    /// input:optional
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:optional)
    public var optional: Pointer { .init(pointer.selector + ":optional") }

    /// Selects input elements with a value outside a specified range
    ///
    /// ```
    /// input:out-of-range
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:out-of-range)
    public var outOfRange: Pointer { .init(pointer.selector + ":out-of-range") }
    
    /// The :past CSS pseudo-class selector is a time-dimensional pseudo-class
    /// that will match for any element which appears entirely before an element that matches :current.
    /// For example in a video with captions which are being displayed by WebVTT.
    ///
    /// ```
    /// :past(p, span) {
    ///     display: none;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:past)
    public func past(_ types: String...) -> Pointer { .init(pointer.selector + ":past(\(types.joined(separator: ", "))") }

    /// The :paused CSS pseudo-class selector is a resource state pseudo-class
    /// that will match an audio, video, or similar resource
    /// that is capable of being “played” or “paused”, when that element is “paused”.
    ///
    /// ```
    /// :paused
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:paused)
    public var paused: Pointer { .init(pointer.selector + ":paused") }
    
    /// The :playing CSS pseudo-class selector is a resource state pseudo-class
    /// that will match an audio, video, or similar resource that is capable
    /// of being “played” or “paused”, when that element is “playing”.
    ///
    /// ```
    /// :playing
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:playing)
    public var playing: Pointer { .init(pointer.selector + ":playing") }
    
    /// The :placeholder-shown CSS pseudo-class represents
    /// any `<input>` or `<textarea>` element that is currently displaying placeholder text.
    ///
    /// ```
    /// /* Selects any element with an active placeholder */
    /// :placeholder-shown {
    ///     border: 2px solid silver;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:placeholder-shown)
    public var placeholderShown: Pointer { .init(pointer.selector + ":placeholder-shown") }
    
    /// Selects input elements with the "placeholder" attribute specified
    ///
    /// ```
    /// input::placeholder
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/::placeholder)
    public var placeholder: Pointer { .init(pointer.selector + "::placeholder") }

    /// Selects input elements with the "readonly" attribute specified
    ///
    /// ```
    /// input:read-only
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:read-only)
    public var readOnly: Pointer { .init(pointer.selector + ":read-only") }

    /// Selects input elements with the "readonly" attribute NOT specified
    ///
    /// ```
    /// input:read-write
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:read-write)
    public var readWrite: Pointer { .init(pointer.selector + ":read-write") }

    /// Selects input elements with the "required" attribute specified
    ///
    /// ```
    /// input:required
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:required)
    public var required: Pointer { .init(pointer.selector + ":required") }

    /// Selects the document's root element
    ///
    /// ```
    /// :root
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:root)
    public var root: Pointer { .init(pointer.selector + ":root") }
    
    /// The :scope CSS pseudo-class represents elements that are a reference point for selectors to match against.
    ///
    /// ```
    /// :scope
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:scope)
    public var scope: Pointer { .init(pointer.selector + ":scope") }

    /// Selects the portion of an element that is selected by a user
    ///
    /// ```
    /// ::selection
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/::selection)
    public var selection: Pointer { .init(pointer.selector + "::selection") }

    /// Selects the current active #news element (clicked on a URL containing that anchor name)
    ///
    /// ```
    /// #news:target
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:target)
    public var target: Pointer { .init(pointer.selector + ":target") }
    
    /// The :target-within CSS pseudo-class represents an element
    /// that is a target element or contains an element that is a target.
    /// A target element is a unique element with an id matching the URL's fragment.
    /// In other words, it represents an element that is itself matched by the :target pseudo-class
    /// or has a descendant that is matched by :target.
    /// (This includes descendants in shadow trees.)
    ///
    /// ```
    /// div:target-within
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:target-within)
    public var targetWithin: Pointer { .init(pointer.selector + ":target-within") }
    
    /// The :user-invalid aka :-moz-ui-invalid CSS pseudo-class represents any validated form element
    /// whose value isn't valid based on their validation constraints, after the user has interacted with it.
    ///
    /// ```
    /// input:user-invalid
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:user-invalid)
    public var userInvalid: Pointer { .init(pointer.selector + ":user-invalid") }
    
    /// The :-moz-ui-invalid aka :user-invalid CSS pseudo-class represents any validated form element
    /// whose value isn't valid based on their validation constraints, after the user has interacted with it.
    ///
    /// ```
    /// input:-moz-ui-invalid
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:user-invalid)
    public var mozUiinvalid: Pointer { .init(pointer.selector + ":-moz-ui-invalid") }

    /// Selects all input elements with a valid value
    ///
    /// ```
    /// input:valid
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:valid)
    public var valid: Pointer { .init(pointer.selector + ":valid") }

    /// Selects all visited links
    ///
    /// ```
    /// a:visited
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:visited)
    public var visited: Pointer { .init(pointer.selector + ":visited") }
    
    /// The :picture-in-picture CSS pseudo-class matches the element which is currently in picture-in-picture mode.
    ///
    /// ```
    /// :picture-in-picture {
    ///     box-shadow: 0 0 0 5px red;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/:picture-in-picture)
    public var pictureInPicture: Pointer { .init(pointer.selector + ":picture-in-picture") }
    
    // MARK: Other
    
    ///
    ///
    /// ```
    ///
    /// ```
    /// (No link)
    public var webkitSliderThumb: Pointer { .init(pointer.selector + "::-webkit-slider-thumb") }
    
    /// The ::-moz-progress-bar CSS pseudo-element is a Mozilla extension
    /// that represents the progress bar inside a `<progress>` element.
    /// (The bar represents the amount of progress that has been made.)
    ///
    /// ```
    /// ::-moz-progress-bar {
    ///     background-color: red;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/::-moz-progress-bar)
    public var mozProgressBar: Pointer { .init(pointer.selector + "::-moz-progress-bar") }
    
    /// The ::-moz-range-progress CSS pseudo-element is a Mozilla extension
    /// that represents the lower portion of the track (i.e., groove) in
    /// which the indicator slides in an `<input>` of type="range".
    /// This portion corresponds to values lower than the value currently selected by the thumb (i.e., virtual knob).
    ///
    /// ```
    /// input[type=range]::-moz-range-progress {
    ///     background-color: green;
    ///     height: 1em;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/::-moz-range-progress)
    public var mozRangeProgress: Pointer { .init(pointer.selector + "::-moz-range-progress") }
    
    /// The ::-moz-range-thumb CSS pseudo-element is a Mozilla extension
    /// that represents the thumb (i.e., virtual knob) of an `<input>` of type="range".
    /// The user can move the thumb along the input's track to alter its numerical value.
    ///
    /// ```
    /// input[type=range]::-moz-range-thumb {
    ///     background-color: green;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/::-moz-range-thumb)
    public var mozRangeThumb: Pointer { .init(pointer.selector + "::-moz-range-thumb") }
    
    /// The ::-moz-range-track CSS pseudo-element is a Mozilla extension
    /// that represents the track (i.e., groove) in which the indicator slides in an `<input>` of type="range".
    ///
    /// ```
    /// input[type=range]::-moz-range-track {
    ///     background-color: green;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/::-moz-range-track)
    public var mozRangeTrack: Pointer { .init(pointer.selector + "::-moz-range-track") }
    
    /// The ::-webkit-progress-bar CSS pseudo-element represents the entire bar of a `<progress>` element.
    /// Normally it's only visible as the unfilled portion of the bar,
    /// since by default it's rendered below the ::-webkit-progress-value pseudo-element.
    /// It is a child of the ::-webkit-progress-inner-element pseudo-element
    /// and the parent of the ::-webkit-progress-value pseudo-element.
    ///
    /// ```
    /// ::-webkit-progress-bar {
    ///     background-color: orange;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/::-webkit-progress-bar)
    public var webkitProgressBar: Pointer { .init(pointer.selector + "::-webkit-progress-bar") }
    
    /// The ::-webkit-progress-value CSS pseudo-element represents the filled-in portion
    /// of the bar of a `<progress>` element. It is a child of the ::-webkit-progress-bar pseudo-element.
    ///
    /// Note: In order to let ::-webkit-progress-value take effect, -webkit-appearance needs to be set to none on the `<progress>` element.
    ///
    /// ```
    /// progress {
    ///     -webkit-appearance: none;
    /// }
    ///
    /// ::-webkit-progress-value {
    ///     background-color: orange;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/::-webkit-progress-value)
    public var webkitProgressValue: Pointer { .init(pointer.selector + "::-webkit-progress-value") }
    
    /// The ::-webkit-slider-runnable-track CSS pseudo-element
    /// represents the "track" (the groove in which the indicator slides) of an `<input type="range">`.
    ///
    /// ```
    /// ::-webkit-slider-runnable-track
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/::-webkit-slider-runnable-track)
    public var webkitSliderRunnableTrack: Pointer { .init(pointer.selector + "::-webkit-slider-runnable-track") }
    
    /// The ::backdrop CSS pseudo-element is a box the size of the viewport
    /// which is rendered immediately beneath any element being presented in full-screen mode.
    /// This includes both elements which have been placed in full-screen mode using the Fullscreen API and `<dialog>` elements.
    ///
    /// ```
    /// video::backdrop {
    ///     background-color: #448;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/::backdrop)
    public var backdrop: Pointer { .init(pointer.selector + "::backdrop") }
    
    /// The ::cue CSS pseudo-element matches WebVTT cues within a selected element.
    /// This can be used to style captions and other cues in media with VTT tracks.
    ///
    /// ```
    /// ::cue {
    ///     color: yellow;
    ///     font-weight: bold;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/::cue)
    public var cue: Pointer { .init(pointer.selector + "::cue") }
    
    /// The ::cue-region CSS pseudo-element matches WebVTT cues within a selected element.
    /// This can be used to style captions and other cues in media with VTT tracks.
    ///
    /// ```
    /// ::cue-region {
    ///     color: yellow;
    ///     font-weight: bold;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/::cue-region)
    public var cueRegion: Pointer { .init(pointer.selector + "::cue-region") }
    
    /// The ::grammar-error CSS pseudo-element represents a text segment which the user agent has flagged as grammatically incorrect.
    ///
    /// ```
    /// ::grammar-error  {
    ///     text-decoration: underline red;
    ///     color: red;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/::grammar-error)
    public var grammarError: Pointer { .init(pointer.selector + "::grammar-error") }
    
    /// The ::marker CSS pseudo-element selects the marker box of a list item,
    /// which typically contains a bullet or number. It works on any element
    /// or pseudo-element set to display: list-item, such as the `<li>` and `<summary>` elements.
    ///
    /// ```
    /// ::marker {
    ///     color: blue;
    ///     font-size: 1.2em;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/::marker)
    public var marker: Pointer { .init(pointer.selector + "::marker") }
    
    /// The ::part CSS pseudo-element represents any element within a shadow tree that has a matching part attribute.
    ///
    /// ```
    /// custom-element::part(foo) {
    ///     /* Styles to apply to the `foo` part */
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/::part)
    public func part(_ expression: String) -> Pointer { .init(pointer.selector + "::part(\(expression)") }
    
    /// The ::slotted() CSS pseudo-element represents any element
    /// that has been placed into a slot inside an HTML template
    /// (see Using templates and slots for more information).
    ///
    /// This only works when used inside CSS placed within a shadow DOM.
    /// Note also that this selector won't select a text node placed into a slot; it only targets actual elements.
    ///
    /// ```
    /// /* Selects any element placed inside a slot */
    /// ::slotted(*) {
    ///     font-weight: bold;
    /// }
    ///
    /// /* Selects any <span> placed inside a slot */
    /// ::slotted(span) {
    ///     font-weight: bold;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/::slotted)
    public func slotted() -> Pointer { .init(pointer.selector + "::slotted") }
    
    /// The ::spelling-error CSS pseudo-element represents a text segment
    /// which the user agent has flagged as incorrectly spelled.
    ///
    /// ```
    /// ::spelling-error  {
    ///     text-decoration: wavy red;
    /// }
    /// ```
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/CSS/::spelling-error)
    public var spellingError: Pointer { .init(pointer.selector + "::spelling-error") }

//    /// Merge two pointers
//    public func merge(_ anotherPointer: Pointer) -> Self {
//        value += anotherPointer.value
//        return self
//    }
}
