//
//  Elements.swift
//  DOM
//
//  Created by Mihael Isaev on 25.02.2021.
//

import Foundation
import WebFoundation

// MARK: - Content sectioning

/// The HTML `<address>` element indicates that the enclosed HTML
/// provides contact information for a person or people, or for an organization.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/address)
open class Address: BaseActiveElement, ScrollHandleable {}

/// The HTML `<article>` element represents a self-contained composition
/// in a document, page, application, or site, which is intended
/// to be independently distributable or reusable (e.g., in syndication).
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/article)
open class Article: BaseActiveElement {}

/// The HTML `<aside>` element represents a portion of a document
/// whose content is only indirectly related to the document's main content.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/aside)
open class ASide: BaseActiveElement {}

/// The HTML `<footer>` element represents a footer for its nearest
/// sectioning content or sectioning root element. A footer typically contains information
/// about the author of the section, copyright data or links to related documents.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/footer)
open class Footer: BaseActiveElement {}

/// The HTML `<h1>–<h6>` elements represent six levels of section headings.
/// `<h1>` is the highest section level and `<h6>` is the lowest.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/h1)
open class H1: BaseActiveElement, ScrollHandleable, _StringInitializable {
    var value: String {
        get { innerText }
        set { innerText = newValue }
    }

    /// String initializer
    /// - Parameter title: Pass `String` or `State<String>`
    required public convenience init <U>(_ title: U) where U: UniValue, U.UniValue == String {
        self.init()
        value = title.uniValue
        title.uniStateValue?.listen {
            self.value = $0
        }
    }
}

/// The HTML `<h1>–<h6>` elements represent six levels of section headings.
/// `<h1>` is the highest section level and `<h6>` is the lowest.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/h2)
open class H2: BaseActiveElement, ScrollHandleable, _StringInitializable {
    var value: String {
        get { innerText }
        set { innerText = newValue }
    }

    /// String initializer
    /// - Parameter title: Pass `String` or `State<String>`
    required public convenience init <U>(_ title: U) where U: UniValue, U.UniValue == String {
        self.init()
        value = title.uniValue
        title.uniStateValue?.listen {
            self.value = $0
        }
    }
}

/// The HTML `<h1>–<h6>` elements represent six levels of section headings.
/// `<h1>` is the highest section level and `<h6>` is the lowest.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/h3)
open class H3: BaseActiveElement, ScrollHandleable, _StringInitializable {
    var value: String {
        get { innerText }
        set { innerText = newValue }
    }

    /// String initializer
    /// - Parameter title: Pass `String` or `State<String>`
    required public convenience init <U>(_ title: U) where U: UniValue, U.UniValue == String {
        self.init()
        value = title.uniValue
        title.uniStateValue?.listen {
            self.value = $0
        }
    }
}

/// The HTML `<h1>–<h6>` elements represent six levels of section headings.
/// `<h1>` is the highest section level and `<h6>` is the lowest.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/h4)
open class H4: BaseActiveElement, ScrollHandleable, _StringInitializable {
    var value: String {
        get { innerText }
        set { innerText = newValue }
    }

    /// String initializer
    /// - Parameter title: Pass `String` or `State<String>`
    required public convenience init <U>(_ title: U) where U: UniValue, U.UniValue == String {
        self.init()
        value = title.uniValue
        title.uniStateValue?.listen {
            self.value = $0
        }
    }
}

/// The HTML `<h1>–<h6>` elements represent six levels of section headings.
/// `<h1>` is the highest section level and `<h6>` is the lowest.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/h5)
open class H5: BaseActiveElement, ScrollHandleable, _StringInitializable {
    var value: String {
        get { innerText }
        set { innerText = newValue }
    }

    /// String initializer
    /// - Parameter title: Pass `String` or `State<String>`
    required public convenience init <U>(_ title: U) where U: UniValue, U.UniValue == String {
        self.init()
        value = title.uniValue
        title.uniStateValue?.listen {
            self.value = $0
        }
    }
}

/// The HTML `<h1>–<h6>` elements represent six levels of section headings.
/// `<h1>` is the highest section level and `<h6>` is the lowest.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/h6)
open class H6: BaseActiveElement, ScrollHandleable, _StringInitializable {
    var value: String {
        get { innerText }
        set { innerText = newValue }
    }

    /// String initializer
    /// - Parameter title: Pass `String` or `State<String>`
    required public convenience init <U>(_ title: U) where U: UniValue, U.UniValue == String {
        self.init()
        value = title.uniValue
        title.uniStateValue?.listen {
            self.value = $0
        }
    }
}

/// The HTML `<header>` element represents introductory content,
/// typically a group of introductory or navigational aids.
/// It may contain some heading elements but also a logo,
/// a search form, an author name, and other elements.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/header)
open class Header: BaseActiveElement {

}

/// The HTML `<hgroup>` element represents a multi-level heading
/// for a section of a document. It groups a set of `<h1>–<h6>` elements.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/hgroup)
open class HGroup: BaseActiveElement {

}

/// The HTML `<main>` element represents the dominant content of the body of a document.
/// The main content area consists of content that is directly related to
/// or expands upon the central topic of a document, or the central functionality of an application.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/main)
open class Main: BaseActiveElement {

}

/// The HTML `<nav>` element represents a section of a page
/// whose purpose is to provide navigation links,
/// either within the current document or to other documents.
/// Common examples of navigation sections are menus, tables of contents, and indexes.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/nav)
open class Nav: BaseActiveElement {

}

/// The HTML `<section>` element represents a standalone section — which doesn't have
/// a more specific semantic element to represent it — contained within an HTML document.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/section)
open class Section: BaseActiveElement {

}

// MARK: - Demarcating edits

/// The HTML `<del>` element represents a range of text that has been deleted from a document.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/del)
open class Del: BaseActiveElement {

}

/// The HTML `<ins>` element represents a range of text that has been added to a document.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/ins)
open class Ins: BaseActiveElement {

}

// MARK: - Document metadata

/// The HTML `<base>` element specifies the base URL to use for all relative URLs in a document.
/// There can be only one `<base>` element in a document.
///
/// A document's used base URL can be accessed by scripts with **document.baseURI**.
/// If the document has no `<base>` elements, then baseURI defaults to **location.href**.
///
/// ```swift
/// Base().href("https://www.example.com/")
/// Base().target("_blank")
/// Base().target("_top").href("https://example.com/")
/// ```
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/base)
open class Base: BaseElement {}

/// The HTML `<head>` element contains machine-readable information (metadata)
/// about the document, like its title, scripts, and style sheets.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/head)
open class Head: BaseContentElement {}

public typealias WLink = Link

/// The HTML External Resource Link element `<link>`
/// specifies relationships between the current document and an external resource.
/// This element is most commonly used to link to stylesheets,
/// but is also used to establish site icons (both "favicon" style icons and icons
/// for the home screen and apps on mobile devices) among other things.
///
/// ```swift
/// Link()
///     .href("/media/examples/link-element-example.css")
///     .rel(.stylesheet)
/// ```
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/link)
open class Link: BaseActiveElement, ErrorHandleable, LoadHandleable {
    
}

/// The HTML `<meta>` element represents Metadata that cannot be represented
/// by other HTML meta-related elements, like base, link, script, style or title.
///
/// ```swift
/// Meta().charset("utf-8")
///
/// // Redirect page after 3 seconds
/// Meta().httpEquiv("refresh").content("3;url=https://www.mozilla.org")
/// ```
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/meta)
open class Meta: BaseElement {
    public var name: String {
        get { domElement.name.string ?? "" }
        set { domElement.name = newValue.jsValue() }
    }

    public var content: String {
        get { domElement.content.string ?? "" }
        set { domElement.content = newValue.jsValue() }
    }
}

/// The HTML `<style>` element contains style information for a document, or part of a document.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/style)
open class Style: BaseElement, LoadHandleable {
    
}

/// The HTML Title element `<title>` defines the document's title
/// that is shown in a Browser's title bar or a page's tab.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/title)
open class Title: BaseContentElement, _StringInitializable {
    var value: String {
        get { innerText }
        set { innerText = newValue }
    }

    /// String initializer
    /// - Parameter title: Pass `String` or `State<String>`
    required public convenience init <U>(_ title: U) where U: UniValue, U.UniValue == String {
        self.init()
        value = title.uniValue
        title.uniStateValue?.listen {
            self.value = $0
        }
    }
}

// MARK: - Embedded content

/// The HTML `<embed>` element embeds external content
/// at the specified point in the document. This content is provided
/// by an external application or other source of interactive content such as a browser plug-in.
///
/// ```swift
/// Embed()
///     .type("video/webm")
///     .src("/media/cc0-videos/flower.mp4")
///     .width(250.px)
///     .height(200.px)
/// ```
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/embed)
open class Embed: BaseActiveElement {

}

/// The HTML Inline Frame element `<iframe>` represents a nested browsing context,
/// embedding another HTML page into the current one.
///
/// ```swift
/// IFrame()
///     .id("inlineFrameExample")
///     .title("Inline Frame Example")
///     .width(300.px)
///     .height(200.px)
///     .src("https://www.openstreetmap.org/")
/// ```
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe)
open class IFrame: BaseElement, LoadHandleable {

}

/// The HTML `<object>` element represents an external resource,
/// which can be treated as an image, a nested browsing context,
/// or a resource to be handled by a plugin.
///
/// ```swift
/// Object()
///     .type("application/pdf")
///     .data("/media/examples/In-CC0.pdf")
///     .width(250.px)
///     .height(200.px)
/// ```
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/object)
open class Object: BaseActiveElement, ErrorHandleable, ScrollHandleable {

}

/// The HTML `<param>` element defines parameters for an object element.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/param)
open class Param: BaseActiveElement {

}

/// The HTML `<picture>` element contains zero or more source elements
/// and one img element to offer alternative versions of an image for different display/device scenarios.
///
/// ```swift
/// Picture {
///     Source()
///         .srcset("/media/cc0-images/surfer-240-200.jpg")
///         .media("(min-width: 800px)")
///      Img()
///          .src("/media/cc0-images/painted-hand-298-332.jpg")
///          .alt("")
/// }
/// ```
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/picture)
open class Picture: BaseActiveElement {

}

/// The HTML `<source>` element specifies multiple media resources
/// for the picture, the audio element, or the video element.
///
/// ```swift
/// Video {
///     Source()
///         .src("/media/cc0-videos/flower.webm")
///         .type("video/webm")
///     Source()
///         .src("/media/cc0-videos/flower.mp4")
///         .type("video/mp4")
/// }
/// .controls(true)
/// .width(250.px)
/// .height(200.px)
/// .muted(true)
/// .innerText("This browser does not support the HTML5 video element.")
/// ```
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/source)
open class Source: BaseActiveElement {

}

 // MARK: - Forms

public typealias WButton = Button

/// The HTML `<button>` element represents a clickable button,
/// used to submit forms or anywhere in a document for accessible, standard button functionality.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/button)
open class Button: BaseActiveElement, _StringInitializable {
    var value: String {
        get { innerText }
        set { innerText = newValue }
    }

    /// String initializer
    /// - Parameter title: Pass `String` or `State<String>`
    required public convenience init <U>(_ title: U) where U: UniValue, U.UniValue == String {
        self.init()
        value = title.uniValue
        title.uniStateValue?.listen {
            self.value = $0
        }
    }
}

/// The HTML `<datalist>` element contains a set of option elements
/// that represent the permissible or recommended options available to choose from within other controls.
///
/// ```swift
/// DataList {
///     Option("Cat").value("cat")
///     Option("Dog").value("dog")
/// }
/// ```
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/datalist)
open class DataList: BaseActiveElement {

}

/// The HTML `<fieldset>` element is used to group several controls as well as labels (label) within a web form.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/fieldset)
open class FieldSet: BaseActiveElement, ScrollHandleable {

}

public typealias WForm = Form

/// The HTML `<form>` element represents a document section
/// containing interactive controls for submitting information.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/form)
open class Form: BaseActiveElement, ResetHandleable, ScrollHandleable, SubmitHandleable {

}

/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input)
open class Input: BaseActiveElement {}

