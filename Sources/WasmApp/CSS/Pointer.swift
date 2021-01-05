//
//  CSSPointer.swift
//  WasmApp
//
//  Created by Mihael Isaev on 03.01.2021.
//

import Foundation

open class Pointer: Pointerable, ExpressibleByStringLiteral {
    public var pointer: Pointer { self }
    public let selector: String
    
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
    
    /// Selects the active link
    ///
    /// ```
    /// a:active
    /// ```
    public static var active: Pointer { .init(pointer.selector + ":active") }

    /// Insert something after the content of each `<p>` element
    ///
    /// ```
    /// p::after
    /// ```
    public static var after: Pointer { .init(pointer.selector + "::after") }

    /// Insert something before the content of each `<p>` element
    ///
    /// ```
    /// p::before
    /// ```
    public static var before: Pointer { .init(pointer.selector + "::before") }

    /// Selects every checked `<input>` element
    ///
    /// ```
    /// input:checked
    /// ```
    public static var checked: Pointer { .init(pointer.selector + ":checked") }

    /// Selects the default `<input>` element
    ///
    /// ```
    /// input:default
    /// ```
    public static var `default`: Pointer { .init(pointer.selector + ":default") }

    /// Selects every disabled `<input>` element
    ///
    /// ```
    /// input:disabled
    /// ```
    public static var disabled: Pointer { .init(pointer.selector + ":disabled") }

    /// Selects every `<p>` element that has no children (including text nodes)
    ///
    /// ```
    /// p:empty
    /// ```
    public static var empty: Pointer { .init(pointer.selector + ":empty") }

    /// Selects every enabled `<input>` element
    ///
    /// ```
    /// input:enabled
    /// ```
    public static var enabled: Pointer { .init(pointer.selector + ":enabled") }

    /// Selects every `<p>` element that is the first child of its parent
    ///
    /// ```
    /// p:first-child
    /// ```
    public static var firstChild: Pointer { .init(pointer.selector + ":first-child") }

    /// Selects the first letter of every `<p>` element
    ///
    /// ```
    /// p::first-letter
    /// ```
    public static var firstLetter: Pointer { .init(pointer.selector + "::first-letter") }

    /// Selects the first line of every `<p>` element
    ///
    /// ```
    /// p::first-line
    /// ```
    public static var firstLine: Pointer { .init(pointer.selector + "::first-line") }

    /// Selects every `<p>` element that is the first `<p>` element of its parent
    ///
    /// ```
    /// p:first-of-type
    /// ```
    public static var firstOfType: Pointer { .init(pointer.selector + ":first-of-type") }

    /// Selects the input element which has focus
    ///
    /// ```
    /// input:focus
    /// ```
    public static var focus: Pointer { .init(pointer.selector + ":focus") }

    /// Selects links on mouse over
    ///
    /// ```
    /// a:hover
    /// ```
    public static var hover: Pointer { .init(pointer.selector + ":hover") }

    /// Selects input elements with a value within a specified range
    ///
    /// ```
    /// input:in-range
    /// ```
    public static var inRange: Pointer { .init(pointer.selector + ":in-range") }

    /// Selects input elements that are in an indeterminate state
    ///
    /// ```
    /// input:indeterminate
    /// ```
    public static var indeterminate: Pointer { .init(pointer.selector + ":indeterminate") }

    /// Selects all input elements with an invalid value
    ///
    /// ```
    /// input:invalid
    /// ```
    public static var invalid: Pointer { .init(pointer.selector + ":invalid") }

    /// Selects every `<p>` element with a lang attribute equal to "it" (Italian)
    ///
    /// ```
    /// p:lang(it)
    /// ```
    public static func lang(_ language: String) -> Pointer { .init(pointer.selector + ":lang(\(language))") }

    /// Selects every `<p>` element that is the last child of its parent
    ///
    /// ```
    /// p:last-child
    /// ```
    public static var lastChild: Pointer { .init(pointer.selector + ":last-child") }