/// A push button with no default behavior displaying the value of the value attribute, empty by default.
///
/// The HTML `<input>` element is used to create interactive controls
/// for web-based forms in order to accept data from the user;
/// a wide variety of types of input data and control widgets are available,
/// depending on the device and user agent.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input)
open class InputButton: BaseActiveElement {
    public override class var name: String { "input" }

    public required init() {
        super.init()
        setAttribute("type", "button")
    }
}

/// A check box allowing single values to be selected/deselected.
///
/// The HTML `<input>` element is used to create interactive controls
/// for web-based forms in order to accept data from the user;
/// a wide variety of types of input data and control widgets are available,
/// depending on the device and user agent.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/checkbox)
open class InputCheckbox: BaseActiveElement, ChangeHandleable, InvalidHandleable, Selectable {
    public override class var name: String { "input" }

    @State public var checked = false
    @State public var indeterminate = false

    public required init() {
        super.init()
        onChange { [self] in
            checked = domElement.checked.boolean ?? false
            indeterminate = domElement.indeterminate.boolean ?? false
        }
        setAttribute("type", "checkbox")
    }

    public required convenience init<C, I>(_ checked: C, indeterminate: I) where C: UniValue, C.UniValue == Bool, I: UniValue, I.UniValue == Bool {
        self.init()
        setAttribute("checked", checked.uniValue, .short)
        setAttribute("indeterminate", indeterminate.uniValue, .short)
        self.checked = checked.uniValue
        self.indeterminate = indeterminate.uniValue
        if let state = checked.uniStateValue {
            _checked.merge(with: state, leftChanged: { [weak self] in
                self?.setAttribute("checked", $0, .short)
            }, rightChanged: { [weak self] in
                self?.setAttribute("checked", $0, .short)
            })
        } else {
            _checked.listen { [weak self] in
                self?.setAttribute("checked", $0, .short)
            }
        }
        if let state = indeterminate.uniStateValue {
            _indeterminate.merge(with: state, leftChanged: { [weak self] in
                self?.setAttribute("indeterminate", $0, .short)
            }, rightChanged: { [weak self] in
                self?.setAttribute("indeterminate", $0, .short)
            })
        } else {
            _indeterminate.listen { [weak self] in
                self?.setAttribute("indeterminate", $0, .short)
            }
        }
    }
    
    public required convenience init<C>(_ checked: C) where C: UniValue, C.UniValue == Bool {
        self.init(checked, indeterminate: false)
    }

    /// Convenience method to toggle checkbox
    public func toggle() {
        domElement.indeterminate = false.jsValue()
        domElement.checked = (!checked).jsValue()
        indeterminate = false
        checked = !checked
    }
}

/// A control for specifying a color;
/// opening a color picker when active in supporting browsers.
///
/// The HTML `<input>` element is used to create interactive controls
/// for web-based forms in order to accept data from the user;
/// a wide variety of types of input data and control widgets are available,
/// depending on the device and user agent.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/color)
open class InputColor: BaseActiveElement, ChangeHandleable, InvalidHandleable, InputHandleable, Selectable {
    public override class var name: String { "input" }

    @State public var text: String = "#000000"

    var inputEventHasNeverFired = true
    
    /// Convenience getter
    var _value: String? {
        domElement.value.string
    }

    func _updateStateWithValue() {
        guard let value = _value else { return }
        self.text = value
    }

    public required init() {
        super.init()
        onChange { [self] in
            guard inputEventHasNeverFired else { return }
            _updateStateWithValue()
        }
        onInput { [self] in
            inputEventHasNeverFired = false
            _updateStateWithValue()
        }
        setAttribute("type", "color")
        setAttribute("value", text)
    }
    
    /// String initializer
    /// - Parameter value: Pass `String` or `State<String>`
    public required convenience init<U>(_ value: U) where U: UniValue, U.UniValue == String {
        self.init()
        setAttribute("value", value.uniValue)
        self.text = value.uniValue
        if let state = value.uniStateValue {
            _text.merge(with: state, leftChanged: { [weak self] in
                self?.setAttribute("value", $0)
            }, rightChanged: { [weak self] in
                self?.setAttribute("value", $0)
            })
        } else {
            _text.listen { [weak self] in
                self?.setAttribute("value", $0)
            }
        }
    }
}

/// A control for entering a date (year, month, and day, with no time).
/// Opens a date picker or numeric wheels for year, month, day when active in supporting browsers.
///
/// The HTML `<input>` element is used to create interactive controls
/// for web-based forms in order to accept data from the user;
/// a wide variety of types of input data and control widgets are available,
/// depending on the device and user agent.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/date)
open class InputDate: BaseActiveElement, _StringInitializable, ChangeHandleable, InvalidHandleable, InputHandleable, SelectHandleable, Selectable {
    public override class var name: String { "input" }

    @State public var text: String = ""

    var inputEventHasNeverFired = true
    
    /// Convenience getter
    var _value: String? {
        domElement.value.string
    }

    func _updateStateWithValue() {
        guard let value = _value else { return }
        self.text = value
    }

    public required init() {
        super.init()
        onChange { [self] in
            guard inputEventHasNeverFired else { return }
            _updateStateWithValue()
        }
        onInput { [self] in
            inputEventHasNeverFired = false
            _updateStateWithValue()
        }
        setAttribute("type", "date")
        setAttribute("value", text)
    }
    
    /// String initializer
    /// - Parameter value: Pass `String` or `State<String>`
    public required convenience init<U>(_ value: U) where U: UniValue, U.UniValue == String {
        self.init()
        setAttribute("value", value.uniValue)
        self.text = value.uniValue
        if let state = value.uniStateValue {
            _text.merge(with: state, leftChanged: { [weak self] in
                self?.setAttribute("value", $0)
            }, rightChanged: { [weak self] in
                self?.setAttribute("value", $0)
            })
        } else {
            _text.listen { [weak self] in
                self?.setAttribute("value", $0)
            }
        }
    }

    /// The HTMLInputElement.stepUp() method increments the value
    /// of a numeric type of  `<input>` element by the value of the step attribute,
    /// or the default step value if the step attribute is not explicitly set.
    /// The method, when invoked, increments the value by (step * n),
    /// where n defaults to 1 if not specified, and step defaults
    /// to the default value for step if not specified.
    public func stepUp(_ multiplier: Int = 1) {
        callFunction("stepUp", args: multiplier)
    }

    /// This method decrements the value of a numeric type of `<input>` element
    /// by the value of the step attribute or up to n multiples of the step attribute
    /// if a number is passed as the parameter.  The method, when invoked,
    /// decrements the value by (step * n), where n defaults to 1 if not specified,
    /// and step defaults to the default value for step if not specified.
    public func stepDown(_ multiplier: Int = 1) {
        callFunction("stepDown", args: multiplier)
    }
}

/// A control for entering a date and time, with no time zone.
/// Opens a date picker or numeric wheels for date- and time-components when active in supporting browsers.
///
/// The HTML `<input>` element is used to create interactive controls
/// for web-based forms in order to accept data from the user;
/// a wide variety of types of input data and control widgets are available,
/// depending on the device and user agent.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input)
open class InputDateTime: BaseActiveElement, _StringInitializable, ChangeHandleable, InvalidHandleable, InputHandleable, SelectHandleable, Selectable {
    public override class var name: String { "input" }

    @State public var text: String = ""

    var inputEventHasNeverFired = true
    
    /// Convenience getter
    var _value: String? {
        domElement.value.string
    }

    func _updateStateWithValue() {
        guard let value = _value else { return }
        self.text = value
    }

    public required init() {
        super.init()
        onChange { [self] in
            guard inputEventHasNeverFired else { return }
            _updateStateWithValue()
        }
        onInput { [self] in
            inputEventHasNeverFired = false
            _updateStateWithValue()
        }
        setAttribute("type", "datetime-local")
        setAttribute("value", text)
    }
    
    /// String initializer
    /// - Parameter value: Pass `String` or `State<String>`
    public required convenience init<U>(_ value: U) where U: UniValue, U.UniValue == String {
        self.init()
        setAttribute("value", value.uniValue)
        self.text = value.uniValue
        if let state = value.uniStateValue {
            _text.merge(with: state, leftChanged: { [weak self] in
                self?.setAttribute("value", $0)
            }, rightChanged: { [weak self] in
                self?.setAttribute("value", $0)
            })
        } else {
            _text.listen { [weak self] in
                self?.setAttribute("value", $0)
            }
        }
    }

    /// The HTMLInputElement.stepUp() method increments the value
    /// of a numeric type of  `<input>` element by the value of the step attribute,
    /// or the default step value if the step attribute is not explicitly set.
    /// The method, when invoked, increments the value by (step * n),
    /// where n defaults to 1 if not specified, and step defaults
    /// to the default value for step if not specified.
    public func stepUp(_ multiplier: Int = 1) {
        callFunction("stepUp", args: multiplier)
    }

    /// This method decrements the value of a numeric type of `<input>` element
    /// by the value of the step attribute or up to n multiples of the step attribute
    /// if a number is passed as the parameter.  The method, when invoked,
    /// decrements the value by (step * n), where n defaults to 1 if not specified,
    /// and step defaults to the default value for step if not specified.
    public func stepDown(_ multiplier: Int = 1) {
        callFunction("stepUp", args: multiplier)
    }
}

/// A field for editing an email address.
/// Looks like a text input, but has validation parameters
/// and relevant keyboard in supporting browsers and devices with dynamic keyboards.
///
/// The HTML `<input>` element is used to create interactive controls
/// for web-based forms in order to accept data from the user;
/// a wide variety of types of input data and control widgets are available,
/// depending on the device and user agent.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/email)
open class InputEmail: BaseActiveElement, _StringInitializable, ChangeHandleable, InvalidHandleable, InputHandleable, SelectHandleable, SearchHandleable, Selectable {
    public override class var name: String { "input" }

    @State public var text: String = ""

    var inputEventHasNeverFired = true
    
    /// Convenience getter
    var _value: String? {
        domElement.value.string
    }

    func _updateStateWithValue() {
        guard let value = _value else { return }
        self.text = value
    }

    public required init() {
        super.init()
        onChange { [self] in
            guard inputEventHasNeverFired else { return }
            _updateStateWithValue()
        }
        onInput { [self] in
            inputEventHasNeverFired = false
            _updateStateWithValue()
        }
        setAttribute("type", "email")
        setAttribute("value", text)
    }
    
    /// String initializer
    /// - Parameter value: Pass `String` or `State<String>`
    public required convenience init<U>(_ value: U) where U: UniValue, U.UniValue == String {
        self.init()
        setAttribute("value", value.uniValue)
        self.text = value.uniValue
        if let state = value.uniStateValue {
            _text.merge(with: state, leftChanged: { [weak self] in
                self?.setAttribute("value", $0)
            }, rightChanged: { [weak self] in
                self?.setAttribute("value", $0)
            })
        } else {
            _text.listen { [weak self] in
                self?.setAttribute("value", $0)
            }
        }
    }
}

/// A control that lets the user select a file.
/// Use the accept attribute to define the types of files that the control can select.
///
/// The HTML `<input>` element is used to create interactive controls
/// for web-based forms in order to accept data from the user;
/// a wide variety of types of input data and control widgets are available,
/// depending on the device and user agent.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input)
open class InputFile: BaseActiveElement, ChangeHandleable, InvalidHandleable, SelectHandleable {
    public override class var name: String { "input" }

    @State public internal(set) var files: [File] = []

    public required init() {
        super.init()
        onChange { [self] in
            let count = Int(domElement.files.length.number ?? 0)
            if count > 0 {
                var files: [File] = []
                // maybe the new way soon
                if let array = domElement.files.array {
                    array.forEach {
                        guard let file = File($0) else { return }
                        files.append(file)
                    }
                } else {
                    (0...count - 1).forEach { i in
                        guard let value = domElement.files.item.function?.callAsFunction(this: domElement.files.object, i) else { return }
                        guard let file = File(value) else { return }
                        files.append(file)
                    }
                }
                self.files = files
            }
        }
        setAttribute("type", "file")
    }
}

extension InputFile {
    public struct File: CustomStringConvertible {
        public let lastModified: Date
        public let name: String
        public let size: UInt
        public let type: String
        public let webkitRelativePath: String

        init? (_ value: JSValue) {
            guard !value.isNull && !value.isUndefined else { return nil }
            let lm = value.lastModified.number ?? 0
            lastModified = Date(timeIntervalSince1970: lm > 0 ? lm / 1_000 : 0)
            name = value.name.string ?? ""
            size = UInt(value.size.number ?? 0)
            type = value.type.string ?? ""
            webkitRelativePath = value.webkitRelativePath.string ?? ""
        }

        public var description: String {
            "InputFile.File(name: \(name), size: \(size), type: \(type), lastModified: \(lastModified.timeIntervalSince1970))"
        }
    }
}

/// A control that is not displayed but whose value is submitted to the server.
/// There is an example in the next column, but it's hidden!
///
/// The HTML `<input>` element is used to create interactive controls
/// for web-based forms in order to accept data from the user;
/// a wide variety of types of input data and control widgets are available,
/// depending on the device and user agent.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/hidden)
open class InputHidden: BaseActiveElement {
    public override class var name: String { "input" }

    @State public var value = ""

    public required init() {
        super.init()
        setAttribute("type", "hidden")
        setAttribute("value", value)
    }
    
    /// String initializer
    /// - Parameter value: Pass `String` or `State<String>`
    public required convenience init<U>(_ value: U) where U: UniValue, U.UniValue == String {
        self.init()
        setAttribute("value", value.uniValue)
        self.value = value.uniValue
        if let state = value.uniStateValue {
            _value.merge(with: state, leftChanged: { [weak self] in
                self?.setAttribute("value", $0)
            }, rightChanged: { [weak self] in
                self?.setAttribute("value", $0)
            })
        } else {
            _value.listen { [weak self] in
                self?.setAttribute("value", $0)
            }
        }
    }
}

/// A graphical submit button.
/// Displays an image defined by the src attribute.
/// The alt attribute displays if the image src is missing.
///
/// The HTML `<input>` element is used to create interactive controls
/// for web-based forms in order to accept data from the user;
/// a wide variety of types of input data and control widgets are available,
/// depending on the device and user agent.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/image)
open class InputImage: BaseActiveElement, ErrorHandleable {
    public override class var name: String { "input" }

    public required init() {
        super.init()
        setAttribute("type", "image")
    }
}

/// The HTML `<input>` element is used to create interactive controls
/// for web-based forms in order to accept data from the user;
/// a wide variety of types of input data and control widgets are available,
/// depending on the device and user agent.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input)
open class InputList: BaseActiveElement, ChangeHandleable, InvalidHandleable, SelectHandleable {
    public override class var name: String { "input" }

    public required init() {
        super.init()
        onChange {
            // TODO: update
        }
        setAttribute("type", "list")
    }
}

/// A control for entering a month and year, with no time zone.
///
/// The HTML `<input>` element is used to create interactive controls
/// for web-based forms in order to accept data from the user;
/// a wide variety of types of input data and control widgets are available,
/// depending on the device and user agent.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input)
open class InputMonth: BaseActiveElement, _StringInitializable, ChangeHandleable, InvalidHandleable, InputHandleable, SelectHandleable {
    public override class var name: String { "input" }

    @State public var text: String = ""

    var inputEventHasNeverFired = true
    
    /// Convenience getter
    var _value: String? {
        domElement.value.string
    }

    func _updateStateWithValue() {
        guard let value = _value else { return }
        self.text = value
    }

    public required init() {
        super.init()
        onChange { [self] in
            guard inputEventHasNeverFired else { return }
            _updateStateWithValue()
        }
        onInput { [self] in
            inputEventHasNeverFired = false
            _updateStateWithValue()
        }
        setAttribute("type", "text")
        setAttribute("value", text)
    }
    
    /// String initializer
    /// - Parameter value: Pass `String` or `State<String>`
    public required convenience init<U>(_ value: U) where U: UniValue, U.UniValue == String {
        self.init()
        setAttribute("value", value.uniValue)
        self.text = value.uniValue
        if let state = value.uniStateValue {
            _text.merge(with: state, leftChanged: { [weak self] in
                self?.setAttribute("value", $0)
            }, rightChanged: { [weak self] in
                self?.setAttribute("value", $0)
            })
        } else {
            _text.listen { [weak self] in
                self?.setAttribute("value", $0)
            }
        }
    }

    /// The HTMLInputElement.stepUp() method increments the value
    /// of a numeric type of  `<input>` element by the value of the step attribute,
    /// or the default step value if the step attribute is not explicitly set.
    /// The method, when invoked, increments the value by (step * n),
    /// where n defaults to 1 if not specified, and step defaults
    /// to the default value for step if not specified.
    public func stepUp(_ multiplier: Int = 1) {
        callFunction("stepUp", args: multiplier)
    }

    /// This method decrements the value of a numeric type of `<input>` element
    /// by the value of the step attribute or up to n multiples of the step attribute
    /// if a number is passed as the parameter.  The method, when invoked,
    /// decrements the value by (step * n), where n defaults to 1 if not specified,
    /// and step defaults to the default value for step if not specified.
    public func stepDown(_ multiplier: Int = 1) {
        callFunction("stepDown", args: multiplier)
    }
}

/// A control for entering a number.
/// Displays a spinner and adds default validation when supported.
/// Displays a numeric keypad in some devices with dynamic keypads.
///
/// The HTML `<input>` element is used to create interactive controls
/// for web-based forms in order to accept data from the user;
/// a wide variety of types of input data and control widgets are available,
/// depending on the device and user agent.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input)
open class InputNumber: BaseActiveElement, ChangeHandleable, InvalidHandleable, InputHandleable, SelectHandleable, SearchHandleable {
    public override class var name: String { "input" }

    @State public var text: String = ""

    var inputEventHasNeverFired = true
    
    /// Convenience getter
    var _value: String? {
        domElement.value.string
    }

    func _updateStateWithValue() {
        guard let value = _value else { return }
        self.text = value
    }

    public required init() {
        super.init()
        onChange { [self] in
            guard inputEventHasNeverFired else { return }
            _updateStateWithValue()
        }
        onInput { [self] in
            inputEventHasNeverFired = false
            _updateStateWithValue()
        }
        setAttribute("type", "number")
        setAttribute("value", text)
    }

    /// String initializer
    /// - Parameter value: Pass `String` or `State<String>`
    public required convenience init<U>(_ value: U) where U: UniValue, U.UniValue == String {
        self.init()
        setAttribute("value", value.uniValue)
        self.text = value.uniValue
        if let state = value.uniStateValue {
            _text.merge(with: state, leftChanged: { [weak self] in
                self?.setAttribute("value", $0)
            }, rightChanged: { [weak self] in
                self?.setAttribute("value", $0)
            })
        } else {
            _text.listen { [weak self] in
                self?.setAttribute("value", $0)
            }
        }
    }

    /// The HTMLInputElement.stepUp() method increments the value
    /// of a numeric type of  `<input>` element by the value of the step attribute,
    /// or the default step value if the step attribute is not explicitly set.
    /// The method, when invoked, increments the value by (step * n),
    /// where n defaults to 1 if not specified, and step defaults
    /// to the default value for step if not specified.
    public func stepUp(_ multiplier: Double = 1) {
        callFunction("stepUp", args: multiplier)
    }

    /// This method decrements the value of a numeric type of `<input>` element
    /// by the value of the step attribute or up to n multiples of the step attribute
    /// if a number is passed as the parameter.  The method, when invoked,
    /// decrements the value by (step * n), where n defaults to 1 if not specified,
    /// and step defaults to the default value for step if not specified.
    public func stepDown(_ multiplier: Double = 1) {
        callFunction("stepDown", args: multiplier)
    }
}

/// A single-line text field whose value is obscured.
/// Will alert user if site is not secure.
///
/// The HTML `<input>` element is used to create interactive controls
/// for web-based forms in order to accept data from the user;
/// a wide variety of types of input data and control widgets are available,
/// depending on the device and user agent.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input)
open class InputPassword: BaseActiveElement, _StringInitializable, ChangeHandleable, InvalidHandleable, InputHandleable, SelectHandleable, SearchHandleable, Selectable, RangeTextable, SelectionRangeable {
    public override class var name: String { "input" }

    @State public var text: String = ""

    var inputEventHasNeverFired = true
    
    /// Convenience getter
    var _value: String? {
        domElement.value.string
    }

    func _updateStateWithValue() {
        guard let value = _value else { return }
        self.text = value
    }

    public required init() {
        super.init()
        onChange { [self] in
            guard inputEventHasNeverFired else { return }
            _updateStateWithValue()
        }
        onInput { [self] in
            inputEventHasNeverFired = false
            _updateStateWithValue()
        }
        setAttribute("type", "password")
        setAttribute("value", text)
    }
    
    /// String initializer
    /// - Parameter value: Pass `String` or `State<String>`
    public required convenience init<U>(_ value: U) where U: UniValue, U.UniValue == String {
        self.init()
        setAttribute("value", value.uniValue)
        self.text = value.uniValue
        if let state = value.uniStateValue {
            _text.merge(with: state, leftChanged: { [weak self] in
                self?.setAttribute("value", $0)
            }, rightChanged: { [weak self] in
                self?.setAttribute("value", $0)
            })
        } else {
            _text.listen { [weak self] in
                self?.setAttribute("value", $0)
            }
        }
    }
}

/// A radio button, allowing a single value to be selected out of multiple choices with the same name value.
///
/// The HTML `<input>` element is used to create interactive controls
/// for web-based forms in order to accept data from the user;
/// a wide variety of types of input data and control widgets are available,
/// depending on the device and user agent.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input)
open class InputRadio: BaseActiveElement, ChangeHandleable, InvalidHandleable, Selectable {
    public override class var name: String { "input" }

    @State public var checked = false

    var value: String {
        domElement.value.string ?? ""
    }

    public required init() {
        super.init()
        onChange { [self] in
            checked = domElement.checked.boolean ?? false
        }
        setAttribute("type", "radio")
    }

    /// Bool initializer
    /// - Parameter value: Pass `Bool` or `State<Bool>`
    public required convenience init<U>(_ checked: U) where U: UniValue, U.UniValue == Bool {
        self.init()
        setAttribute("checked", checked.uniValue, .short)
        self.checked = checked.uniValue
        if let state = checked.uniStateValue {
            _checked.merge(with: state, leftChanged: { [weak self] in
                self?.setAttribute("checked", $0, .short)
            }, rightChanged: { [weak self] in
                self?.setAttribute("checked", $0, .short)
            })
        } else {
            _checked.listen { [weak self] in
                self?.setAttribute("checked", $0, .short)
            }
        }
    }
}

/// A control for entering a number whose exact value is not important.
/// Displays as a range widget defaulting to the middle value.
/// Used in conjunction min and max to define the range of acceptable values.
///
/// The HTML `<input>` element is used to create interactive controls
/// for web-based forms in order to accept data from the user;
/// a wide variety of types of input data and control widgets are available,
/// depending on the device and user agent.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/range)
open class InputRange: BaseActiveElement, ChangeHandleable, InputHandleable, InvalidHandleable {
    public override class var name: String { "input" }

    @State public var value: Double = 0

    var inputEventHasNeverFired = true
    
    /// Convenience getter
    var __value: Double? {
        guard let value = self.domElement.valueAsNumber.number else { return nil }
        return value
    }

    func _updateStateWithValue() {
        guard let value = __value else { return }
        self.value = value
    }

    public required init() {
        super.init()
        onChange { [self] in
            guard inputEventHasNeverFired else { return }
            _updateStateWithValue()
        }
        onInput { [self] in
            inputEventHasNeverFired = false
            _updateStateWithValue()
        }
        setAttribute("type", "range")
    }

    /// Double initializer
    /// - Parameter value: Pass `Double` or `State<Double>`
    public required convenience init<U>(_ value: U) where U: UniValue, U.UniValue == Double {
        self.init()
        setAttribute("value", value.uniValue)
        self.value = value.uniValue
        if let state = value.uniStateValue {
            _value.merge(with: state, leftChanged: { [weak self] in
                self?.setAttribute("value", $0)
            }, rightChanged: { [weak self] in
                self?.setAttribute("value", $0)
            })
        } else {
            _value.listen { [weak self] in
                self?.setAttribute("value", $0)
            }
        }
    }