    /// Selects every `<p>` element that is the last `<p>` element of its parent
    ///
    /// ```
    /// p:last-of-type
    /// ```
    public static var lastOfType: Pointer { .init(pointer.selector + ":last-of-type") }

    /// Selects all unvisited links
    ///
    /// ```
    /// a:link
    /// ```
    public static var link: Pointer { .init(pointer.selector + ":link") }

    /// Selects every element that is not a `<p>` element
    ///
    /// ```
    /// :not(p)
    /// ```
    public static func not(_ selector: String) -> Pointer { .init(pointer.selector + ":not(\(selector))") }

    /// Selects every `<p>` element that is the second child of its parent
    ///
    /// ```
    /// p:nth-child(2)
    /// ```
    public static func nthChild(_ n: Int) -> Pointer { .init(pointer.selector + ":nth-child(\(n))") }

    /// Selects every `<p>` element that is the second child of its parent, counting from the last child
    ///
    /// ```
    /// p:nth-last-child(2)
    /// ```
    public static func nthLastChild(_ n: Int) -> Pointer { .init(pointer.selector + ":nth-last-child(\(n))") }

    /// Selects every `<p>` element that is the second `<p>` element of its parent, counting from the last child
    ///
    /// ```
    /// p:nth-last-of-type(2)
    /// ```
    public static func nthLastOfType(_ n: Int) -> Pointer { .init(pointer.selector + ":nth-last-of-type(\(n))") }

    /// Selects every `<p>` element that is the second `<p>` element of its parent
    ///
    /// ```
    /// p:nth-of-type(2)
    /// ```
    public static func nthOfType(_ n: Int) -> Pointer { .init(pointer.selector + ":nth-of-type(\(n))") }

    /// Selects every `<p>` element that is the only `<p>` element of its parent
    ///
    /// ```
    /// p:only-of-type
    /// ```
    public static var onlyOfType: Pointer { .init(pointer.selector + ":only-of-type") }

    /// Selects every `<p>` element that is the only child of its parent
    ///
    /// ```
    /// p:only-child
    /// ```
    public static var onlyChild: Pointer { .init(pointer.selector + ":only-child") }

    /// Selects input elements with no "required" attribute
    ///
    /// ```
    /// input:optional
    /// ```
    public static var optional: Pointer { .init(pointer.selector + ":optional") }

    /// Selects input elements with a value outside a specified range
    ///
    /// ```
    /// input:out-of-range
    /// ```
    public static var outOfRange: Pointer { .init(pointer.selector + ":out-of-range") }

    /// Selects input elements with the "placeholder" attribute specified
    ///
    /// ```
    /// input::placeholder
    /// ```
    public static var placeholder: Pointer { .init(pointer.selector + "::placeholder") }

    /// Selects input elements with the "readonly" attribute specified
    ///
    /// ```
    /// input:read-only
    /// ```
    public static var readOnly: Pointer { .init(pointer.selector + ":read-only") }

    /// Selects input elements with the "readonly" attribute NOT specified
    ///
    /// ```
    /// input:read-write
    /// ```
    public static var readWrite: Pointer { .init(pointer.selector + ":read-write") }

    /// Selects input elements with the "required" attribute specified
    ///
    /// ```
    /// input:required
    /// ```
    public static var required: Pointer { .init(pointer.selector + ":required") }

    /// Selects the document's root element
    ///
    /// ```
    /// :root
    /// ```
    public static var root: Pointer { .init(pointer.selector + ":root") }

    /// Selects the portion of an element that is selected by a user
    ///
    /// ```
    /// ::selection
    /// ```
    public static var selection: Pointer { .init(pointer.selector + "::selection") }

    /// Selects the current active #news element (clicked on a URL containing that anchor name)
    ///
    /// ```
    /// #news:target
    /// ```
    public static var target: Pointer { .init(pointer.selector + ":target") }

    /// Selects all input elements with a valid value
    ///
    /// ```
    /// input:valid
    /// ```
    public static var valid: Pointer { .init(pointer.selector + ":valid") }