    /// The HTMLInputElement.stepUp() method increments the value
    /// of a numeric type of  `<input>` element by the value of the step attribute,
    /// or the default step value if the step attribute is not explicitly set.
    /// The method, when invoked, increments the value by (step * n),
    /// where n defaults to 1 if not specified, and step defaults
    /// to the default value for step if not specified.
    public func stepUp(_ multiplier: Double) {
        callFunction("stepUp", args: multiplier)
        _updateStateWithValue()
    }
    public func stepUp() { stepUp(1) }

    /// This method decrements the value of a numeric type of `<input>` element
    /// by the value of the step attribute or up to n multiples of the step attribute
    /// if a number is passed as the parameter.  The method, when invoked,
    /// decrements the value by (step * n), where n defaults to 1 if not specified,
    /// and step defaults to the default value for step if not specified.
    public func stepDown(_ multiplier: Double) {
        callFunction("stepDown", args: multiplier)
        _updateStateWithValue()
    }
    public func stepDown() { stepDown(1) }
}

/// A button that resets the contents of the form to default values.
/// Not recommended.
///
/// The HTML `<input>` element is used to create interactive controls
/// for web-based forms in order to accept data from the user;
/// a wide variety of types of input data and control widgets are available,
/// depending on the device and user agent.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input)
open class InputReset: BaseActiveElement {
    public override class var name: String { "input" }

    public required init() {
        super.init()
        setAttribute("type", "reset")
    }
}

/// A single-line text field for entering search strings.
/// Line-breaks are automatically removed from the input value.
/// May include a delete icon in supporting browsers
/// that can be used to clear the field. Displays a search icon
/// instead of enter key on some devices with dynamic keypads.
///
/// The HTML `<input>` element is used to create interactive controls
/// for web-based forms in order to accept data from the user;
/// a wide variety of types of input data and control widgets are available,
/// depending on the device and user agent.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input)
open class InputSearch: BaseActiveElement, _StringInitializable, ChangeHandleable, InvalidHandleable, InputHandleable, SelectHandleable, SearchHandleable, Selectable, RangeTextable, SelectionRangeable {
    public override class var name: String { "input" }

    @State public var text: String = ""

    var inputEventHasNeverFired = true
    
    /// Convenience getter
    var _value: String? {
        domElement.value.string
    }

    func _updateStateWithValue() {
        guard let value = _value else { return }
        self.text = value
    }

    public required init() {
        super.init()
        onChange { [self] in
            guard inputEventHasNeverFired else { return }
            _updateStateWithValue()
        }
        onInput { [self] in
            inputEventHasNeverFired = false
            _updateStateWithValue()
        }
        setAttribute("type", "search")
        setAttribute("value", text)
    }
    
    /// String initializer
    /// - Parameter value: Pass `String` or `State<String>`
    public required convenience init<U>(_ value: U) where U: UniValue, U.UniValue == String {
        self.init()
        setAttribute("value", value.uniValue)
        self.text = value.uniValue
        if let state = value.uniStateValue {
            _text.merge(with: state, leftChanged: { [weak self] in
                self?.setAttribute("value", $0)
            }, rightChanged: { [weak self] in
                self?.setAttribute("value", $0)
            })
        } else {
            _text.listen { [weak self] in
                self?.setAttribute("value", $0)
            }
        }
    }
}

/// A button that submits the form.
///
/// The HTML `<input>` element is used to create interactive controls
/// for web-based forms in order to accept data from the user;
/// a wide variety of types of input data and control widgets are available,
/// depending on the device and user agent.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input)
open class InputSubmit: BaseActiveElement {
    public override class var name: String { "input" }

    public required init() {
        super.init()
        setAttribute("type", "submit")
    }
}

/// A control for entering a telephone number.
/// Displays a telephone keypad in some devices with dynamic keypads.
///
/// The HTML `<input>` element is used to create interactive controls
/// for web-based forms in order to accept data from the user;
/// a wide variety of types of input data and control widgets are available,
/// depending on the device and user agent.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input)
open class InputTel: BaseActiveElement, _StringInitializable, ChangeHandleable, InvalidHandleable, InputHandleable, SelectHandleable, SearchHandleable, Selectable, RangeTextable, SelectionRangeable {
    public override class var name: String { "input" }

    @State public var text: String = ""

    var inputEventHasNeverFired = true
    
    /// Convenience getter
    var _value: String? {
        domElement.value.string
    }

    func _updateStateWithValue() {
        guard let value = _value else { return }
        self.text = value
    }

    public required init() {
        super.init()
        onChange { [self] in
            guard inputEventHasNeverFired else { return }
            _updateStateWithValue()
        }
        onInput { [self] in
            inputEventHasNeverFired = false
            _updateStateWithValue()
        }
        setAttribute("type", "tel")
        setAttribute("value", text)
    }
    
    /// String initializer
    /// - Parameter value: Pass `String` or `State<String>`
    public required convenience init<U>(_ value: U) where U: UniValue, U.UniValue == String {
        self.init()
        setAttribute("value", value.uniValue)
        self.text = value.uniValue
        if let state = value.uniStateValue {
            _text.merge(with: state, leftChanged: { [weak self] in
                self?.setAttribute("value", $0)
            }, rightChanged: { [weak self] in
                self?.setAttribute("value", $0)
            })
        } else {
            _text.listen { [weak self] in
                self?.setAttribute("value", $0)
            }
        }
    }
}

/// A single-line text field.
/// Line-breaks are automatically removed from the input value.
///
/// The HTML `<input>` element is used to create interactive controls
/// for web-based forms in order to accept data from the user;
/// a wide variety of types of input data and control widgets are available,
/// depending on the device and user agent.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input)
open class InputText: BaseActiveElement, _StringInitializable, ChangeHandleable, InvalidHandleable, InputHandleable, SelectHandleable, SearchHandleable, Selectable, RangeTextable, SelectionRangeable {
    public override class var name: String { "input" }

    @State public var text: String = ""

    var inputEventHasNeverFired = true
    
    /// Convenience getter
    var _value: String? {
        domElement.value.string
    }

    func _updateStateWithValue() {
        guard let value = _value else { return }
        self.text = value
    }

    public required init() {
        super.init()
        onChange { [self] in
            guard inputEventHasNeverFired else { return }
            _updateStateWithValue()
        }
        onInput { [self] in
            inputEventHasNeverFired = false
            _updateStateWithValue()
        }
        setAttribute("type", "text")
        setAttribute("value", text)
    }
    
    /// String initializer
    /// - Parameter value: Pass `String` or `State<String>`
    public required convenience init<U>(_ value: U) where U: UniValue, U.UniValue == String {
        self.init()
        setAttribute("value", value.uniValue)
        self.text = value.uniValue
        if let state = value.uniStateValue {
            _text.merge(with: state, leftChanged: { [weak self] in
                self?.setAttribute("value", $0)
            }, rightChanged: { [weak self] in
                self?.setAttribute("value", $0)
            })
        } else {
            _text.listen { [weak self] in
                self?.setAttribute("value", $0)
            }
        }
    }
}

/// A control for entering a time value with no time zone.
///
/// The HTML `<input>` element is used to create interactive controls
/// for web-based forms in order to accept data from the user;
/// a wide variety of types of input data and control widgets are available,
/// depending on the device and user agent.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input)
open class InputTime: BaseActiveElement, _StringInitializable, ChangeHandleable, InvalidHandleable, InputHandleable, SelectHandleable, Selectable, RangeTextable, SelectionRangeable {
    public override class var name: String { "input" }

    @State public var text: String = ""

    var inputEventHasNeverFired = true
    
    /// Convenience getter
    var _value: String? {
        domElement.value.string
    }

    func _updateStateWithValue() {
        guard let value = _value else { return }
        self.text = value
    }

    public required init() {
        super.init()
        onChange { [self] in
            guard inputEventHasNeverFired else { return }
            _updateStateWithValue()
        }
        onInput { [self] in
            inputEventHasNeverFired = false
            _updateStateWithValue()
        }
        setAttribute("type", "time")
        setAttribute("value", text)
    }
    
    /// String initializer
    /// - Parameter value: Pass `String` or `State<String>`
    public required convenience init<U>(_ value: U) where U: UniValue, U.UniValue == String {
        self.init()
        setAttribute("value", value.uniValue)
        self.text = value.uniValue
        if let state = value.uniStateValue {
            _text.merge(with: state, leftChanged: { [weak self] in
                self?.setAttribute("value", $0)
            }, rightChanged: { [weak self] in
                self?.setAttribute("value", $0)
            })
        } else {
            _text.listen { [weak self] in
                self?.setAttribute("value", $0)
            }
        }
    }

    /// The HTMLInputElement.stepUp() method increments the value
    /// of a numeric type of  `<input>` element by the value of the step attribute,
    /// or the default step value if the step attribute is not explicitly set.
    /// The method, when invoked, increments the value by (step * n),
    /// where n defaults to 1 if not specified, and step defaults
    /// to the default value for step if not specified.
    public func stepUp(_ multiplier: Int = 1) {
        callFunction("stepUp", args: multiplier)
    }

    /// This method decrements the value of a numeric type of `<input>` element
    /// by the value of the step attribute or up to n multiples of the step attribute
    /// if a number is passed as the parameter.  The method, when invoked,
    /// decrements the value by (step * n), where n defaults to 1 if not specified,
    /// and step defaults to the default value for step if not specified.
    public func stepDown(_ multiplier: Int = 1) {
        callFunction("stepDown", args: multiplier)
    }
}

/// A field for entering a URL. Looks like a text input,
/// but has validation parameters and relevant keyboard
/// in supporting browsers and devices with dynamic keyboards.
///
/// The HTML `<input>` element is used to create interactive controls
/// for web-based forms in order to accept data from the user;
/// a wide variety of types of input data and control widgets are available,
/// depending on the device and user agent.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input)
open class InputURL: BaseActiveElement, _StringInitializable, ChangeHandleable, InvalidHandleable, InputHandleable, SelectHandleable, SearchHandleable, Selectable {
    public override class var name: String { "input" }

    @State public var text: String = ""

    var inputEventHasNeverFired = true
    
    /// Convenience getter
    var _value: String? {
        domElement.value.string
    }

    func _updateStateWithValue() {
        guard let value = _value else { return }
        self.text = value
    }

    @State var enteredText = ""

    public required init() {
        super.init()
        onChange { [self] in
            guard inputEventHasNeverFired else { return }
            _updateStateWithValue()
        }
        onInput { [self] in
            inputEventHasNeverFired = false
            _updateStateWithValue()
        }
        setAttribute("type", "url")
        setAttribute("value", text)
    }
    
    /// String initializer
    /// - Parameter value: Pass `String` or `State<String>`
    public required convenience init<U>(_ value: U) where U: UniValue, U.UniValue == String {
        self.init()
        setAttribute("value", value.uniValue)
        self.text = value.uniValue
        if let state = value.uniStateValue {
            _text.merge(with: state, leftChanged: { [weak self] in
                self?.setAttribute("value", $0)
            }, rightChanged: { [weak self] in
                self?.setAttribute("value", $0)
            })
        } else {
            _text.listen { [weak self] in
                self?.setAttribute("value", $0)
            }
        }
    }
}

/// A control for entering a date consisting of a week-year number and a week number with no time zone.
///
/// The HTML `<input>` element is used to create interactive controls
/// for web-based forms in order to accept data from the user;
/// a wide variety of types of input data and control widgets are available,
/// depending on the device and user agent.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input)
open class InputWeek: BaseActiveElement, _StringInitializable, ChangeHandleable, InvalidHandleable, InputHandleable, SelectHandleable, Selectable {
    public override class var name: String { "input" }

    @State public var text: String = ""

    var inputEventHasNeverFired = true
    
    /// Convenience getter
    var _value: String? {
        domElement.value.string
    }

    func _updateStateWithValue() {
        guard let value = _value else { return }
        self.text = value
    }

    public required init() {
        super.init()
        onChange { [self] in
            guard inputEventHasNeverFired else { return }
            _updateStateWithValue()
        }
        onInput { [self] in
            inputEventHasNeverFired = false
            _updateStateWithValue()
        }
        setAttribute("type", "week")
        setAttribute("value", text)
    }
    
    /// String initializer
    /// - Parameter value: Pass `String` or `State<String>`
    public required convenience init<U>(_ value: U) where U: UniValue, U.UniValue == String {
        self.init()
        setAttribute("value", value.uniValue)
        self.text = value.uniValue
        if let state = value.uniStateValue {
            _text.merge(with: state, leftChanged: { [weak self] in
                self?.setAttribute("value", $0)
            }, rightChanged: { [weak self] in
                self?.setAttribute("value", $0)
            })
        } else {
            _text.listen { [weak self] in
                self?.setAttribute("value", $0)
            }
        }
    }

    /// The HTMLInputElement.stepUp() method increments the value
    /// of a numeric type of  `<input>` element by the value of the step attribute,
    /// or the default step value if the step attribute is not explicitly set.
    /// The method, when invoked, increments the value by (step * n),
    /// where n defaults to 1 if not specified, and step defaults
    /// to the default value for step if not specified.
    public func stepUp(_ multiplier: Int = 1) {
        callFunction("stepUp", args: multiplier)
    }

    /// This method decrements the value of a numeric type of `<input>` element
    /// by the value of the step attribute or up to n multiples of the step attribute
    /// if a number is passed as the parameter.  The method, when invoked,
    /// decrements the value by (step * n), where n defaults to 1 if not specified,
    /// and step defaults to the default value for step if not specified.
    public func stepDown(_ multiplier: Int = 1) {
        callFunction("stepDown", args: multiplier)
    }
}

public typealias WLabel = Label

/// The HTML `<label>` element represents a caption for an item in a user interface.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/label)
open class Label: BaseActiveElement, _StringInitializable {
    @State public var text: String = ""
    
    /// String initializer
    /// - Parameter value: Pass `String` or `State<String>`
    public required convenience init<U>(_ value: U) where U: UniValue, U.UniValue == String {
        self.init()
        self.value = value.uniValue
        _text.wrappedValue = value.uniValue
        if let state = value.uniStateValue {
            _text.merge(with: state, leftChanged: { [weak self] in
                self?.value = $0
            }, rightChanged: { [weak self] in
                self?.value = $0
            })
        } else {
            _text.listen { [weak self] in
                self?.value = $0
            }
        }
    }
}

/// The HTML `<legend>` element represents a caption for the content of its parent fieldset.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/legend)
open class Legend: BaseActiveElement, _StringInitializable {
    @State public var text: String = ""
    
    /// String initializer
    /// - Parameter value: Pass `String` or `State<String>`
    public required convenience init<U>(_ value: U) where U: UniValue, U.UniValue == String {
        self.init()
        self.value = value.uniValue
        _text.wrappedValue = value.uniValue
        if let state = value.uniStateValue {
            _text.merge(with: state, leftChanged: { [weak self] in
                self?.value = $0
            }, rightChanged: { [weak self] in
                self?.value = $0
            })
        } else {
            _text.listen { [weak self] in
                self?.value = $0
            }
        }
    }
}

/// The HTML `<meter>` element represents either a scalar value within a known range or a fractional value.
///
/// Note: Unless the value attribute is between 0 and 1 (inclusive),
/// the min and max attributes should define the range so that the value attribute's value is within it.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/meter)
open class Meter: BaseActiveElement {
    @State public var value: Double = 0
    @State public var shadowText: String = ""

    public required convenience init<V, S>(_ value: V, _ shadowText: S) where V: UniValue, V.UniValue == Double, S: UniValue, S.UniValue == String {
        self.init()
        setAttribute("value", value.uniValue)
        self.value = value.uniValue
        if let state = value.uniStateValue {
            _value.merge(with: state, leftChanged: { [weak self] in
                self?.setAttribute("value", $0)
            }, rightChanged: { [weak self] in
                self?.setAttribute("value", $0)
            })
        } else {
            _value.listen { [weak self] in
                self?.setAttribute("value", $0)
            }
        }
        innerText = shadowText.uniValue
        self.shadowText = shadowText.uniValue
        if let state = shadowText.uniStateValue {
            _shadowText.merge(with: state, leftChanged: { [weak self] in
                self?.innerText = $0
            }, rightChanged: { [weak self] in
                self?.innerText = $0
            })
        } else {
            _shadowText.listen { [weak self] in
                self?.innerText = $0
            }
        }
    }
    
    public required convenience init<V>(_ value: V) where V: UniValue, V.UniValue == Double {
        self.init(value, String(value.uniValue))
    }
}

/// The HTML `<optgroup>` element creates a grouping of options within a select element.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/optgroup)
open class OptGroup: BaseActiveElement {
    @State public var label: String = ""
    
    /// String initializer
    /// - Parameter label: Pass `String` or `State<String>`
    public required convenience init<U>(_ label: U) where U: UniValue, U.UniValue == String {
        self.init()
        setAttribute("label", label.uniValue)
        self.label = label.uniValue
        if let state = label.uniStateValue {
            _label.merge(with: state, leftChanged: { [weak self] in
                self?.setAttribute("label", $0)
            }, rightChanged: { [weak self] in
                self?.setAttribute("label", $0)
            })
        } else {
            _label.listen { [weak self] in
                self?.setAttribute("label", $0)
            }
        }
    }
    
    /// Convenient initializer with DOM body
    /// - Parameters:
    ///   - label: Pass `String` or `State<String>`
    ///   - content: DOM body
    public convenience init<U>(_ label: U, @DOM content: @escaping DOM.Block) where U: UniValue, U.UniValue == String {
        self.init(label)
        parseDOMItem(content().domContentItem)
    }
}

/// The HTML `<option>` element is used to define an item contained in a select,
/// an optgroup, or a datalist element. As such, `<option>` can represent menu items
/// in popups and other lists of items in an HTML document.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/option)
open class Option: BaseActiveElement, _StringInitializable {
    @State public var text: String = ""
    
    /// String initializer
    /// - Parameter value: Pass `String` or `State<String>`
    public required convenience init<U>(_ value: U) where U: UniValue, U.UniValue == String {
        self.init()
        self.value = value.uniValue
        _text.wrappedValue = value.uniValue
        if let state = value.uniStateValue {
            _text.merge(with: state, leftChanged: { [weak self] in
                self?.value = $0
            }, rightChanged: { [weak self] in
                self?.value = $0
            })
        } else {
            _text.listen { [weak self] in
                self?.value = $0
            }
        }
    }
}

/// The HTML Output element `<output>` is a container element
/// into which a site or app can inject the results of a calculation or the outcome of a user action.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/output)
open class Output: BaseActiveElement {

}

public typealias WProgress = Progress

/// The HTML `<progress>` element displays an indicator
/// showing the completion progress of a task, typically displayed as a progress bar.
///
/// The max attribute, if present, must have a value greater than 0
/// and be a valid floating point number. The default value is 1.
///
/// Note: Unlike the `<meter>` element, the minimum value is always 0,
/// and the min attribute is not allowed for the `<progress>` element.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/progress)
open class Progress: BaseActiveElement {
    @State public var value: Double = 0
    @State public var shadowText: String = ""
    
    public required convenience init<V, S>(_ value: V, _ shadowText: S) where V: UniValue, V.UniValue == Double, S: UniValue, S.UniValue == String {
        self.init()
        setAttribute("value", value.uniValue)
        self.value = value.uniValue
        if let state = value.uniStateValue {
            _value.merge(with: state, leftChanged: { [weak self] in
                self?.setAttribute("value", $0)
            }, rightChanged: { [weak self] in
                self?.setAttribute("value", $0)
            })
        } else {
            _value.listen { [weak self] in
                self?.setAttribute("value", $0)
            }
        }
        innerText = shadowText.uniValue
        self.shadowText = shadowText.uniValue
        if let state = shadowText.uniStateValue {
            _shadowText.merge(with: state, leftChanged: { [weak self] in
                self?.innerText = $0
            }, rightChanged: { [weak self] in
                self?.innerText = $0
            })
        } else {
            _shadowText.listen { [weak self] in
                self?.innerText = $0
            }
        }
    }
    
    public required convenience init<V>(_ value: V) where V: UniValue, V.UniValue == Double {
        self.init(value, String(value.uniValue))
    }
}

/// The HTML `<select>` element represents a control that provides a menu of options
///
/// ```swift
/// Select($selectedAnimal) {
///     Option("Select animal")
///     OptGroup("In-Home") {
///         Option("Cat").value("cat")
///         Option("Dog").value("dog")
///     }
///     OptGroup("Outside") {
///         Option("Duck").value("duck")
///         Option("Horse").value("horse")
///     }
/// }
/// ```
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/select)
open class Select: BaseActiveElement, ChangeHandleable, ScrollHandleable {
    @State public var text: String = ""

    /// Convenience getter
    var _value: String? {
        domElement.value.string
    }

    func _updateStateWithValue() {
        guard let value = _value else { return }
        self.text = value
    }

    public required init() {
        super.init()
        onChange { [self] in
            _updateStateWithValue()
        }
        setAttribute("value", text)
    }

    public var value: String {
        domElement.value.string ?? ""
    }

    /// String initializer
    /// - Parameter value: Pass `String` or `State<String>`
    public required convenience init<U>(_ value: U) where U: UniValue, U.UniValue == String {
        self.init()
        setAttribute("value", value.uniValue)
        self.text = value.uniValue
        if let state = value.uniStateValue {
            _text.merge(with: state, leftChanged: { [weak self] in
                self?.setAttribute("value", $0)
            }, rightChanged: { [weak self] in
                self?.setAttribute("value", $0)
            })
        } else {
            _text.listen { [weak self] in
                self?.setAttribute("value", $0)
            }
        }
    }
    
    /// Convenience initializer
    /// - Parameters:
    ///   - value: Pass `String` or `State<String>`
    ///   - content: DOM closure
    public convenience init<U>(_ value: U, @DOM content: @escaping DOM.Block) where U: UniValue, U.UniValue == String {
        self.init(value)
        parseDOMItem(content().domContentItem)
    }

    public func checkValidity() {
        callFunction("checkValidity")
    }
}

/// The HTML `<textarea>` element represents a multi-line plain-text editing control,
/// useful when you want to allow users to enter a sizeable amount of free-form text,
/// for example a comment on a review or feedback form.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/textarea)
open class TextArea: BaseActiveElement, _StringInitializable, ChangeHandleable, InputHandleable, ScrollHandleable, SelectHandleable {
    @State public var text: String = ""

    var inputEventHasNeverFired = true
    
    /// Convenience getter
    var _value: String? {
        #if arch(wasm32)
        return domElement.value.string
        #else
        return nil
        #endif
    }

    func _updateStateWithValue() {
        guard let value = _value else { return }
        self.text = value
    }

    public required init() {
        super.init()
        onChange { [self] in
            guard inputEventHasNeverFired else { return }
            _updateStateWithValue()
        }
        onInput { [self] in
            inputEventHasNeverFired = false
            _updateStateWithValue()
        }
        setAttribute("type", "text")
        setAttribute("value", text)
    }
    
    /// String initializer
    /// - Parameter value: Pass `String` or `State<String>`
    public required convenience init<U>(_ value: U) where U: UniValue, U.UniValue == String {
        self.init()
        setAttribute("value", value.uniValue)
        self.text = value.uniValue
        if let state = value.uniStateValue {
            _text.merge(with: state, leftChanged: { [weak self] in
                self?.setAttribute("value", $0)
            }, rightChanged: { [weak self] in
                self?.setAttribute("value", $0)
            })
        } else {
            _text.listen { [weak self] in
                self?.setAttribute("value", $0)
            }
        }
    }
}

// MARK: - Image and multimedia

/// The HTML `<area>` element defines an area inside an image
/// map that has predefined clickable areas. An image map allows geometric areas
/// on an image to be associated with Hyperlink.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/area)
open class Area: BaseActiveElement {

}