    /// Selects all visited links
    ///
    /// ```
    /// a:visited
    /// ```
    public static var visited: Pointer { .init(pointer.selector + ":visited") }
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
    
    /// Selects the active link
    ///
    /// ```
    /// a:active
    /// ```
    public var active: Pointer { .init(pointer.selector + ":active") }

    /// Insert something after the content of each `<p>` element
    ///
    /// ```
    /// p::after
    /// ```
    public var after: Pointer { .init(pointer.selector + "::after") }

    /// Insert something before the content of each `<p>` element
    ///
    /// ```
    /// p::before
    /// ```
    public var before: Pointer { .init(pointer.selector + "::before") }

    /// Selects every checked `<input>` element
    ///
    /// ```
    /// input:checked
    /// ```
    public var checked: Pointer { .init(pointer.selector + ":checked") }

    /// Selects the default `<input>` element
    ///
    /// ```
    /// input:default
    /// ```
    public var `default`: Pointer { .init(pointer.selector + ":default") }

    /// Selects every disabled `<input>` element
    ///
    /// ```
    /// input:disabled
    /// ```
    public var disabled: Pointer { .init(pointer.selector + ":disabled") }

    /// Selects every `<p>` element that has no children (including text nodes)
    ///
    /// ```
    /// p:empty
    /// ```
    public var empty: Pointer { .init(pointer.selector + ":empty") }

    /// Selects every enabled `<input>` element
    ///
    /// ```
    /// input:enabled
    /// ```
    public var enabled: Pointer { .init(pointer.selector + ":enabled") }

    /// Selects every `<p>` element that is the first child of its parent
    ///
    /// ```
    /// p:first-child
    /// ```
    public var firstChild: Pointer { .init(pointer.selector + ":first-child") }

    /// Selects the first letter of every `<p>` element
    ///
    /// ```
    /// p::first-letter
    /// ```
    public var firstLetter: Pointer { .init(pointer.selector + "::first-letter") }

    /// Selects the first line of every `<p>` element
    ///
    /// ```
    /// p::first-line
    /// ```
    public var firstLine: Pointer { .init(pointer.selector + "::first-line") }

    /// Selects every `<p>` element that is the first `<p>` element of its parent
    ///
    /// ```
    /// p:first-of-type
    /// ```
    public var firstOfType: Pointer { .init(pointer.selector + ":first-of-type") }

    /// Selects the input element which has focus
    ///
    /// ```
    /// input:focus
    /// ```
    public var focus: Pointer { .init(pointer.selector + ":focus") }

    /// Selects links on mouse over
    ///
    /// ```
    /// a:hover
    /// ```
    public var hover: Pointer { .init(pointer.selector + ":hover") }

    /// Selects input elements with a value within a specified range
    ///
    /// ```
    /// input:in-range
    /// ```
    public var inRange: Pointer { .init(pointer.selector + ":in-range") }

    /// Selects input elements that are in an indeterminate state
    ///
    /// ```
    /// input:indeterminate
    /// ```
    public var indeterminate: Pointer { .init(pointer.selector + ":indeterminate") }

    /// Selects all input elements with an invalid value
    ///
    /// ```
    /// input:invalid
    /// ```
    public var invalid: Pointer { .init(pointer.selector + ":invalid") }

    /// Selects every `<p>` element with a lang attribute equal to "it" (Italian)
    ///
    /// ```
    /// p:lang(it)
    /// ```
    public func lang(_ language: String) -> Pointer { .init(pointer.selector + ":lang(\(language))") }

    /// Selects every `<p>` element that is the last child of its parent
    ///
    /// ```
    /// p:last-child
    /// ```
    public var lastChild: Pointer { .init(pointer.selector + ":last-child") }

    /// Selects every `<p>` element that is the last `<p>` element of its parent
    ///
    /// ```
    /// p:last-of-type
    /// ```
    public var lastOfType: Pointer { .init(pointer.selector + ":last-of-type") }