/// The HTML `<audio>` element is used to embed sound content in documents.
/// It may contain one or more audio sources, represented using the src attribute
/// or the source element: the browser will choose the most suitable one.
/// It can also be the destination for streamed media, using a MediaStream.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/audio)
open class Audio: BaseActiveElement, AbortHandleable, CanPlayHandleable, CanPlayThroughHandleable, DurationChangeHandleable, EndedHandleable, LoadedDataHandleable, LoadedMetadataHandleable, LoadStartHandleable, PauseHandleable, PlayHandleable, PlayingHandleable, ProgressHandleable, RateChangeHandleable, SeekedHandleable, SeekingHandleable, StalledHandleable, SuspendHandleable, TimeUpdateHandleable, VolumeChangeHandleable, WaitingHandleable {
    
}

/// The HTML `<img>` element embeds an image into the document.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/img)
open class Img: BaseActiveElement, ErrorHandleable, LoadHandleable {
    
}

public typealias WMap = Map

/// The HTML `<map>` element is used with area elements to define an image map (a clickable link area).
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/map)
open class Map: BaseActiveElement {

}

/// The HTML `<track>` element is used as a child of the media elements, audio and video.
/// It lets you specify timed text tracks (or time-based data), for example to automatically handle subtitles.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/track)
open class Track: BaseActiveElement {

}

/// The HTML Video element (`<video>`) embeds a media player
/// which supports video playback into the document.
/// You can use `<video>` for audio content as well,
/// but the audio element may provide a more appropriate user experience.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/video)
open class Video: BaseActiveElement, AbortHandleable, CanPlayHandleable, CanPlayThroughHandleable, DurationChangeHandleable, EndedHandleable, LoadedDataHandleable, LoadedMetadataHandleable, LoadStartHandleable, PauseHandleable, PlayHandleable, PlayingHandleable, ProgressHandleable, RateChangeHandleable, SeekedHandleable, SeekingHandleable, StalledHandleable, SuspendHandleable, TimeUpdateHandleable, VolumeChangeHandleable, WaitingHandleable {
    
}

// MARK: - Inline text semantics

/// The HTML `<a>` element (or anchor element), with its href attribute, c
/// reates a hyperlink to web pages, files, email addresses,
/// locations in the same page, or anything else a URL can address.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a)
open class A: BaseActiveElement {

}

/// The HTML Abbreviation element (`<abbr>`) represents an abbreviation or acronym;
/// the optional title attribute can provide an expansion or description for the abbreviation.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/abbr)
open class Abbr: BaseActiveElement {

}

/// The HTML Bring Attention To element (`<b>`) is used to draw
/// the reader's attention to the element's contents,
/// which are not otherwise granted special importance.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/b)
open class B: BaseActiveElement {

}

/// The HTML Bidirectional Isolate element (`<bdi>`) tells the browser's bidirectional
/// algorithm to treat the text it contains in isolation from its surrounding text.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/bdi)
open class Bdi: BaseActiveElement {

}

/// The HTML Bidirectional Text Override element (`<bdo>`)
/// overrides the current directionality of text,
/// so that the text within is rendered in a different direction.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/bdo)
open class Bdo: BaseActiveElement {

}

/// The HTML `<br>` element produces a line break in text (carriage-return).
/// It is useful for writing a poem or an address, where the division of lines is significant.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/br)
open class Br: BaseActiveElement {

}

/// The HTML Citation element (`<cite>`) is used to describe a reference
/// to a cited creative work, and must include the title of that work.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/cite)
open class Cite: BaseActiveElement {

}

/// The HTML `<code>` element displays its contents styled
/// in a fashion intended to indicate that the text is a short fragment of computer code.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/code)
open class Code: BaseActiveElement {

}

/// The HTML `<data>` element links a given piece of content
/// with a machine-readable translation. If the content is time-
/// or date-related, the time element must be used.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/data)
open class Data: BaseActiveElement {

}

/// The HTML Definition element (`<dfn>`) is used to indicate the term
/// being defined within the context of a definition phrase or sentence.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/dfn)
open class Dfn: BaseActiveElement {

}

/// The HTML `<em>` element marks text that has stress emphasis.
/// The `<em>` element can be nested, with each level of nesting indicating a greater degree of emphasis.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/em)
open class Em: BaseActiveElement {

}

/// The HTML Idiomatic Text element (`<i>`) represents a range of text
/// that is set off from the normal text for some reason, such as idiomatic text,
/// technical terms, taxonomical designations, among others.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/i)
open class I: BaseActiveElement {

}

/// The HTML Keyboard Input element (`<kbd>`) represents a span of inline text
/// denoting textual user input from a keyboard, voice input, or any other text entry device.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/kbd)
open class Kbd: BaseActiveElement {

}

/// The HTML Mark Text element (`<mark>`) represents text
/// which is marked or highlighted for reference or notation purposes,
/// due to the marked passage's relevance or importance in the enclosing context.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/mark)
open class Mark: BaseActiveElement {

}

/// The HTML `<q>` element indicates that the enclosed text is a short inline quotation.
/// Most modern browsers implement this by surrounding the text in quotation marks.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/q)
open class Q: BaseActiveElement {

}

/// The HTML Ruby Base (`<rb>`) element is used to delimit
/// the base text component of a  ruby annotation, i.e. the text that is being annotated.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/rb)
open class Rb: BaseActiveElement {

}

/// The HTML Ruby Fallback Parenthesis (`<rp>`) element is used
/// to provide fall-back parentheses for browsers
/// that do not support display of ruby annotations using the ruby element.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/rp)
open class Rp: BaseActiveElement {

}

/// The HTML Ruby Text (`<rt>`) element specifies the ruby text component
/// of a ruby annotation, which is used to provide pronunciation,
/// translation, or transliteration information for East Asian typography.
/// The `<rt>` element must always be contained within a ruby element.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/rt)
open class Rt: BaseActiveElement {

}

/// The HTML Ruby Text Container (`<rtc>`) element embraces semantic annotations
/// of characters presented in a ruby of rb elements used inside of ruby element.
/// rb elements can have both pronunciation (rt) and semantic (rtc) annotations.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/rtc)
open class Rtc: BaseActiveElement {

}

/// The HTML `<ruby>` element represents small annotations that are rendered above,
/// below, or next to base text, usually used for showing the pronunciation of East Asian characters.
/// It can also be used for annotating other kinds of text, but this usage is less common.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/ruby)
open class Ruby: BaseActiveElement {

}

/// The HTML `<s>` element renders text with a strikethrough,
/// or a line through it. Use the `<s>` element to represent things
/// that are no longer relevant or no longer accurate.
/// However, `<s>` is not appropriate when indicating document edits;
/// for that, use the del and ins elements, as appropriate.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/s)
open class S: BaseActiveElement {

}

/// The HTML Sample Element (`<samp>`) is used to enclose inline text
/// which represents sample (or quoted) output from a computer program.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/samp)
open class Samp: BaseActiveElement {

}

/// The HTML `<small>` element represents side-comments and small print,
/// like copyright and legal text, independent of its styled presentation.
/// By default, it renders text within it one font-size smaller, such as from small to x-small.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/small)
open class Small: BaseActiveElement {

}

/// The HTML `<span>` element is a generic inline container for phrasing content,
/// which does not inherently represent anything.
/// It can be used to group elements for styling purposes (using the class or id attributes),
/// or because they share attribute values, such as lang.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/span)
open class Span: BaseActiveElement {

}

/// The HTML Strong Importance Element (`<strong>`) indicates
/// that its contents have strong importance, seriousness, or urgency.
/// Browsers typically render the contents in bold type.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/strong)
open class Strong: BaseActiveElement {

}

/// The HTML Subscript element (`<sub>`) specifies inline text
/// which should be displayed as subscript for solely typographical reasons.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/sub)
open class Sub: BaseActiveElement {

}

/// The HTML Superscript element (`<sup>`) specifies inline text
/// which is to be displayed as superscript for solely typographical reasons.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/sup)
open class Sup: BaseActiveElement {

}

/// The HTML `<time>` element represents a specific period in time.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/time)
open class Time: BaseActiveElement {

}

/// The HTML Unarticulated Annotation element (`<u>`)
/// represents a span of inline text which should be rendered
/// in a way that indicates that it has a non-textual annotation.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/u)
open class U: BaseActiveElement {

}

/// The HTML Variable element (`<var>`) represents the name of a variable
/// in a mathematical expression or a programming context.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/var)
open class Var: BaseActiveElement {

}

/// The HTML `<wbr>` element represents a word break opportunity—a position
/// within text where the browser may optionally break a line,
/// though its line-breaking rules would not otherwise create a break at that location.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/wbr)
open class Wbr: BaseActiveElement {

}

// MARK: - Interactive elements

/// The HTML Details Element (`<details>`) creates a disclosure widget
/// in which information is visible only when the widget is toggled into an "open" state.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/details)
open class Details: BaseActiveElement, ToggleHandleable {

}

/// The HTML `<dialog>` element represents a dialog box
/// or other interactive component, such as a dismissable alert, inspector, or subwindow.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/dialog)
open class Dialog: BaseActiveElement {

}

/// The HTML `<menu>` element represents a group of commands that a user can perform or activate.
/// This includes both list menus, which might appear across the top of a screen,
/// as well as context menus, such as those that might appear underneath a button after it has been clicked.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/menu)
open class Menu: BaseActiveElement, ScrollHandleable, ShowHandleable {

}

/// The HTML Disclosure Summary element (`<summary>`) element specifies
/// a summary, caption, or legend for a details element's disclosure box.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/summary)
open class Summary: BaseActiveElement {

}

// MARK: - SVG / Animation elements

/// Use the HTML `<canvas>` element with either the canvas scripting API
/// or the WebGL API to draw graphics and animations.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/canvas)
open class Canvas: BaseElement {

}

/// The HTML `<noscript>` element defines a section of HTML to be inserted
/// if a script type on the page is unsupported or if scripting is currently turned off in the browser.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/noscript)
open class NoScript: BaseElement {

}

/// The HTML `<script>` element is used to embed executable code or data;
/// this is typically used to embed or refer to JavaScript code.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/script)
open class Script: BaseElement, ErrorHandleable, LoadHandleable {
    open func addedToDocument() {}
}

/// The HTML `<body>` Element represents the content of an HTML document.
/// There can be only one `<body>` element in a document.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/body)
open class Body: BaseElement, AfterPrintHandleable, BeforePrintHandleable, BeforeUnloadHandleable, HashChangeHandleable, OfflineHandleable, OnlineHandleable, PageHideHandleable, PageShowHandleable, ResizeHandleable, UnloadHandleable, ScrollHandleable, LoadHandleable {
    
}

/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/animate
open class SVGAnimate: BaseActiveElement {

}

/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/animateMotion
open class SVGAnimateMotion: BaseActiveElement {

}

/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/animateTransform
open class SVGAnimateTransform: BaseActiveElement {

}

/// The `<discard>` SVG element allows authors to specify the time at which
/// particular elements are to be discarded, thereby reducing the resources
/// required by an SVG user agent. This is particularly useful to help SVG viewers
/// conserve memory while displaying long-running documents.
///
/// The `<discard>` element may occur wherever the `<animate>` element may.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/discard
open class SVGDiscard: BaseActiveElement {

}

/// The `<mpath>` sub-element for the `<animateMotion>` element
/// provides the ability to reference an external `<path>` element as the definition of a motion path.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/mpath
open class SVGMPath: BaseActiveElement {

}

/// The SVG `<set>` element provides a simple means of just setting the value of an attribute for a specified duration.
///
/// It supports all attribute types, including those that cannot reasonably be interpolated,
/// such as string and boolean values.
/// For attributes that can be reasonably be interpolated, the `<animate>` is usualy prefered.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/set
open class SVGSet: BaseActiveElement {

}

// MARK: - SVG / Basic shapes

/// The `<ellipse>` element is an SVG basic shape, used to create ellipses based on a center coordinate, and both their x and y radius.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/ellipse
open class SVGEllipse: BaseActiveElement {

}

/// The `<line>` element is an SVG basic shape used to create a line connecting two points.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/line
open class Line: BaseActiveElement {

}

/// The `<polygon>` element defines a closed shape consisting of a set of connected straight line segments.
/// The last point is connected to the first point.
///
/// For open shapes, see the `<polyline>` element.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/polygon
open class SVGPolygon: BaseActiveElement {

}

/// The `<polyline>` SVG element is an SVG basic shape that creates straight lines connecting several points.
/// Typically a polyline is used to create open shapes as the last point doesn't have to be connected to the first point.
/// For closed shapes see the `<polygon>` element.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/polyline
open class SVGPolyline: BaseActiveElement {

}

/// The `<rect>` element is a basic SVG shape that draws rectangles,
/// defined by their position, width, and height.
/// The rectangles may have their corners rounded.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/rect
open class SVGRect: BaseActiveElement {

}

/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/circle
open class SVGСircle: BaseActiveElement {

}

// MARK: - SVG / Container elements

/// The svg element is a container that defines a new coordinate system and viewport.
/// It is used as the outermost element of SVG documents,
/// but it can also be used to embed an SVG fragment inside an SVG or HTML document.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/svg
open class Svg: BaseActiveElement {

}

/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/a
open class SVGA: A {

}

/// The The `<defs>` element is used to store graphical objects that will be used at a later time.
/// Objects created inside a `<defs>` element are not rendered directly.
/// To display them you have to reference them (with a `<use>` element for example).
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/defs
open class SVGDefs: BaseActiveElement {

}

/// The `<g>` SVG element is a container used to group other SVG elements.
///
/// Transformations applied to the `<g>` element are performed on its child elements,
/// and its attributes are inherited by its children.
/// It can also group multiple elements to be referenced later with the `<use>` element.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/g
open class SVGG: BaseActiveElement {

}

/// The `<marker>` element defines the graphic that is to be used
/// for drawing arrowheads or polymarkers on a given `<path>`, `<line>`, `<polyline>` or `<polygon>` element.
///
/// Markers are attached to shapes using the marker-start, marker-mid, and marker-end properties.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/marker
open class SVGMarker: BaseActiveElement {

}

/// The `<mask>` element defines an alpha mask for compositing the current object into the background.
/// A mask is used/referenced using the mask property.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/mask
open class SVGMask: BaseActiveElement {

}

/// The `<pattern>` element defines a graphics object which can be redrawn
/// at repeated x- and y-coordinate intervals ("tiled") to cover an area.
///
/// The `<pattern>` is referenced by the fill and/or stroke attributes on other graphics elements
/// to fill or stroke those elements with the referenced pattern.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/pattern
open class SVGPattern: BaseActiveElement {

}

/// The `<switch>` SVG element evaluates any requiredFeatures, requiredExtensions
/// and systemLanguage attributes on its direct child elements in order,
/// and then renders the first child where these attributes evaluate to true.
/// Other direct children will be bypassed and therefore not rendered.
/// If a child element is a container element, like `<g>`,
/// then its subtree is also processed/rendered or bypassed/not rendered.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/switch
open class Switch: BaseActiveElement {

}

/// The `<symbol>` element is used to define graphical template objects
/// which can be instantiated by a `<use>` element.
///
/// The use of symbol elements for graphics that are used multiple times
/// in the same document adds structure and semantics.
/// Documents that are rich in structure may be rendered graphically,
/// as speech, or as Braille, and thus promote accessibility.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/symbol
open class SVGSymbol: BaseActiveElement {

}

// MARK: - SVG / Descriptive elements

/// The `<desc>` element provides an accessible, long-text description of any SVG container element or graphics element.
///
/// Text in a `<desc>` element is not rendered as part of the graphic.
/// If the element can be described by visible text, it is possible to reference that text
/// with the aria-describedby attribute. If aria-describedby is used, it will take precedence over `<desc>`.
///
/// The hidden text of a `<desc>` element can also be concatenated with the visible text
/// of other elements using multiple IDs in an aria-describedby value.
/// In that case, the `<desc>` element must provide an ID for reference.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/desc
open class SVGDesc: BaseActiveElement {

}

/// The `<metadata>` SVG element adds metadata to SVG content.
/// Metadata is structured information about data.
/// The contents of `<metadata>` should be elements from other XML namespaces such as RDF, FOAF, etc.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/metadata
open class SVGMetadata: BaseActiveElement {

}

/// The `<title>` element provides an accessible, short-text description of any SVG container element or graphics element.
///
/// Text in a `<title>` element is not rendered as part of the graphic,
/// but browsers usually display it as a tooltip. If an element can be described by visible text,
/// it is recommended to reference that text with an aria-labelledby attribute
/// rather than using the `<title>` element.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/title
open class SVGTitle: BaseElement {

}

// MARK: - SVG / Filter primitive elements

/// The `<feBlend>` SVG filter primitive composes two objects together
/// ruled by a certain blending mode. This is similar to what is known
/// from image editing software when blending two layers.
/// The mode is defined by the mode attribute.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/feBlend
open class SVGFEBlend: BaseActiveElement {

}

/// The `<feColorMatrix>` SVG filter element changes colors based on a transformation matrix.
/// Every pixel's color value [R,G,B,A] is matrix multiplied by a 5 by 5 color matrix to create new color [R',G',B',A'].
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/feColorMatrix
open class SVGFEColorMatrix: BaseActiveElement {

}

/// The `<feComponentTransfer>` SVG filter primitive performs color-component-wise remapping
/// of data for each pixel. It allows operations like brightness adjustment,
/// contrast adjustment, color balance or thresholding.
///
/// The calculations are performed on non-premultiplied color values.
/// The colors are modified by changing each channel (R, G, B, and A) to the result
/// of what the children `<feFuncR>`, `<feFuncB>`, `<feFuncG>`, and `<feFuncA>` return.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/feComponentTransfer
open class SVGFEComponentTransfer: BaseActiveElement {

}

/// The `<feComposite>` SVG filter primitive performs the combination of two input images pixel-wise
/// in image space using one of the Porter-Duff compositing operations: over, in, atop, out, xor, and lighter.
/// Additionally, a component-wise arithmetic operation (with the result clamped between [0..1]) can be applied.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/feComposite
open class SVGFEComposite: BaseActiveElement {

}

/// The `<feConvolveMatrix>` SVG filter primitive applies a matrix convolution filter effect.
/// A convolution combines pixels in the input image with neighboring pixels to produce a resulting image.
/// A wide variety of imaging operations can be achieved through convolutions,
/// including blurring, edge detection, sharpening, embossing and beveling.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/feConvolveMatrix
open class SVGFEConvolveMatrix: BaseActiveElement {

}

/// The `<feDiffuseLighting>` SVG filter primitive lights an image using the alpha channel as a bump map.
/// The resulting image, which is an RGBA opaque image, depends on the light color,
/// light position and surface geometry of the input bump map.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/feDiffuseLighting
open class SVGFEDiffuseLighting: BaseActiveElement {

}

/// The `<feDisplacementMap>` SVG filter primitive uses the pixel values
/// from the image from in2 to spatially displace the image from in.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/feDisplacementMap
open class SVGFEDisplacementMap: BaseActiveElement {

}

/// The `<feDistantLight>` filter primitive defines a distant light source that can be used
/// within a lighting filter primitive: `<feDiffuseLighting>` or `<feSpecularLighting>`.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/feDistantLight
open class SVGFEDistantLight: BaseActiveElement {

}

/// The SVG `<feDropShadow>` filter primitive creates a drop shadow of the input image.
/// It can only be used inside a `<filter>` element.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/feDropShadow
open class SVGFEDropShadow: BaseActiveElement {

}

/// The `<feFlood>` SVG filter primitive fills the filter subregion
/// with the color and opacity defined by flood-color and flood-opacity.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/feFlood
open class SVGFEFlood: BaseActiveElement {

}

/// The `<feFuncA>` SVG filter primitive defines the transfer function
/// for the alpha component of the input graphic of its parent `<feComponentTransfer>` element.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/feFuncA
open class SVGFEFuncA: BaseActiveElement {

}

/// The `<feFuncB>` SVG filter primitive defines the transfer function
/// for the blue component of the input graphic of its parent `<feComponentTransfer>` element.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/feFuncB
open class SVGFEFuncB: BaseActiveElement {

}

/// The `<feFuncG>` SVG filter primitive defines the transfer function
/// for the green component of the input graphic of its parent `<feComponentTransfer>` element.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/feFuncG
open class SVGFEFuncG: BaseActiveElement {

}

/// The `<feFuncR>` SVG filter primitive defines the transfer function
/// for the red component of the input graphic of its parent `<feComponentTransfer>` element.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/feFuncR
open class SVGFEFuncR: BaseActiveElement {

}

/// The `<feGaussianBlur>` SVG filter primitive blurs the input image
/// by the amount specified in stdDeviation, which defines the bell-curve.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/feGaussianBlur
open class SVGFEGaussianBlur: BaseActiveElement {

}

/// The `<feImage>` SVG filter primitive fetches image data from an external source
/// and provides the pixel data as output (meaning if the external source is an SVG image, it is rasterized.)
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/feImage
open class SVGFEImage: BaseActiveElement {

}

/// The `<feMerge>` SVG element allows filter effects
/// to be applied concurrently instead of sequentially.
/// This is achieved by other filters storing their output
/// via the result attribute and then accessing it in a `<feMergeNode>` child.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/feMerge
open class SVGFEMerge: BaseActiveElement {

}

/// The feMergeNode takes the result of another filter to be processed by its parent `<feMerge>`.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/feMergeNode
open class SVGFEMergeNode: BaseActiveElement {

}

/// The `<feMorphology>` SVG filter primitive is used to erode or dilate the input image.
/// Its usefulness lies especially in fattening or thinning effects.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/feMorphology
open class SVGFEMorphology: BaseActiveElement {

}

/// The `<feOffset>` SVG filter primitive allows to offset the input image.
/// The input image as a whole is offset by the values specified in the dx and dy attributes.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/feOffset
open class SVGFEOffset: BaseActiveElement {

}

/// The `<fePointLight>` filter primitive defines a light source which allows
/// to create a point light effect. It that can be used
/// within a lighting filter primitive: `<feDiffuseLighting>` or `<feSpecularLighting>`.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/fePointLight
open class SVGFEPointLight: BaseActiveElement {

}

/// The `<feSpecularLighting>` SVG filter primitive lights a source graphic
/// using the alpha channel as a bump map. The resulting image is an RGBA image
/// based on the light color. The lighting calculation follows the standard specular component
/// of the Phong lighting model. The resulting image depends on the light color,
/// light position and surface geometry of the input bump map.
/// The result of the lighting calculation is added.
/// The filter primitive assumes that the viewer is at infinity in the z direction.
///
/// This filter primitive produces an image which contains the specular reflection part
/// of the lighting calculation. Such a map is intended to be combined with a texture
/// using the add term of the arithmetic `<feComposite>` method.
/// Multiple light sources can be simulated by adding several of these light maps
/// before applying it to the texture image.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/feSpecularLighting
open class SVGFESpecularLighting: BaseActiveElement {

}

/// The `<feSpotLight>` SVG filter primitive defines a light source
/// which allows to create a spotlight effect.
/// It that can be used within a lighting filter primitive: `<feDiffuseLighting>` or `<feSpecularLighting>`.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/feSpotLight
open class SVGFESpotLight: BaseActiveElement {

}

/// The `<feTile>` SVG filter primitive allows to fill a target rectangle
/// with a repeated, tiled pattern of an input image.
/// The effect is similar to the one of a `<pattern>`.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/feTile
open class SVGFETile: BaseActiveElement {

}

/// The `<feTurbulence>` SVG filter primitive creates an image using the Perlin turbulence function.
/// It allows the synthesis of artificial textures like clouds or marble.
/// The resulting image will fill the entire filter primitive subregion.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/feTurbulence
open class SVGFETurbulence: BaseActiveElement {

}

// MARK: - SVG / Gradient elements

/// The `<linearGradient>` element lets authors define linear gradients
/// that can be applied to fill or stroke of graphical elements.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/linearGradient
open class LinearGradient: BaseActiveElement {

}

/// The `<radialGradient>` element lets authors define radial gradients
/// that can be applied to fill or stroke of graphical elements.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/radialGradient
open class SVGRadialGradient: BaseActiveElement {

}