    /// Selects all unvisited links
    ///
    /// ```
    /// a:link
    /// ```
    public var link: Pointer { .init(pointer.selector + ":link") }

    /// Selects every element that is not a `<p>` element
    ///
    /// ```
    /// :not(p)
    /// ```
    public func not(_ selector: String) -> Pointer { .init(pointer.selector + ":not(\(selector))") }

    /// Selects every `<p>` element that is the second child of its parent
    ///
    /// ```
    /// p:nth-child(2)
    /// ```
    public func nthChild(_ n: Int) -> Pointer { .init(pointer.selector + ":nth-child(\(n))") }

    /// Selects every `<p>` element that is the second child of its parent, counting from the last child
    ///
    /// ```
    /// p:nth-last-child(2)
    /// ```
    public func nthLastChild(_ n: Int) -> Pointer { .init(pointer.selector + ":nth-last-child(\(n))") }

    /// Selects every `<p>` element that is the second `<p>` element of its parent, counting from the last child
    ///
    /// ```
    /// p:nth-last-of-type(2)
    /// ```
    public func nthLastOfType(_ n: Int) -> Pointer { .init(pointer.selector + ":nth-last-of-type(\(n))") }

    /// Selects every `<p>` element that is the second `<p>` element of its parent
    ///
    /// ```
    /// p:nth-of-type(2)
    /// ```
    public func nthOfType(_ n: Int) -> Pointer { .init(pointer.selector + ":nth-of-type(\(n))") }

    /// Selects every `<p>` element that is the only `<p>` element of its parent
    ///
    /// ```
    /// p:only-of-type
    /// ```
    public var onlyOfType: Pointer { .init(pointer.selector + ":only-of-type") }

    /// Selects every `<p>` element that is the only child of its parent
    ///
    /// ```
    /// p:only-child
    /// ```
    public var onlyChild: Pointer { .init(pointer.selector + ":only-child") }

    /// Selects input elements with no "required" attribute
    ///
    /// ```
    /// input:optional
    /// ```
    public var optional: Pointer { .init(pointer.selector + ":optional") }

    /// Selects input elements with a value outside a specified range
    ///
    /// ```
    /// input:out-of-range
    /// ```
    public var outOfRange: Pointer { .init(pointer.selector + ":out-of-range") }

    /// Selects input elements with the "placeholder" attribute specified
    ///
    /// ```
    /// input::placeholder
    /// ```
    public var placeholder: Pointer { .init(pointer.selector + "::placeholder") }

    /// Selects input elements with the "readonly" attribute specified
    ///
    /// ```
    /// input:read-only
    /// ```
    public var readOnly: Pointer { .init(pointer.selector + ":read-only") }

    /// Selects input elements with the "readonly" attribute NOT specified
    ///
    /// ```
    /// input:read-write
    /// ```
    public var readWrite: Pointer { .init(pointer.selector + ":read-write") }

    /// Selects input elements with the "required" attribute specified
    ///
    /// ```
    /// input:required
    /// ```
    public var required: Pointer { .init(pointer.selector + ":required") }

    /// Selects the document's root element
    ///
    /// ```
    /// :root
    /// ```
    public var root: Pointer { .init(pointer.selector + ":root") }

    /// Selects the portion of an element that is selected by a user
    ///
    /// ```
    /// ::selection
    /// ```
    public var selection: Pointer { .init(pointer.selector + "::selection") }

    /// Selects the current active #news element (clicked on a URL containing that anchor name)
    ///
    /// ```
    /// #news:target
    /// ```
    public var target: Pointer { .init(pointer.selector + ":target") }

    /// Selects all input elements with a valid value
    ///
    /// ```
    /// input:valid
    /// ```
    public var valid: Pointer { .init(pointer.selector + ":valid") }

    /// Selects all visited links
    ///
    /// ```
    /// a:visited
    /// ```
    public var visited: Pointer { .init(pointer.selector + ":visited") }

//    /// Merge two pointers
//    public func merge(_ anotherPointer: Pointer) -> Self {
//        value += anotherPointer.value
//        return self
//    }
}