/// The SVG `<stop>` element defines a color and its position to use on a gradient.
/// This element is always a child of a `<linearGradient>` or `<radialGradient>` element.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/stop
open class SVGStop: BaseActiveElement {

}

// MARK: - SVG / Graphics elements

/// The `<image>` SVG element includes images inside SVG documents.
/// It can display raster image files or other SVG files.
///
/// The only image formats SVG software must support are JPEG, PNG, and other SVG files.
/// Animated GIF behavior is undefined.
///
/// SVG files displayed with `<image>` are treated as an image: external resources aren't loaded,
/// :visited styles aren't applied, and they cannot be interactive.
/// To include dynamic SVG elements, try `<use>` with an external URL.
/// To include SVG files and run scripts inside them, try `<object>` inside of `<foreignObject>`.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/image
open class SVGImage: BaseActiveElement {

}

/// The `<path>` SVG element is the generic element to define a shape.
/// All the basic shapes can be created with a path element.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/path
open class Path: BaseActiveElement {

}

/// The SVG `<text>` element draws a graphics element consisting of text.
/// It's possible to apply a gradient, pattern, clipping path, mask,
/// or filter to `<text>`, like any other SVG graphics element.
///
/// If text is included in SVG not inside of a `<text>` element, it is not rendered.
/// This is different than being hidden by default, as setting the display property won't show the text.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/text
open class SVGText: BaseActiveElement {
    public convenience init (_ text: String) {
        self.init()
        value = text
    }

    var value: String {
        get { innerText }
        set { innerText = newValue }
    }
}

/// The `<use>` element takes nodes from within the SVG document,
/// and duplicates them somewhere else.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/use
open class SVGUse: BaseActiveElement {

}

// MARK: - SVG / Never-rendered elements

/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/clipPath
open class SVGClipPath: BaseActiveElement {

}

/// The `<hatch>` SVG element is used to fill or stroke an object using
/// one or more pre-defined paths that are repeated at fixed intervals
/// in a specified direction to cover the areas to be painted.
///
/// Hatches defined by the `<hatch>` element can then referenced
/// by the fill and stroke CSS properties on a given graphics element
/// to indicate that the given element shall be filled or stroked with the hatch.
/// Paths are defined by `<hatchpath>` elements.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/hatch
open class SVGHatch: BaseActiveElement {

}

/// The `<hatchpath>` SVG element defines a hatch path used by the `<hatch>` element.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/hatchpath
open class SVGHatchPath: BaseActiveElement {

}

/// The SVG script element allows to add scripts to an SVG document.
///
/// While SVG's script element is equivalent to the HTML `<script>` element,
/// it has some discrepancies, like it uses the href attribute instead of src
/// and it doesn't support ECMAScript modules so far (See browser compatibility below for details)
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/script
open class SVGScript: BaseElement {

}

/// The SVG `<style>` element allows style sheets to be embedded directly within SVG content.
///
/// SVG's style element has the same attributes
/// as the corresponding element in HTML (see HTML's `<style>` element).
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/style
open class SVGStyle: Style {

}

// MARK: - SVG / Text content elements

/// To render text along the shape of a `<path>`, enclose the text
/// in a `<textPath>` element that has an href attribute with a reference to the `<path>` element.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/textPath
open class SVGTextPath: BaseActiveElement {

}

/// The SVG `<tspan>` element defines a subtext within a `<text>` element or another `<tspan>` element.
/// It allows for adjustment of the style and/or position of that subtext as needed.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/tspan
open class SVGTSpan: BaseActiveElement {

}

// MARK: - SVG / Other elements

/// The `<filter>` SVG element defines a custom filter effect by grouping atomic filter primitives.
/// It is never rendered itself, but must be used by the filter attribute on SVG elements,
/// or the filter CSS property for SVG/HTML elements.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/filter
open class SVGFilter: BaseActiveElement {

}

/// The `<foreignObject>` SVG element includes elements from a different XML namespace.
/// In the context of a browser, it is most likely (X)HTML.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/foreignObject
open class ForeignObject: BaseActiveElement {

}

/// A view is a defined way to view the image, like a zoom level or a detail view.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/view
open class SVGView: BaseActiveElement {

}

// MARK: - Table content

/// The HTML `<caption>` element specifies the caption (or title) of a table.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/caption)
open class Caption: BaseActiveElement, ScrollHandleable {

}

/// The HTML `<col>` element defines a column within a table
/// and is used for defining common semantics on all common cells.
/// It is generally found within a colgroup element.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/col)
open class Col: BaseActiveElement {

}

/// The HTML `<colgroup>` element defines a group of columns within a table.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/colgroup)
open class ColGroup: BaseActiveElement {

}

/// The HTML `<table>` element represents tabular data — that is,
/// information presented in a two-dimensional table comprised
/// of rows and columns of cells containing data.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/table)
open class Table: BaseActiveElement {

}

/// The HTML Table Body element (`<tbody>`) encapsulates a set
/// of table rows (tr elements), indicating that they comprise the body of the table (table).
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/tbody)
open class TBody: BaseActiveElement, ScrollHandleable {

}

/// The HTML `<td>` element defines a cell of a table that contains data.
/// It participates in the table model.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/td)
open class Td: BaseActiveElement {

}

/// The HTML `<tfoot>` element defines a set of rows summarizing the columns of the table.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/tfoot)
open class TFoot: BaseActiveElement, ScrollHandleable {

}

/// The HTML `<th>` element defines a cell as header of a group of table cells.
/// The exact nature of this group is defined by the scope and headers attributes.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/th)
open class Th: BaseActiveElement {

}

/// The HTML `<thead>` element defines a set of rows defining the head of the columns of the table.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/thead)
open class THead: BaseActiveElement, ScrollHandleable {

}

/// The HTML `<tr>` element defines a row of cells in a table.
/// The row's cells can then be established using a mix of td (data cell) and th (header cell) elements.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/tr)
open class Tr: BaseActiveElement {

}

// MARK: - Text content

/// The HTML `<blockquote>` Element (or HTML Block Quotation Element) indicates
/// that the enclosed text is an extended quotation.
/// Usually, this is rendered visually by indentation (see Notes for how to change it).
/// A URL for the source of the quotation may be given using the cite attribute,
/// while a text representation of the source can be given using the cite element.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/blockquote)
open class BlockQuote: BaseActiveElement, _StringInitializable, ScrollHandleable {
    var value: String {
        get { innerText }
        set { innerText = newValue }
    }

    /// String initializer
    /// - Parameter title: Pass `String` or `State<String>`
    required public convenience init <U>(_ title: U) where U: UniValue, U.UniValue == String {
        self.init()
        value = title.uniValue
        title.uniStateValue?.listen {
            self.value = $0
        }
    }
}

/// The HTML `<dd>` element provides the description, definition,
/// or value for the preceding term (dt) in a description list (dl).
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/dd)
open class Dd: BaseActiveElement, _StringInitializable, ScrollHandleable {
    var value: String {
        get { innerText }
        set { innerText = newValue }
    }

    /// String initializer
    /// - Parameter title: Pass `String` or `State<String>`
    required public convenience init <U>(_ title: U) where U: UniValue, U.UniValue == String {
        self.init()
        value = title.uniValue
        title.uniStateValue?.listen {
            self.value = $0
        }
    }
}

/// The HTML Content Division element `<div>` is the generic container for flow content.
/// It has no effect on the content or layout until styled
/// in some way using CSS (e.g. styling is directly applied to it,
/// or some kind of layout model like Flexbox is applied to its parent element).
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/div)
open class Div: BaseActiveElement, _StringInitializable, ScrollHandleable {
    var value: String {
        get { innerText }
        set { innerText = newValue }
    }

    /// String initializer
    /// - Parameter title: Pass `String` or `State<String>`
    required public convenience init <U>(_ title: U) where U: UniValue, U.UniValue == String {
        self.init()
        value = title.uniValue
        title.uniStateValue?.listen {
            self.value = $0
        }
    }
}

/// The HTML `<dl>` element represents a description list.
/// The element encloses a list of groups of terms (specified using the dt element)
/// and descriptions (provided by dd elements). Common uses for this element
/// are to implement a glossary or to display metadata (a list of key-value pairs).
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/dl)
open class Dl: BaseActiveElement, ScrollHandleable {

}

/// The HTML `<dt>` element specifies a term in a description or definition list,
/// and as such must be used inside a dl element.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/dt)
open class Dt: BaseActiveElement, _StringInitializable, ScrollHandleable {
    var value: String {
        get { innerText }
        set { innerText = newValue }
    }

    /// String initializer
    /// - Parameter title: Pass `String` or `State<String>`
    required public convenience init <U>(_ title: U) where U: UniValue, U.UniValue == String {
        self.init()
        value = title.uniValue
        title.uniStateValue?.listen {
            self.value = $0
        }
    }
}

/// The HTML `<figcaption>` or Figure Caption element represents a caption
/// or legend describing the rest of the contents of its parent figure element.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/figcaption)
open class FigCaption: BaseActiveElement, _StringInitializable {
    var value: String {
        get { innerText }
        set { innerText = newValue }
    }

    /// String initializer
    /// - Parameter title: Pass `String` or `State<String>`
    required public convenience init <U>(_ title: U) where U: UniValue, U.UniValue == String {
        self.init()
        value = title.uniValue
        title.uniStateValue?.listen {
            self.value = $0
        }
    }
}

/// The HTML `<figure>` (Figure With Optional Caption) element
/// represents self-contained content, potentially with an optional caption,
/// which is specified using the (figcaption) element.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/figure)
open class Figure: BaseActiveElement {

}

/// The HTML `<hr>` element represents a thematic break
/// between paragraph-level elements: for example,
/// a change of scene in a story, or a shift of topic within a section.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/hr)
open class Hr: BaseActiveElement {

}

/// The HTML `<li>` element is used to represent an item in a list.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/li)
open class Li: BaseActiveElement, _StringInitializable, ScrollHandleable {
    var value: String {
        get { innerText }
        set { innerText = newValue }
    }

    /// String initializer
    /// - Parameter title: Pass `String` or `State<String>`
    required public convenience init <U>(_ title: U) where U: UniValue, U.UniValue == String {
        self.init()
        value = title.uniValue
        title.uniStateValue?.listen {
            self.value = $0
        }
    }
}

/// The HTML `<ol>` element represents an ordered list of items — typically rendered as a numbered list.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/ol)
open class Ol: BaseActiveElement, ScrollHandleable {

}

/// The HTML `<p>` element represents a paragraph.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/p)
open class P: BaseActiveElement, _StringInitializable, ScrollHandleable {
    var value: String {
        get { innerText }
        set { innerText = newValue }
    }

    /// String initializer
    /// - Parameter title: Pass `String` or `State<String>`
    required public convenience init <U>(_ title: U) where U: UniValue, U.UniValue == String {
        self.init()
        value = title.uniValue
        title.uniStateValue?.listen {
            self.value = $0
        }
    }
}

/// The HTML `<pre>` element represents preformatted text
/// which is to be presented exactly as written in the HTML file.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/pre)
open class Pre: BaseActiveElement, _StringInitializable, ScrollHandleable {
    var value: String {
        get { innerText }
        set { innerText = newValue }
    }
    
    /// String initializer
    /// - Parameter title: Pass `String` or `State<String>`
    required public convenience init <U>(_ title: U) where U: UniValue, U.UniValue == String {
        self.init()
        value = title.uniValue
        title.uniStateValue?.listen {
            self.value = $0
        }
    }
}

/// The HTML `<ul>` element represents an unordered list of items,
/// typically rendered as a bulleted list.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/ul)
open class Ul: BaseActiveElement, ScrollHandleable {

}

// MARK: - Web components

/// The HTML `<slot>` element—part of the Web Components technology suite—is a placeholder
/// inside a web component that you can fill with your own markup,
/// which lets you create separate DOM trees and present them together.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/slot)
open class Slot: BaseActiveElement {

}

/// The HTML Content Template (`<template>`) element is a mechanism
/// for holding HTML that is not to be rendered immediately
/// when a page is loaded but may be instantiated subsequently during runtime using JavaScript.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/template)
open class Template: BaseActiveElement {

}
