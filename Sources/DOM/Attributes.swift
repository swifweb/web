//
//  Attributes.swift
//  DOM
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation
import WebFoundation

// MARK: - AcceptAttrable

public protocol AcceptAttrable: DOMElement {
    @discardableResult
    func accept(_ value: [String]) -> Self
    @discardableResult
    func accept(_ value: String...) -> Self
    @discardableResult
    func accept<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
    @discardableResult
    func accept<S>(_ value: S) -> Self where S: StateConvertible, S.Value == [String]
}

extension AcceptAttrable {
    /// List of types the server accepts, typically a file type.
    ///
    /// Applicable to `<form>` and `<input>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/accept)
    @discardableResult
    private func accept(value: String) -> Self {
        setAttribute("accept", value)
        return self
    }
    
    /// List of types the server accepts, typically a file type.
    ///
    /// Applicable to `<form>` and `<input>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/accept)
    @discardableResult
    public func accept(_ value: [String]) -> Self {
        accept(value: value.joined(separator: ","))
    }
    
    /// List of types the server accepts, typically a file type.
    ///
    /// Applicable to `<form>` and `<input>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/accept)
    @discardableResult
    public func accept(_ value: String...) -> Self {
        accept(value)
    }
    
    /// List of types the server accepts, typically a file type.
    ///
    /// Applicable to `<form>` and `<input>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/accept)
    @discardableResult
    public func accept<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        accept(value: value.stateValue.wrappedValue)
        value.stateValue.listen { self.accept(value: $0) }
        return self
    }
    
    /// List of types the server accepts, typically a file type.
    ///
    /// Applicable to `<form>` and `<input>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/accept)
    @discardableResult
    public func accept<S>(_ value: S) -> Self where S: StateConvertible, S.Value == [String] {
        accept(value.stateValue.wrappedValue)
        value.stateValue.listen { self.accept($0) }
        return self
    }
}

extension Form: AcceptAttrable {}
extension InputFile: AcceptAttrable {}

// MARK: - AcceptCharsetAttrable

public protocol AcceptCharsetAttrable: DOMElement {
    @discardableResult
    func acceptCharset(_ value: [String]) -> Self
    @discardableResult
    func acceptCharset(_ value: String...) -> Self
    @discardableResult
    func acceptCharset<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
    @discardableResult
    func acceptCharset<S>(_ value: S) -> Self where S: StateConvertible, S.Value == [String]
}

extension AcceptCharsetAttrable {
    /// List of supported charsets.
    ///
    /// Applicable to `<form>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/accept-charset)
    @discardableResult
    private func acceptCharset(value: String) -> Self {
        setAttribute("acceptCharset", value)
        return self
    }
    
    /// List of supported charsets.
    ///
    /// Applicable to `<form>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/accept-charset)
    @discardableResult
    public func acceptCharset(_ value: [String]) -> Self {
        acceptCharset(value: value.joined(separator: ","))
    }
    
    /// List of supported charsets.
    ///
    /// Applicable to `<form>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/accept-charset)
    @discardableResult
    public func acceptCharset(_ value: String...) -> Self {
        acceptCharset(value)
    }
    
    /// List of supported charsets.
    ///
    /// Applicable to `<form>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/accept-charset)
    @discardableResult
    public func acceptCharset<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        acceptCharset(value: value.stateValue.wrappedValue)
        value.stateValue.listen { self.acceptCharset(value: $0) }
        return self
    }
    
    /// List of supported charsets.
    ///
    /// Applicable to `<form>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/accept-charset)
    @discardableResult
    public func acceptCharset<S>(_ value: S) -> Self where S: StateConvertible, S.Value == [String] {
        acceptCharset(value.stateValue.wrappedValue)
        value.stateValue.listen { self.acceptCharset($0) }
        return self
    }
}

extension Form: AcceptCharsetAttrable {}

// MARK: - AccessKeyAttrable

public protocol AccessKeyAttrable: DOMElement {
    @discardableResult
    func accessKey(_ value: String) -> Self
    @discardableResult
    func accessKey<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension AccessKeyAttrable {
    /// Keyboard shortcut to activate or add focus to the element.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/accesskey)
    @discardableResult
    public func accessKey(_ value: String) -> Self {
        setAttribute("accessKey", value)
        return self
    }
    
    /// Keyboard shortcut to activate or add focus to the element.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/accesskey)
    @discardableResult
    public func accessKey<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        accessKey(value.stateValue.wrappedValue)
        value.stateValue.listen { self.accessKey($0) }
        return self
    }
}

extension BaseActiveElement: AccessKeyAttrable {}

// MARK: - ActionAttrable

public protocol ActionAttrable: DOMElement {
    @discardableResult
    func action<U: URLConformable>(_ value: U) -> Self
    @discardableResult
    func action<S>(_ value: S) -> Self where S: StateConvertible, S.Value: URLConformable
}

extension ActionAttrable {
    /// Specifies where to send the form data when the form is submitted.
    ///
    /// Possible values:
    /// - An absolute URL - points to another web site (like action="http://www.example.com/example.htm")
    /// - A relative URL - points to a file within a web site (like action="example.htm")
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/action)
    @discardableResult
    public func action<U: URLConformable>(_ value: U) -> Self {
        setAttribute("action", value.stringValue)
        return self
    }
    
    /// Specifies where to send the form data when the form is submitted.
    ///
    /// Possible values:
    /// - An absolute URL - points to another web site (like action="http://www.example.com/example.htm")
    /// - A relative URL - points to a file within a web site (like action="example.htm")
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/action)
    @discardableResult
    public func action<S>(_ value: S) -> Self where S: StateConvertible, S.Value: URLConformable {
        action(value.stateValue.wrappedValue)
        value.stateValue.listen { self.action($0) }
        return self
    }
}

extension Form: ActionAttrable {}

// MARK: - AlignAttrable

public protocol AlignAttrable: DOMElement {
    @discardableResult
    func align(_ value: AlignType) -> Self
    @discardableResult
    func align<S>(_ value: S) -> Self where S: StateConvertible, S.Value == AlignType
}

extension AlignAttrable {
    /// Specifies the horizontal alignment of the element.
    ///
    /// Applicable to `<applet>`, `<caption>`, `<col>`, `<colgroup>`, `<hr>`,
    /// `<iframe>`, `<img>`, `<table>`, `<tbody>`, `<td>`, `<tfoot>` , `<th>`, `<thead>`, `<tr>`
    ///
    /// [More info →](https://www.w3resource.com/html/attributes/html-align-attribute.php)
    @discardableResult
    public func align(_ value: AlignType) -> Self {
        setAttribute("align", value.value)
        return self
    }
    
    /// Specifies the horizontal alignment of the element.
    ///
    /// Applicable to `<applet>`, `<caption>`, `<col>`, `<colgroup>`, `<hr>`,
    /// `<iframe>`, `<img>`, `<table>`, `<tbody>`, `<td>`, `<tfoot>` , `<th>`, `<thead>`, `<tr>`
    ///
    /// [More info →](https://www.w3resource.com/html/attributes/html-align-attribute.php)
    @discardableResult
    public func align<S>(_ value: S) -> Self where S: StateConvertible, S.Value == AlignType {
        align(value.stateValue.wrappedValue)
        value.stateValue.listen { self.align($0) }
        return self
    }
}

extension Caption: AlignAttrable {}
extension Col: AlignAttrable {}
extension ColGroup: AlignAttrable {}
extension Div: AlignAttrable {}
extension Hr: AlignAttrable {}
extension IFrame: AlignAttrable {}
extension Img: AlignAttrable {}
extension Table: AlignAttrable {}
extension TBody: AlignAttrable {}
extension Td: AlignAttrable {}
extension TFoot: AlignAttrable {}
extension Th: AlignAttrable {}
extension THead: AlignAttrable {}
extension Tr: AlignAttrable {}

// MARK: - AltAttrable

public protocol AltAttrable: DOMElement {
    @discardableResult
    func alt(_ value: String) -> Self
    @discardableResult
    func alt<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension AltAttrable {
    /// Alternative text in case an image can't be displayed.
    ///
    /// Applicable to `<area>`, `<img>`, `<input>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#htmlattrdefalt)
    @discardableResult
    public func alt(_ value: String) -> Self {
        setAttribute("alt", value)
        return self
    }
    
    /// Alternative text in case an image can't be displayed.
    ///
    /// Applicable to `<area>`, `<img>`, `<input>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#htmlattrdefalt)
    @discardableResult
    public func alt<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        alt(value.stateValue.wrappedValue)
        value.stateValue.listen { self.alt($0) }
        return self
    }
}

extension Area: AltAttrable {}
extension Img: AltAttrable {}
extension InputImage: AltAttrable {}

// MARK: - AsyncAttrable

public protocol AsyncAttrable: DOMElement {
    @discardableResult
    func async(_ value: Bool) -> Self
    @discardableResult
    func async<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

extension AsyncAttrable {
    /// Executes the script asynchronously.
    ///
    /// Applicable to `<script>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_script_async.asp)
    @discardableResult
    public func async(_ value: Bool) -> Self {
        setAttribute("async", value, .short)
        return self
    }
    
    /// Executes the script asynchronously.
    ///
    /// Applicable to `<script>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/async)
    @discardableResult
    public func async<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        async(value.stateValue.wrappedValue)
        value.stateValue.listen { self.async($0) }
        return self
    }
}

extension Script: AsyncAttrable {}

// MARK: - AutocapitalizeAttrable

public protocol AutocapitalizeAttrable: DOMElement {
    @discardableResult
    func autocapitalize(_ value: AutocapitalizeType) -> Self
    @discardableResult
    func autocapitalize<S>(_ value: S) -> Self where S: StateConvertible, S.Value == AutocapitalizeType
}

extension AutocapitalizeAttrable {
    /// Sets whether input is automatically capitalized when entered by user
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/autocapitalize)
    @discardableResult
    public func autocapitalize(_ value: AutocapitalizeType) -> Self {
        setAttribute("autocapitalize", value.rawValue)
        return self
    }
    
    /// Sets whether input is automatically capitalized when entered by user
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/autocapitalize)
    @discardableResult
    public func autocapitalize<S>(_ value: S) -> Self where S: StateConvertible, S.Value == AutocapitalizeType {
        autocapitalize(value.stateValue.wrappedValue)
        value.stateValue.listen { self.autocapitalize($0) }
        return self
    }
}

extension BaseActiveElement: AutocapitalizeAttrable {}

// MARK: - AutocompleteAttrable

public protocol AutocompleteAttrable: DOMElement {
    @discardableResult
    func autocomplete(_ value: AutocompleteType) -> Self
    @discardableResult
    func autocomplete<S>(_ value: S) -> Self where S: StateConvertible, S.Value == AutocompleteType
}

extension AutocompleteAttrable {
    /// Indicates whether controls in this form can by default have their values automatically completed by the browser.
    ///
    /// Applicable to `<form>`, `<input>`, `<select>`, `<textarea>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/autocomplete)
    @discardableResult
    public func autocomplete(_ value: AutocompleteType) -> Self {
        setAttribute("autocomplete", value.value)
        return self
    }
    
    /// Indicates whether controls in this form can by default have their values automatically completed by the browser.
    ///
    /// Applicable to `<form>`, `<input>`, `<select>`, `<textarea>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/autocomplete)
    @discardableResult
    public func autocomplete<S>(_ value: S) -> Self where S: StateConvertible, S.Value == AutocompleteType {
        autocomplete(value.stateValue.wrappedValue)
        value.stateValue.listen { self.autocomplete($0) }
        return self
    }
}

extension Form: AutocompleteAttrable {}
extension InputText: AutocompleteAttrable {}
extension InputTel: AutocompleteAttrable {}
extension InputEmail: AutocompleteAttrable {}
extension InputPassword: AutocompleteAttrable {}
extension InputSearch: AutocompleteAttrable {}
extension InputURL: AutocompleteAttrable {}
extension InputNumber: AutocompleteAttrable {}
extension InputDateTime: AutocompleteAttrable {}
extension InputDate: AutocompleteAttrable {}
extension InputTime: AutocompleteAttrable {}
extension InputWeek: AutocompleteAttrable {}
extension InputMonth: AutocompleteAttrable {}
extension Select: AutocompleteAttrable {}
extension TextArea: AutocompleteAttrable {}

// MARK: - AutofocusAttrable

public protocol AutofocusAttrable: DOMElement {
    @discardableResult
    func autofocus(_ value: Bool) -> Self
    @discardableResult
    func autofocus<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

extension AutofocusAttrable {
    /// The element should be automatically focused after the page loaded.
    ///
    /// Applicable to `<button>`, `<input>`, `<keygen>`, `<select>`, `<textarea>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#htmlattrdefautofocus)
    @discardableResult
    public func autofocus(_ value: Bool) -> Self {
        setAttribute("autofocus", value, .short)
        return self
    }
    
    /// The element should be automatically focused after the page loaded.
    ///
    /// Applicable to `<button>`, `<input>`, `<keygen>`, `<select>`, `<textarea>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#htmlattrdefautofocus)
    @discardableResult
    public func autofocus<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        autofocus(value.stateValue.wrappedValue)
        value.stateValue.listen { self.autofocus($0) }
        return self
    }
}

extension Button: AutofocusAttrable {}
extension InputText: AutofocusAttrable {}
extension InputTel: AutofocusAttrable {}
extension InputEmail: AutofocusAttrable {}
extension InputPassword: AutofocusAttrable {}
extension InputSearch: AutofocusAttrable {}
extension InputURL: AutofocusAttrable {}
extension InputNumber: AutofocusAttrable {}
extension InputRange: AutofocusAttrable {}
extension InputImage: AutofocusAttrable {}
extension InputButton: AutofocusAttrable {}
extension InputSubmit: AutofocusAttrable {}
extension InputReset: AutofocusAttrable {}
extension InputHidden: AutofocusAttrable {}
extension InputCheckbox: AutofocusAttrable {}
extension InputRadio: AutofocusAttrable {}
extension InputColor: AutofocusAttrable {}
extension InputDateTime: AutofocusAttrable {}
extension InputDate: AutofocusAttrable {}
extension InputTime: AutofocusAttrable {}
extension InputWeek: AutofocusAttrable {}
extension InputMonth: AutofocusAttrable {}
extension InputFile: AutofocusAttrable {}
extension Select: AutofocusAttrable {}
extension TextArea: AutofocusAttrable {}

// MARK: - AutoplayAttrable

public protocol AutoplayAttrable: DOMElement {
    @discardableResult
    func autoplay(_ value: Bool) -> Self
    @discardableResult
    func autoplay<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

extension AutoplayAttrable {
    /// The audio or video should play as soon as possible.
    ///
    /// Applicable to `<audio>`, `<video>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/autoplay)
    @discardableResult
    public func autoplay(_ value: Bool) -> Self {
        setAttribute("autoplay", value, .short)
        return self
    }
    
    /// The audio or video should play as soon as possible.
    ///
    /// Applicable to `<audio>`, `<video>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/autoplay)
    @discardableResult
    public func autoplay<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        autoplay(value.stateValue.wrappedValue)
        value.stateValue.listen { self.autoplay($0) }
        return self
    }
}

extension Audio: AutoplayAttrable {}
extension Video: AutoplayAttrable {}

// MARK: - BufferedAttrable

public protocol BufferedAttrable: DOMElement {
    var buffered: TimeInterval { get }
}

extension BufferedAttrable {
    /// Contains the time range of already buffered media.
    ///
    /// Applicable to `<audio>`, `<video>`
    ///
    /// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/API/HTMLMediaElement/buffered)
    public var buffered: TimeInterval {
        #if arch(wasm32)
        return domElement.buffered.jsValue().number ?? 0
        #endif
        return 0
    }
}

extension Audio: BufferedAttrable {}
extension Video: BufferedAttrable {}

// MARK: - CaptureAttrable

public protocol CaptureAttrable: DOMElement {
    @discardableResult
    func capture(_ value: CaptureType) -> Self
    @discardableResult
    func capture<S>(_ value: S) -> Self where S: StateConvertible, S.Value == CaptureType
}

extension CaptureAttrable {
    /// The definition of 'media capture' in that specification.spec, specifies a new file can be captured.
    ///
    /// Applicable to `<input>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/capture)
    @discardableResult
    public func capture(_ value: CaptureType) -> Self {
        setAttribute("capture", value.value)
        return self
    }
    
    /// The definition of 'media capture' in that specification.spec, specifies a new file can be captured.
    ///
    /// Applicable to `<input>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/capture)
    @discardableResult
    public func capture<S>(_ value: S) -> Self where S: StateConvertible, S.Value == CaptureType {
        capture(value.stateValue.wrappedValue)
        value.stateValue.listen { self.capture($0) }
        return self
    }
}

extension InputFile: CaptureAttrable {}

// MARK: - CharsetAttrable

public protocol CharsetAttrable: DOMElement {
    @discardableResult
    func charset(_ value: String) -> Self
    @discardableResult
    func charset<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension CharsetAttrable {
    /// This attribute declares the document's character encoding.
    /// If the attribute is present, its value must be an ASCII case-insensitive match for the string "utf-8",
    /// because UTF-8 is the only valid encoding for HTML5 documents.
    /// meta elements which declare a character encoding must be located
    /// entirely within the first 1024 bytes of the document.
    ///
    /// Applicable to `<meta>`, `<script>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_charset.asp)
    @discardableResult
    public func charset(_ value: String) -> Self {
        setAttribute("charset", value)
        return self
    }
    
    /// This attribute declares the document's character encoding.
    /// If the attribute is present, its value must be an ASCII case-insensitive match for the string "utf-8",
    /// because UTF-8 is the only valid encoding for HTML5 documents.
    /// meta elements which declare a character encoding must be located
    /// entirely within the first 1024 bytes of the document.
    ///
    /// Applicable to `<meta>`, `<script>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_charset.asp)
    @discardableResult
    public func charset<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        charset(value.stateValue.wrappedValue)
        value.stateValue.listen { self.charset($0) }
        return self
    }
}

extension Meta: CharsetAttrable {}
extension Script: CharsetAttrable{}

// MARK: - CheckedAttrable

public protocol CheckedAttrable: DOMElement {
    @discardableResult
    func checked(_ value: Bool) -> Self
    @discardableResult
    func checked<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

extension CheckedAttrable {
    /// Mark input as `checked`
    ///
    /// Applicable to `<input>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#htmlattrdefchecked)
    @discardableResult
    public func checked(_ value: Bool) -> Self {
        setAttribute("checked", value, .short)
        return self
    }
    
    /// Mark input as `checked`
    ///
    /// Applicable to `<input>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#htmlattrdefchecked)
    @discardableResult
    public func checked<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        checked(value.stateValue.wrappedValue)
        value.stateValue.listen { self.checked($0) }
        return self
    }
}

extension InputCheckbox: CheckedAttrable {}
extension InputRadio: CheckedAttrable {}

// MARK: - CiteAttrable

public protocol CiteAttrable: DOMElement {
    @discardableResult
    func cite<U: URLConformable>(_ value: U) -> Self
    @discardableResult
    func cite<S>(_ value: S) -> Self where S: StateConvertible, S.Value: URLConformable
}

extension CiteAttrable {
    /// Contains a URI which points to the source of the quote or change.
    ///
    /// Applicable to `<blockquote>`, `<del>`, `<ins>`, `<q>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_cite.asp)
    @discardableResult
    public func cite<U: URLConformable>(_ value: U) -> Self {
        setAttribute("cite", value.stringValue)
        return self
    }
    
    /// Contains a URI which points to the source of the quote or change.
    ///
    /// Applicable to `<blockquote>`, `<del>`, `<ins>`, `<q>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_cite.asp)
    @discardableResult
    public func cite<S>(_ value: S) -> Self where S: StateConvertible, S.Value: URLConformable {
        cite(value.stateValue.wrappedValue)
        value.stateValue.listen { self.cite($0) }
        return self
    }
}

extension BlockQuote: CiteAttrable {}
extension Del: CiteAttrable {}
extension Ins: CiteAttrable {}
extension Q: CiteAttrable {}

// MARK: - ClassAttrable

public protocol ClassAttrable: DOMElement {
    @discardableResult
    func `class`(_ value: [Class]) -> Self
    @discardableResult
    func `class`(_ value: Class...) -> Self
    @discardableResult
    func `class`<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Class
    @discardableResult
    func `class`<S>(_ value: S) -> Self where S: StateConvertible, S.Value == [Class]
}

extension ClassAttrable {
    /// The class global attribute is a space-separated list of the case-sensitive classes of the element.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/class)
    @discardableResult
    public func `class`(_ value: [Class]) -> Self {
        value.map { $0.names }.flatMap { $0 }.forEach {
            properties._classes.insert($0)
        }
        setAttribute("class", properties._classes.joined(separator: " "))
        return self
    }
    
    /// The class global attribute is a space-separated list of the case-sensitive classes of the element.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/class)
    @discardableResult
    public func `class`(_ value: Class...) -> Self {
        `class`(value)
    }
    
    /// The class global attribute is a space-separated list of the case-sensitive classes of the element.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/class)
    @discardableResult
    public func `class`<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Class {
        `class`(value.stateValue.wrappedValue)
        value.stateValue.listen { self.`class`($0) }
        return self
    }
    
    /// The class global attribute is a space-separated list of the case-sensitive classes of the element.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/class)
    @discardableResult
    public func `class`<S>(_ value: S) -> Self where S: StateConvertible, S.Value == [Class] {
        `class`(value.stateValue.wrappedValue)
        value.stateValue.listen { self.`class`($0) }
        return self
    }
    
    // MARK: Removing
    
    @discardableResult
    public func removeClass(_ value: Class) -> Self {
        value.names.forEach { className in
            properties._classes.remove(className)
        }
        setAttribute("class", properties._classes.joined(separator: " "))
        return self
    }
    
    // MARK: Toggle
    
    @discardableResult
    public func toggleClass(_ value: Class) -> Self {
        value.names.forEach { className in
            if properties._classes.contains(className) {
                properties._classes.remove(className)
            } else {
                properties._classes.insert(className)
            }
        }
        #if arch(wasm32)
        let classList = domElement[dynamicMember: "classList"].object
        for className in value.names {
            classList?.toggle.function?.callAsFunction(optionalThis: classList, className.jsValue())
        }
        #endif
        return self
    }
}

extension BaseElement: ClassAttrable {}

// MARK: - ColsAttrable

public protocol ColsAttrable: DOMElement {
    @discardableResult
    func cols(_ value: Int) -> Self
    @discardableResult
    func cols<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Int
}

extension ColsAttrable {
    /// Defines the number of columns in a textarea.
    ///
    /// Applicable to `<textarea>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/cols)
    @discardableResult
    public func cols(_ value: Int) -> Self {
        setAttribute("cols", value)
        return self
    }
    
    /// Defines the number of columns in a textarea.
    ///
    /// Applicable to `<textarea>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/cols)
    @discardableResult
    public func cols<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Int {
        cols(value.stateValue.wrappedValue)
        value.stateValue.listen { self.cols($0) }
        return self
    }
}

extension TextArea: ColsAttrable {}

// MARK: - ColSpanAttrable

public protocol ColSpanAttrable: DOMElement {
    @discardableResult
    func colSpan(_ value: Int) -> Self
    @discardableResult
    func colSpan<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Int
}

extension ColSpanAttrable {
    /// The colSpan attribute defines the number of columns a cell should span.
    ///
    /// Applicable to `<td>`, `<th>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_colspan.asp)
    @discardableResult
    public func colSpan(_ value: Int) -> Self {
        setAttribute("colSpan", value)
        return self
    }
    
    /// The colSpan attribute defines the number of columns a cell should span.
    ///
    /// Applicable to `<td>`, `<th>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_colspan.asp)
    @discardableResult
    public func colSpan<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Int {
        colSpan(value.stateValue.wrappedValue)
        value.stateValue.listen { self.colSpan($0) }
        return self
    }
}

extension Td: ColSpanAttrable {}
extension Th: ColSpanAttrable {}

// MARK: - ContentAttrable

public protocol ContentAttrable: DOMElement {
    @discardableResult
    func content(_ value: String) -> Self
    @discardableResult
    func content<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension ContentAttrable {
    /// A value associated with http-equiv or name depending on the context.
    ///
    /// Applicable to `<meta>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/content)
    @discardableResult
    public func content(_ value: String) -> Self {
        setAttribute("content", value)
        return self
    }
    
    /// A value associated with http-equiv or name depending on the context.
    ///
    /// Applicable to `<meta>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/content)
    @discardableResult
    public func content<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        content(value.stateValue.wrappedValue)
        value.stateValue.listen { self.content($0) }
        return self
    }
}

extension Meta: ContentAttrable {}

// MARK: - ContentEditableAttrable

public protocol ContentEditableAttrable: DOMElement {
    @discardableResult
    func contentEditable(_ value: Bool) -> Self
    @discardableResult
    func contentEditable<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

extension ContentEditableAttrable {
    /// Indicates whether the element's content is editable.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/contenteditable)
    @discardableResult
    public func contentEditable(_ value: Bool) -> Self {
        setAttribute("contentEditable", value, .full)
        return self
    }
    
    /// Indicates whether the element's content is editable.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/contenteditable)
    @discardableResult
    public func contentEditable<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        contentEditable(value.stateValue.wrappedValue)
        value.stateValue.listen { self.contentEditable($0) }
        return self
    }
}

extension BaseElement: ContentEditableAttrable {}

// MARK: - ContextMenuAttrable

public protocol ContextMenuAttrable: DOMElement {
    @discardableResult
    func contextMenu(_ value: String) -> Self
    @discardableResult
    func contextMenu(_ value: Menu) -> Self
    @discardableResult
    func contextMenu<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension ContextMenuAttrable {
    /// Defines the ID of a `<menu>` element which will serve as the element's context menu.
    ///
    /// [More info →](https://www.w3schools.com/tags/att_contextmenu.asp)
    @discardableResult
    public func contextMenu(_ value: String) -> Self {
        setAttribute("contextmenu", value)
        return self
    }
    
    /// Defines the ID of a `<menu>` element which will serve as the element's context menu.
    ///
    /// [More info →](https://www.w3schools.com/tags/att_contextmenu.asp)
    @discardableResult
    public func contextMenu(_ value: Menu) -> Self {
        contextMenu(value.properties._id)
    }
    
    /// Defines the ID of a `<menu>` element which will serve as the element's context menu.
    ///
    /// [More info →](https://www.w3schools.com/tags/att_contextmenu.asp)
    @discardableResult
    public func contextMenu<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        contextMenu(value.stateValue.wrappedValue)
        value.stateValue.listen { self.contextMenu($0) }
        return self
    }
}

extension BaseElement: ContextMenuAttrable {}

// MARK: - ControlsAttrable

public protocol ControlsAttrable: DOMElement {
    @discardableResult
    func controls(_ value: Bool) -> Self
    @discardableResult
    func controls<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

extension ControlsAttrable {
    /// Indicates whether the browser should show playback controls to the user.
    ///
    /// Applicable to `<audio>`, `<video>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_controls.asp)
    @discardableResult
    public func controls(_ value: Bool) -> Self {
        setAttribute("controls", value, .short)
        return self
    }
    
    /// Indicates whether the browser should show playback controls to the user.
    ///
    /// Applicable to `<audio>`, `<video>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_controls.asp)
    @discardableResult
    public func controls<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        controls(value.stateValue.wrappedValue)
        value.stateValue.listen { self.controls($0) }
        return self
    }
}

extension Audio: ControlsAttrable {}
extension Video: ControlsAttrable {}

// MARK: - CoordsAttrable

public protocol CoordsAttrable: DOMElement {
    @discardableResult
    func coords(_ value: [Int]) -> Self
    @discardableResult
    func coords(_ value: Int...) -> Self
    @discardableResult
    func coords<S>(_ value: S) -> Self where S: StateConvertible, S.Value == [Int]
}

extension CoordsAttrable {
    /// A set of values specifying the coordinates of the hot-spot region.
    ///
    /// Applicable to `<area>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_coords.asp)
    @discardableResult
    private func coords(value: String) -> Self {
        setAttribute("coords", value)
        return self
    }
    
    /// A set of values specifying the coordinates of the hot-spot region.
    ///
    /// Applicable to `<area>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_coords.asp)
    @discardableResult
    public func coords(_ value: [Int]) -> Self {
        coords(value: value.map { "\($0)" }.joined(separator: ","))
    }
    
    /// A set of values specifying the coordinates of the hot-spot region.
    ///
    /// Applicable to `<area>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_coords.asp)
    @discardableResult
    public func coords(_ value: Int...) -> Self {
        coords(value)
    }
    
    /// A set of values specifying the coordinates of the hot-spot region.
    ///
    /// Applicable to `<area>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_coords.asp)
    @discardableResult
    public func coords<S>(_ value: S) -> Self where S: StateConvertible, S.Value == [Int] {
        coords(value.stateValue.wrappedValue)
        value.stateValue.listen { self.coords($0) }
        return self
    }
}

extension Area: CoordsAttrable {}

// MARK: - CrossOriginAttrable

public protocol CrossOriginAttrable: DOMElement {
    @discardableResult
    func crossOrigin(_ value: CrossOriginType) -> Self
    @discardableResult
    func crossOrigin<S>(_ value: S) -> Self where S: StateConvertible, S.Value == CrossOriginType
}

extension CrossOriginAttrable {
    /// How the element handles cross-origin requests
    ///
    /// Applicable to `<audio>`, `<img>`, `<link>`, `<script>`, `<video>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/crossorigin)
    @discardableResult
    public func crossOrigin(_ value: CrossOriginType) -> Self {
        setAttribute("crossorigin", value.value)
        return self
    }
    
    /// How the element handles cross-origin requests
    ///
    /// Applicable to `<audio>`, `<img>`, `<link>`, `<script>`, `<video>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/crossorigin)
    @discardableResult
    public func crossOrigin<S>(_ value: S) -> Self where S: StateConvertible, S.Value == CrossOriginType {
        crossOrigin(value.stateValue.wrappedValue)
        value.stateValue.listen { self.crossOrigin($0) }
        return self
    }
}

extension Audio: CrossOriginAttrable {}
extension Img: CrossOriginAttrable {}
extension Link: CrossOriginAttrable {}
extension Script: CrossOriginAttrable {}
extension Video: CrossOriginAttrable {}

// MARK: - DateTimeAttrable

public protocol DateTimeAttrable: DOMElement {
    @discardableResult
    func dateTime(_ value: String) -> Self
    @discardableResult
    func dateTime<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension DateTimeAttrable {
    /// Indicates the date and time associated with the element.
    ///
    /// Applicable to `<del>`, `<ins>`, `<time>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_time_datetime.asp)
    @discardableResult
    public func dateTime(_ value: String) -> Self {
        setAttribute("datetime", value)
        return self
    }
    
    /// Indicates the date and time associated with the element.
    ///
    /// Applicable to `<del>`, `<ins>`, `<time>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_time_datetime.asp)
    @discardableResult
    public func dateTime<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        dateTime(value.stateValue.wrappedValue)
        value.stateValue.listen { self.dateTime($0) }
        return self
    }
}

extension Del: DateTimeAttrable {}
extension Ins: DateTimeAttrable {}
extension Time: DateTimeAttrable {}

// MARK: - DecodingAttrable

public protocol DecodingAttrable: DOMElement {
    @discardableResult
    func decoding(_ value: DecodingType) -> Self
    @discardableResult
    func decoding<S>(_ value: S) -> Self where S: StateConvertible, S.Value == DecodingType
}

extension DecodingAttrable {
    /// Indicates the preferred method to decode the image.
    ///
    /// Applicable to `<img>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/API/HTMLImageElement/decoding)
    @discardableResult
    public func decoding(_ value: DecodingType) -> Self {
        setAttribute("decoding", value.value)
        return self
    }
    
    /// Indicates the preferred method to decode the image.
    ///
    /// Applicable to `<img>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/API/HTMLImageElement/decoding)
    @discardableResult
    public func decoding<S>(_ value: S) -> Self where S: StateConvertible, S.Value == DecodingType {
        decoding(value.stateValue.wrappedValue)
        value.stateValue.listen { self.decoding($0) }
        return self
    }
}

extension Img: DecodingAttrable {}

// MARK: - DefaultAttrable

public protocol DefaultAttrable: DOMElement {
    @discardableResult
    func `default`(_ value: Bool) -> Self
    @discardableResult
    func `default`<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

extension DefaultAttrable {
    /// Indicates that the track should be enabled unless the user's preferences indicate something different.
    ///
    /// Applicable to `<track>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_default.asp)
    @discardableResult
    public func `default`(_ value: Bool) -> Self {
        setAttribute("default", value, .short)
        return self
    }
    
    /// Indicates that the track should be enabled unless the user's preferences indicate something different.
    ///
    /// Applicable to `<track>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_default.asp)
    @discardableResult
    public func `default`<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        `default`(value.stateValue.wrappedValue)
        value.stateValue.listen { self.`default`($0) }
        return self
    }
}

extension Track: DefaultAttrable {}

// MARK: - DeferAttrable

public protocol DeferAttrable: DOMElement {
    @discardableResult
    func `defer`(_ value: Bool) -> Self
    @discardableResult
    func `defer`<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

extension DeferAttrable {
    /// Indicates that the script should be executed after the page has been parsed.
    ///
    /// Applicable to `<script>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_defer.asp)
    @discardableResult
    public func `defer`(_ value: Bool) -> Self {
        setAttribute("defer", value, .short)
        return self
    }
    
    /// Indicates that the script should be executed after the page has been parsed.
    ///
    /// Applicable to `<script>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_defer.asp)
    @discardableResult
    public func `defer`<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        `defer`(value.stateValue.wrappedValue)
        value.stateValue.listen { self.`defer`($0) }
        return self
    }
}

extension Script: DeferAttrable {}

// MARK: - DirAttrable

public protocol DirAttrable: DOMElement {
    @discardableResult
    func dir(_ value: DirType) -> Self
    @discardableResult
    func dir<S>(_ value: S) -> Self where S: StateConvertible, S.Value == DirType
}

extension DirAttrable {
    /// Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/dir)
    @discardableResult
    public func dir(_ value: DirType) -> Self {
        setAttribute("dir", value.value)
        return self
    }
    
    /// Defines the text direction. Allowed values are ltr (Left-To-Right) or rtl (Right-To-Left)
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/dir)
    @discardableResult
    public func dir<S>(_ value: S) -> Self where S: StateConvertible, S.Value == DirType {
        dir(value.stateValue.wrappedValue)
        value.stateValue.listen { self.dir($0) }
        return self
    }
}

extension BaseElement: DirAttrable {}

// MARK: - DisabledAttrable

public protocol DisabledAttrable: DOMElement {
    @discardableResult
    func disabled(_ value: Bool) -> Self
    @discardableResult
    func disabled<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

extension DisabledAttrable {
    /// Indicates whether the user can interact with the element.
    ///
    /// Applicable to `<button>`, `<fieldset>`, `<input>`, `<keygen>`,
    /// `<optgroup>`, `<option>`, `<select>`, `<textarea>`, `<style>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/disabled)
    @discardableResult
    public func disabled(_ value: Bool) -> Self {
        setAttribute("disabled", value, .short)
        return self
    }
    
    /// Indicates whether the user can interact with the element.
    ///
    /// Applicable to `<button>`, `<fieldset>`, `<input>`, `<keygen>`,
    /// `<optgroup>`, `<option>`, `<select>`, `<textarea>`, `<style>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/disabled)
    @discardableResult
    public func disabled<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        disabled(value.stateValue.wrappedValue)
        value.stateValue.listen { self.disabled($0) }
        return self
    }
}

extension Button: DisabledAttrable {}
extension FieldSet: DisabledAttrable {}
extension InputText: DisabledAttrable {}
extension InputTel: DisabledAttrable {}
extension InputEmail: DisabledAttrable {}
extension InputPassword: DisabledAttrable {}
extension InputSearch: DisabledAttrable {}
extension InputURL: DisabledAttrable {}
extension InputNumber: DisabledAttrable {}
extension InputRange: DisabledAttrable {}
extension InputImage: DisabledAttrable {}
extension InputButton: DisabledAttrable {}
extension InputSubmit: DisabledAttrable {}
extension InputReset: DisabledAttrable {}
extension InputHidden: DisabledAttrable {}
extension InputCheckbox: DisabledAttrable {}
extension InputRadio: DisabledAttrable {}
extension InputColor: DisabledAttrable {}
extension InputDateTime: DisabledAttrable {}
extension InputDate: DisabledAttrable {}
extension InputTime: DisabledAttrable {}
extension InputWeek: DisabledAttrable {}
extension InputMonth: DisabledAttrable {}
extension InputFile: DisabledAttrable {}
extension OptGroup: DisabledAttrable {}
extension Option: DisabledAttrable {}
extension Select: DisabledAttrable {}
extension Style: DisabledAttrable {}
extension TextArea: DisabledAttrable {}

// MARK: - DownloadAttrable

public protocol DownloadAttrable: DOMElement {
    @discardableResult
    func download(_ value: Bool) -> Self
    @discardableResult
    func download<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

extension DownloadAttrable {
    /// Indicates that the hyperlink is to be used for downloading a resource.
    ///
    /// Applicable to `<a>`, `<area>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_a_download.asp)
    @discardableResult
    public func download(_ value: Bool) -> Self {
        setAttribute("download", value, .short)
        return self
    }
    
    /// Indicates that the hyperlink is to be used for downloading a resource.
    ///
    /// Applicable to `<a>`, `<area>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_a_download.asp)
    @discardableResult
    public func download<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        download(value.stateValue.wrappedValue)
        value.stateValue.listen { self.download($0) }
        return self
    }
}

extension A: DownloadAttrable {}
extension Area: DownloadAttrable {}

// MARK: - DraggableAttrable

public protocol DraggableAttrable: DOMElement {
    @discardableResult
    func draggable(_ value: Bool) -> Self
    @discardableResult
    func draggable<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

extension DraggableAttrable {
    /// Defines whether the element can be dragged.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/draggable)
    @discardableResult
    public func draggable(_ value: Bool) -> Self {
        setAttribute("draggable", value, .full)
        return self
    }
    
    /// Defines whether the element can be dragged.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/draggable)
    @discardableResult
    public func draggable<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        draggable(value.stateValue.wrappedValue)
        value.stateValue.listen { self.draggable($0) }
        return self
    }
}

extension BaseElement: DraggableAttrable {}

// MARK: - EncTypeAttrable

public protocol EncTypeAttrable: DOMElement {
    @discardableResult
    func encType(_ value: EncType) -> Self
    @discardableResult
    func encType<S>(_ value: S) -> Self where S: StateConvertible, S.Value == EncType
}

extension EncTypeAttrable {
    /// Defines the content type of the form data when the method is POST.
    ///
    /// Applicable to `<form>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_form_enctype.asp)
    @discardableResult
    public func encType(_ value: EncType) -> Self {
        setAttribute("enctype", value.value)
        return self
    }
    
    /// Defines the content type of the form data when the method is POST.
    ///
    /// Applicable to `<form>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_form_enctype.asp)
    @discardableResult
    public func encType<S>(_ value: S) -> Self where S: StateConvertible, S.Value == EncType {
        encType(value.stateValue.wrappedValue)
        value.stateValue.listen { self.encType($0) }
        return self
    }
}

extension Form: EncTypeAttrable {}

// MARK: - EnterKeyHintAttrable

public protocol EnterKeyHintAttrable: DOMElement {
    @discardableResult
    func enterKeyHint(_ value: EnterKeyHintType) -> Self
    @discardableResult
    func enterKeyHint<S>(_ value: S) -> Self where S: StateConvertible, S.Value == EnterKeyHintType
}

extension EnterKeyHintAttrable {
    /// The enterkeyhint specifies what action label (or icon)
    /// to present for the enter key on virtual keyboards.
    ///
    /// [More info →](https://html.spec.whatwg.org/multipage/interaction.html#input-modalities:-the-enterkeyhint-attribute)
    @discardableResult
    public func enterKeyHint(_ value: EnterKeyHintType) -> Self {
        setAttribute("enterkeyhint", value.value)
        return self
    }
    
    /// The enterkeyhint specifies what action label (or icon)
    /// to present for the enter key on virtual keyboards.
    ///
    /// [More info →](https://html.spec.whatwg.org/multipage/interaction.html#input-modalities:-the-enterkeyhint-attribute)
    @discardableResult
    public func enterKeyHint<S>(_ value: S) -> Self where S: StateConvertible, S.Value == EnterKeyHintType {
        enterKeyHint(value.stateValue.wrappedValue)
        value.stateValue.listen { self.enterKeyHint($0) }
        return self
    }
}

extension BaseElement: EnterKeyHintAttrable {} // should be on TextArea and `contenteditable`

// MARK: - ForAttrable

public protocol ForAttrable: DOMElement {
    @discardableResult
    func `for`(_ values: [String]) -> Self
    @discardableResult
    func `for`(_ values: String...) -> Self
    @discardableResult
    func `for`(_ values: [BaseElement]) -> Self
    @discardableResult
    func `for`(_ values: BaseElement...) -> Self
    @discardableResult
    func `for`<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
    @discardableResult
    func `for`<S>(_ values: S) -> Self where S: StateConvertible, S.Value == [String]
}

extension ForAttrable {
    /// Defines the IDs of an elements which belongs to this one.
    ///
    /// Applicable to `<label>`, `<output>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_for.asp)
    @discardableResult
    public func `for`(_ values: [String]) -> Self {
        setAttribute("for", values.joined(separator: " "))
        return self
    }
    
    /// Defines the ID of an element which belongs to this one.
    ///
    /// Applicable to `<label>`, `<output>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_for.asp)
    @discardableResult
    public func `for`(_ values: String...) -> Self {
        `for`(values)
    }
    
    /// Defines the ID of an element which belongs to this one.
    ///
    /// Applicable to `<label>`, `<output>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_for.asp)
    @discardableResult
    public func `for`(_ values: [BaseElement]) -> Self {
        `for`(values.map { $0.properties._id })
    }
    
    /// Defines the ID of an element which belongs to this one.
    ///
    /// Applicable to `<label>`, `<output>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_for.asp)
    @discardableResult
    public func `for`(_ values: BaseElement...) -> Self {
        `for`(values)
    }
    
    /// Defines the ID of an element which belongs to this one.
    ///
    /// Applicable to `<label>`, `<output>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_for.asp)
    @discardableResult
    public func `for`<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        `for`(value.stateValue.wrappedValue)
        value.stateValue.listen { self.`for`($0) }
        return self
    }
    
    /// Defines the ID of an element which belongs to this one.
    ///
    /// Applicable to `<label>`, `<output>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_for.asp)
    @discardableResult
    public func `for`<S>(_ values: S) -> Self where S: StateConvertible, S.Value == [String] {
        `for`(values.stateValue.wrappedValue)
        values.stateValue.listen { self.`for`($0) }
        return self
    }
}

extension Label: ForAttrable {}
extension Output: ForAttrable {}

// MARK: - FormActionAttrable

public protocol FormActionAttrable: DOMElement {
    @discardableResult
    func formAction<U: URLConformable>(_ value: U) -> Self
    @discardableResult
    func formAction<S>(_ value: S) -> Self where S: StateConvertible, S.Value: URLConformable
}

extension FormActionAttrable {
    /// Indicates the action of the element, overriding the action defined in the `<form>`.
    ///
    /// Applicable to `<button>`, `<input>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_input_formaction.asp)
    @discardableResult
    public func formAction<U: URLConformable>(_ value: U) -> Self {
        setAttribute("formaction", value.stringValue)
        return self
    }
    
    /// Indicates the action of the element, overriding the action defined in the `<form>`.
    ///
    /// Applicable to `<button>`, `<input>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_input_formaction.asp)
    @discardableResult
    public func formAction<S>(_ value: S) -> Self where S: StateConvertible, S.Value: URLConformable {
        formAction(value.stateValue.wrappedValue)
        value.stateValue.listen { self.formAction($0) }
        return self
    }
}

extension Button: FormActionAttrable {}
extension InputSubmit: FormActionAttrable {}
extension InputImage: FormActionAttrable {}

// MARK: - FormAttrable

public protocol FormAttrable: DOMElement {
    @discardableResult
    func form(_ value: String) -> Self
    @discardableResult
    func form(_ value: BaseElement) -> Self
    @discardableResult
    func form<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
    @discardableResult
    func form<S>(_ value: S) -> Self where S: StateConvertible, S.Value == BaseElement
}

extension FormAttrable {
    /// Defines the ID of form that is the owner of the element.
    ///
    /// Applicable to `<button>`, `<fieldset>`, `<input>`, `<label>`,
    /// `<meter>`, `<object>`, `<output>`, `<progress>`, `<select>`, `<textarea>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_form.asp)
    @discardableResult
    public func form(_ value: String) -> Self {
        setAttribute("form", value)
        return self
    }
    
    /// Defines the ID of form that is the owner of the element.
    ///
    /// Applicable to `<button>`, `<fieldset>`, `<input>`, `<label>`,
    /// `<meter>`, `<object>`, `<output>`, `<progress>`, `<select>`, `<textarea>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_form.asp)
    @discardableResult
    public func form(_ value: BaseElement) -> Self {
        form(value.properties._id)
    }
    
    /// Defines the ID of form that is the owner of the element.
    ///
    /// Applicable to `<button>`, `<fieldset>`, `<input>`, `<label>`,
    /// `<meter>`, `<object>`, `<output>`, `<progress>`, `<select>`, `<textarea>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_form.asp)
    @discardableResult
    public func form<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        form(value.stateValue.wrappedValue)
        value.stateValue.listen { self.form($0) }
        return self
    }
    
    /// Defines the ID of form that is the owner of the element.
    ///
    /// Applicable to `<button>`, `<fieldset>`, `<input>`, `<label>`,
    /// `<meter>`, `<object>`, `<output>`, `<progress>`, `<select>`, `<textarea>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_form.asp)
    @discardableResult
    public func form<S>(_ value: S) -> Self where S: StateConvertible, S.Value == BaseElement {
        form(value.stateValue.wrappedValue)
        value.stateValue.listen { self.form($0) }
        return self
    }
}

extension Button: FormAttrable {}
extension FieldSet: FormAttrable {}
extension InputText: FormAttrable {}
extension InputTel: FormAttrable {}
extension InputEmail: FormAttrable {}
extension InputPassword: FormAttrable {}
extension InputSearch: FormAttrable {}
extension InputURL: FormAttrable {}
extension InputNumber: FormAttrable {}
extension InputRange: FormAttrable {}
extension InputImage: FormAttrable {}
extension InputButton: FormAttrable {}
extension InputSubmit: FormAttrable {}
extension InputReset: FormAttrable {}
extension InputHidden: FormAttrable {}
extension InputCheckbox: FormAttrable {}
extension InputRadio: FormAttrable {}
extension InputColor: FormAttrable {}
extension InputDateTime: FormAttrable {}
extension InputDate: FormAttrable {}
extension InputTime: FormAttrable {}
extension InputWeek: FormAttrable {}
extension InputMonth: FormAttrable {}
extension InputFile: FormAttrable {}
extension Label: FormAttrable {}
extension Meter: FormAttrable {}
extension Object: FormAttrable {}
extension Output: FormAttrable {}
extension Progress: FormAttrable {}
extension Select: FormAttrable {}
extension TextArea: FormAttrable {}

// MARK: - FormEncTypeAttrable

public protocol FormEncTypeAttrable: DOMElement {
    @discardableResult
    func formEncType(_ value: EncType) -> Self
    @discardableResult
    func formEncType<S>(_ value: S) -> Self where S: StateConvertible, S.Value == EncType
}

extension FormEncTypeAttrable {
    /// Defines the content type of the form data when the method is POST.
    ///
    /// Applicable to `<form>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_input_formenctype.asp)
    @discardableResult
    public func formEncType(_ value: EncType) -> Self {
        setAttribute("formenctype", value.value)
        return self
    }
    
    /// Defines the content type of the form data when the method is POST.
    ///
    /// Applicable to `<form>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_input_formenctype.asp)
    @discardableResult
    public func formEncType<S>(_ value: S) -> Self where S: StateConvertible, S.Value == EncType {
        formEncType(value.stateValue.wrappedValue)
        value.stateValue.listen { self.formEncType($0) }
        return self
    }
}

extension Button: FormEncTypeAttrable {}
extension InputSubmit: FormEncTypeAttrable {}
extension InputImage: FormEncTypeAttrable {}

// MARK: - FormMethodAttrable

public protocol FormMethodAttrable: DOMElement {
    @discardableResult
    func formMethod(_ value: MethodType) -> Self
    @discardableResult
    func formMethod<S>(_ value: S) -> Self where S: StateConvertible, S.Value == MethodType
}

extension FormMethodAttrable {
    /// If the button/input is a submit button (type="submit"),
    /// this attribute sets the submission method to use during form submission (GET, POST, etc.).
    /// If this attribute is specified, it overrides the method attribute of the button's form owner.
    ///
    /// Applicable to `<button>`, `<input>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_input_formmethod.asp)
    @discardableResult
    public func formMethod(_ value: MethodType) -> Self {
        setAttribute("formmethod", value.value)
        return self
    }
    
    /// If the button/input is a submit button (type="submit"),
    /// this attribute sets the submission method to use during form submission (GET, POST, etc.).
    /// If this attribute is specified, it overrides the method attribute of the button's form owner.
    ///
    /// Applicable to `<button>`, `<input>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_input_formmethod.asp)
    @discardableResult
    public func formMethod<S>(_ value: S) -> Self where S: StateConvertible, S.Value == MethodType {
        formMethod(value.stateValue.wrappedValue)
        value.stateValue.listen { self.formMethod($0) }
        return self
    }
}

extension Button: FormMethodAttrable {}
extension InputSubmit: FormMethodAttrable {}
extension InputImage: FormMethodAttrable {}

// MARK: - FormNoValidateAttrable

public protocol FormNoValidateAttrable: DOMElement {
    @discardableResult
    func formNoValidate(_ value: Bool) -> Self
    @discardableResult
    func formNoValidate<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

extension FormNoValidateAttrable {
    /// The novalidate attribute is a boolean attribute.
    /// When present, it specifies that the form-data (input) should not be validated when submitted.
    ///
    /// Applicable to `<button>`, `<form>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_form_novalidate.asp)
    @discardableResult
    public func formNoValidate(_ value: Bool) -> Self {
        setAttribute("formnovalidate", value, .short)
        return self
    }
    
    /// The novalidate attribute is a boolean attribute.
    /// When present, it specifies that the form-data (input) should not be validated when submitted.
    ///
    /// Applicable to `<button>`, `<form>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_form_novalidate.asp)
    @discardableResult
    public func formNoValidate<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        formNoValidate(value.stateValue.wrappedValue)
        value.stateValue.listen { self.formNoValidate($0) }
        return self
    }
}

extension Button: FormNoValidateAttrable {}
extension Form: FormNoValidateAttrable {}

// MARK: - FormTargetAttrable

public protocol FormTargetAttrable: DOMElement {
    @discardableResult
    func formTarget(_ value: TargetType) -> Self
    @discardableResult
    func formTarget<S>(_ value: S) -> Self where S: StateConvertible, S.Value == TargetType
}

extension FormTargetAttrable {
    /// If the button/input is a submit button (type="submit"),
    /// this attribute specifies the browsing context (for example, tab, window, or inline frame)
    /// in which to display the response that is received after submitting the form.
    /// If this attribute is specified, it overrides the target attribute of the button's form owner.
    ///
    /// Applicable to `<button>`, `<input>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_form_target.asp)
    @discardableResult
    public func formTarget(_ value: TargetType) -> Self {
        setAttribute("formtarget", value.rawValue)
        return self
    }
    
    /// If the button/input is a submit button (type="submit"),
    /// this attribute specifies the browsing context (for example, tab, window, or inline frame)
    /// in which to display the response that is received after submitting the form.
    /// If this attribute is specified, it overrides the target attribute of the button's form owner.
    ///
    /// Applicable to `<button>`, `<input>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_form_target.asp)
    @discardableResult
    public func formTarget<S>(_ value: S) -> Self where S: StateConvertible, S.Value == TargetType {
        formTarget(value.stateValue.wrappedValue)
        value.stateValue.listen { self.formTarget($0) }
        return self
    }
}

extension Button: FormTargetAttrable {}
extension InputSubmit: FormTargetAttrable {}
extension InputImage: FormTargetAttrable {}

// MARK: - HeadersAttrable

public protocol HeadersAttrable: DOMElement {
    @discardableResult
    func headers(_ value: String) -> Self
    @discardableResult
    func headers<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension HeadersAttrable {
    /// IDs of the `<th>` elements which applies to this element.
    ///
    /// Applicable to `<td>`, `<th>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_headers.asp)
    @discardableResult
    public func headers(_ value: String) -> Self {
        setAttribute("headers", value)
        return self
    }
    
    /// IDs of the `<th>` elements which applies to this element.
    ///
    /// Applicable to `<td>`, `<th>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_headers.asp)
    @discardableResult
    public func headers<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        headers(value.stateValue.wrappedValue)
        value.stateValue.listen { self.headers($0) }
        return self
    }
}

extension Td: HeadersAttrable {}
extension Th: HeadersAttrable{}

// MARK: - HiddenAttrable

public protocol HiddenAttrable: DOMElement {
    @discardableResult
    func hidden(_ value: Bool) -> Self
    @discardableResult
    func hidden<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

extension HiddenAttrable {
    /// Prevents rendering of given element, while keeping child elements, e.g. script elements, active.
    ///
    /// [More info →](https://www.w3schools.com/tags/att_hidden.asp)
    @discardableResult
    public func hidden(_ value: Bool) -> Self {
        setAttribute("hidden", value, .short)
        return self
    }
    
    /// Prevents rendering of given element, while keeping child elements, e.g. script elements, active.
    ///
    /// [More info →](https://www.w3schools.com/tags/att_hidden.asp)
    @discardableResult
    public func hidden<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        hidden(value.stateValue.wrappedValue)
        value.stateValue.listen { self.hidden($0) }
        return self
    }
}

extension BaseElement: HiddenAttrable {}

// MARK: - HighAttrable

public protocol HighAttrable: DOMElement {
    @discardableResult
    func high(_ value: Double) -> Self
    @discardableResult
    func high<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Double
}

extension HighAttrable {
    /// Indicates the lower bound of the upper range.
    ///
    /// Applicable to `<meter>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_high.asp)
    @discardableResult
    public func high(_ value: Double) -> Self {
        setAttribute("high", value)
        return self
    }
    
    /// Indicates the lower bound of the upper range.
    ///
    /// Applicable to `<meter>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_high.asp)
    @discardableResult
    public func high<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Double {
        high(value.stateValue.wrappedValue)
        value.stateValue.listen { self.high($0) }
        return self
    }
}

extension Meter: HighAttrable {}

// MARK: - HrefAttrable

public protocol HrefAttrable: DOMElement {
    @discardableResult
    func href<U: URLConformable>(_ value: U) -> Self
    @discardableResult
    func href<S>(_ value: S) -> Self where S: StateConvertible, S.Value: URLConformable
}

extension HrefAttrable {
    /// The URL of a linked resource.
    ///
    /// Applicable to `<a>`, `<area>`, `<base>`, and `<link>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/href)
    @discardableResult
    public func href<U: URLConformable>(_ value: U) -> Self {
        setAttribute("href", value.stringValue)
        return self
    }
    
    /// The URL of a linked resource.
    ///
    /// Applicable to `<a>`, `<area>`, `<base>`, and `<link>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/href)
    @discardableResult
    public func href<S>(_ value: S) -> Self where S: StateConvertible, S.Value: URLConformable {
        href(value.stateValue.wrappedValue)
        value.stateValue.listen { self.href($0) }
        return self
    }
}

extension A: HrefAttrable {}
extension Area: HrefAttrable {}
extension Base: HrefAttrable {}
extension Link: HrefAttrable {}

// MARK: - HrefLangAttrable

public protocol HrefLangAttrable: DOMElement {
    @discardableResult
    func hrefLang(_ value: String) -> Self
    @discardableResult
    func hrefLang<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension HrefLangAttrable {
    /// Specifies the language of the linked resource.
    ///
    /// Applicable to `<a>`, `<area>`, `<link>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_hreflang.asp)
    @discardableResult
    public func hrefLang(_ value: String) -> Self {
        setAttribute("hreflang", value)
        return self
    }
    
    /// Specifies the language of the linked resource.
    ///
    /// Applicable to `<a>`, `<area>`, `<link>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_hreflang.asp)
    @discardableResult
    public func hrefLang<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        hrefLang(value.stateValue.wrappedValue)
        value.stateValue.listen { self.hrefLang($0) }
        return self
    }
}

extension A: HrefLangAttrable {}
extension Area: HrefLangAttrable {}
extension Link: HrefLangAttrable {}

// MARK: - HttpEquivAttrable

public protocol HttpEquivAttrable: DOMElement {
    @discardableResult
    func httpEquiv(_ value: String) -> Self
    @discardableResult
    func httpEquiv<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension HttpEquivAttrable {
    /// Defines a pragma directive.
    ///
    /// Applicable to `<meta>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_http-equiv.asp)
    @discardableResult
    public func httpEquiv(_ value: String) -> Self {
        setAttribute("httpequiv", value)
        return self
    }
    
    /// Defines a pragma directive.
    ///
    /// Applicable to `<meta>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_http-equiv.asp)
    @discardableResult
    public func httpEquiv<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        httpEquiv(value.stateValue.wrappedValue)
        value.stateValue.listen { self.httpEquiv($0) }
        return self
    }
}

extension Meta: HttpEquivAttrable {}

// MARK: - IdAttrable

public protocol IdAttrable: DOMElement {
    @discardableResult
    func id(_ value: Id) -> Self
    @discardableResult
    func id<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Id
}

extension IdAttrable {
    /// The id attribute specifies a unique id for an HTML element (the value must be unique within the HTML document).
    ///
    /// [More info →](https://www.w3schools.com/tags/att_id.asp)
    @discardableResult
    public func id(_ value: Id) -> Self {
        properties._id = value.name
        setAttribute("id", value.name)
        return self
    }
    
    /// The id attribute specifies a unique id for an HTML element (the value must be unique within the HTML document).
    ///
    /// [More info →](https://www.w3schools.com/tags/att_id.asp)
    @discardableResult
    public func id<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Id {
        id(value.stateValue.wrappedValue)
        value.stateValue.listen { self.id($0) }
        return self
    }
}

extension BaseElement: IdAttrable {}

// MARK: - InputModeAttrable

public protocol InputModeAttrable: DOMElement {
    @discardableResult
    func inputMode(_ value: InputTextType) -> Self
    @discardableResult
    func inputMode<S>(_ value: S) -> Self where S: StateConvertible, S.Value == InputTextType
}

extension InputModeAttrable {
    /// Provides a hint as to the type of data that might be entered
    /// by the user while editing the element or its contents.
    /// The attribute can be used with form controls (such as the value of textarea elements),
    /// or in elements in an editing host (e.g., using contenteditable attribute).
    ///
    /// Applicable to `<textarea>`, `<input>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/inputmode)
    @discardableResult
    public func inputMode(_ value: InputTextType) -> Self {
        setAttribute("inputmode", value.value)
        return self
    }
    
    /// Provides a hint as to the type of data that might be entered
    /// by the user while editing the element or its contents.
    /// The attribute can be used with form controls (such as the value of textarea elements),
    /// or in elements in an editing host (e.g., using contenteditable attribute).
    ///
    /// Applicable to `<textarea>`, `<input>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/inputmode)
    @discardableResult
    public func inputMode<S>(_ value: S) -> Self where S: StateConvertible, S.Value == InputTextType {
        inputMode(value.stateValue.wrappedValue)
        value.stateValue.listen { self.inputMode($0) }
        return self
    }
}

extension InputText: InputModeAttrable {}
extension InputTel: InputModeAttrable {}
extension InputEmail: InputModeAttrable {}
extension InputPassword: InputModeAttrable {}
extension InputSearch: InputModeAttrable {}
extension InputURL: InputModeAttrable {}
extension InputNumber: InputModeAttrable {}
extension InputDateTime: InputModeAttrable {}
extension InputDate: InputModeAttrable {}
extension InputTime: InputModeAttrable {}
extension InputWeek: InputModeAttrable {}
extension InputMonth: InputModeAttrable {}
extension TextArea: InputModeAttrable {}

// MARK: - IntegrityAttrable

public protocol IntegrityAttrable: DOMElement {
    @discardableResult
    func integrity(_ value: String) -> Self
    @discardableResult
    func integrity<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension IntegrityAttrable {
    /// Specifies a Subresource Integrity value that allows browsers to verify what they fetch.
    ///
    /// Applicable to `<link>`, `<script>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/Security/Subresource_Integrity)
    @discardableResult
    public func integrity(_ value: String) -> Self {
        setAttribute("integrity", value)
        return self
    }
    
    /// Specifies a Subresource Integrity value that allows browsers to verify what they fetch.
    ///
    /// Applicable to `<link>`, `<script>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/Security/Subresource_Integrity)
    @discardableResult
    public func integrity<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        integrity(value.stateValue.wrappedValue)
        value.stateValue.listen { self.integrity($0) }
        return self
    }
}

extension Link: IntegrityAttrable {}
extension Script: IntegrityAttrable {}

// MARK: - ItemPropAttrable

public protocol ItemPropAttrable: DOMElement {
    @discardableResult
    func itemprop(_ value: String) -> Self
    @discardableResult
    func itemprop<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension ItemPropAttrable {
    /// Used  as key for key-value representation
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/itemprop)
    @discardableResult
    public func itemprop(_ value: String) -> Self {
        setAttribute("itemprop", value)
        return self
    }
    
    /// Used  as key for key-value representation
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/itemprop)
    @discardableResult
    public func itemprop<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        itemprop(value.stateValue.wrappedValue)
        value.stateValue.listen { self.itemprop($0) }
        return self
    }
}

extension BaseElement: ItemPropAttrable {}

// MARK: - KindAttrable

public protocol KindAttrable: DOMElement {
    @discardableResult
    func kind(_ value: String) -> Self
    @discardableResult
    func kind<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension KindAttrable {
    /// Specifies the kind of text track.
    ///
    /// Applicable to `<track>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_kind.asp)
    @discardableResult
    public func kind(_ value: String) -> Self {
        setAttribute("kind", value)
        return self
    }
    
    /// Specifies the kind of text track.
    ///
    /// Applicable to `<track>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_kind.asp)
    @discardableResult
    public func kind<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        kind(value.stateValue.wrappedValue)
        value.stateValue.listen { self.kind($0) }
        return self
    }
}

extension Track: KindAttrable {}

// MARK: - LabelAttrable

public protocol LabelAttrable: DOMElement {
    @discardableResult
    func label(_ value: String) -> Self
    @discardableResult
    func label<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension LabelAttrable {
    /// Specifies a user-readable title of the element.
    ///
    /// Applicable to `<optgroup>`, `<option>`, `<track>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_label.asp)
    @discardableResult
    public func label(_ value: String) -> Self {
        setAttribute("label", value)
        return self
    }
    
    /// Specifies a user-readable title of the element.
    ///
    /// Applicable to `<optgroup>`, `<option>`, `<track>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_label.asp)
    @discardableResult
    public func label<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        label(value.stateValue.wrappedValue)
        value.stateValue.listen { self.label($0) }
        return self
    }
}

extension OptGroup: LabelAttrable {}
extension Option: LabelAttrable {}
extension Track: LabelAttrable {}

// MARK: - LangAttrable

public protocol LangAttrable: DOMElement {
    @discardableResult
    func lang(_ value: String) -> Self
    @discardableResult
    func lang<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension LangAttrable {
    /// The lang attribute specifies the language of the element's content.
    ///
    /// [More info →](https://www.w3schools.com/tags/att_lang.asp)
    @discardableResult
    public func lang(_ value: String) -> Self {
        setAttribute("lang", value)
        return self
    }
    
    /// The lang attribute specifies the language of the element's content.
    ///
    /// [More info →](https://www.w3schools.com/tags/att_lang.asp)
    @discardableResult
    public func lang<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        lang(value.stateValue.wrappedValue)
        value.stateValue.listen { self.lang($0) }
        return self
    }
}

extension BaseElement: LangAttrable {}

// MARK: - LanguageAttrable

public protocol LanguageAttrable: DOMElement {
    @discardableResult
    func language(_ value: String) -> Self
    @discardableResult
    func language<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension LanguageAttrable {
    /// Defines the script language used in the element.
    ///
    /// Applicable to `<script>`
    @discardableResult
    public func language(_ value: String) -> Self {
        setAttribute("language", value)
        return self
    }
    
    /// Defines the script language used in the element.
    ///
    /// Applicable to `<script>`
    @discardableResult
    public func language<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        language(value.stateValue.wrappedValue)
        value.stateValue.listen { self.language($0) }
        return self
    }
}

extension Script: LanguageAttrable {}

// MARK: - ListAttrable

public protocol ListAttrable: DOMElement {
    @discardableResult
    func list(_ value: String) -> Self
    @discardableResult
    func list(_ value: BaseElement) -> Self
    @discardableResult
    func list<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
    @discardableResult
    func list<S>(_ value: S) -> Self where S: StateConvertible, S.Value == BaseElement
}

extension ListAttrable {
    /// Identifies a list of pre-defined options to suggest to the user. Points to id of Datalist element.
    ///
    /// Applicable to `<input>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_list.asp)
    @discardableResult
    public func list(_ value: String) -> Self {
        setAttribute("list", value)
        return self
    }
    
    /// Identifies a list of pre-defined options to suggest to the user. Points to id of Datalist element.
    ///
    /// Applicable to `<input>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_list.asp)
    @discardableResult
    public func list(_ value: BaseElement) -> Self {
        list(value.properties._id)
    }
    
    /// Identifies a list of pre-defined options to suggest to the user. Points to id of Datalist element.
    ///
    /// Applicable to `<input>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_list.asp)
    @discardableResult
    public func list<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        list(value.stateValue.wrappedValue)
        value.stateValue.listen { self.list($0) }
        return self
    }
    
    /// Identifies a list of pre-defined options to suggest to the user. Points to id of Datalist element.
    ///
    /// Applicable to `<input>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_list.asp)
    @discardableResult
    public func list<S>(_ value: S) -> Self where S: StateConvertible, S.Value == BaseElement {
        list(value.stateValue.wrappedValue)
        value.stateValue.listen { self.list($0) }
        return self
    }
}

extension Input: ListAttrable {}
extension InputList: ListAttrable {}

// MARK: - LoadingAttrable

public protocol LoadingAttrable: DOMElement {
    @discardableResult
    func loading(_ value: LoadingType) -> Self
    @discardableResult
    func loading<S>(_ value: S) -> Self where S: StateConvertible, S.Value == LoadingType
}

extension LoadingAttrable {
    /// Indicates if the element should be loaded lazily or loaded immediately.
    ///
    /// Applicable to `<img>`, `<iframe>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_img_loading.asp)
    /// [Development process →](https://github.com/whatwg/html/pull/3752)
    @discardableResult
    public func loading(_ value: LoadingType) -> Self {
        setAttribute("loading", value.value)
        return self
    }
    
    /// Indicates if the element should be loaded lazily or loaded immediately.
    ///
    /// Applicable to `<img>`, `<iframe>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_img_loading.asp)
    /// [Development process →](https://github.com/whatwg/html/pull/3752)
    @discardableResult
    public func loading<S>(_ value: S) -> Self where S: StateConvertible, S.Value == LoadingType {
        loading(value.stateValue.wrappedValue)
        value.stateValue.listen { self.loading($0) }
        return self
    }
}

extension Img: LoadingAttrable {}
extension IFrame: LoadingAttrable {}

// MARK: - LoopAttrable

public protocol LoopAttrable: DOMElement {
    @discardableResult
    func loop(_ value: Bool) -> Self
    @discardableResult
    func loop<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

extension LoopAttrable {
    /// Indicates whether the media should start playing from the start when it's finished.
    ///
    /// Applicable to `<audio>`, `<video>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_loop.asp)
    @discardableResult
    public func loop(_ value: Bool) -> Self {
        setAttribute("loop", value, .short)
        return self
    }
    
    /// Indicates whether the media should start playing from the start when it's finished.
    ///
    /// Applicable to `<audio>`, `<video>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_loop.asp)
    @discardableResult
    public func loop<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        loop(value.stateValue.wrappedValue)
        value.stateValue.listen { self.loop($0) }
        return self
    }
}

extension Audio: LoopAttrable {}
extension Video: LoopAttrable {}

// MARK: - LowAttrable

public protocol LowAttrable: DOMElement {
    @discardableResult
    func low(_ value: Double) -> Self
    @discardableResult
    func low<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Double
}

extension LowAttrable {
    /// Indicates the upper bound of the lower range.
    ///
    /// Applicable to `<meter>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_low.asp)
    @discardableResult
    public func low(_ value: Double) -> Self {
        setAttribute("low", value)
        return self
    }
    
    /// Indicates the upper bound of the lower range.
    ///
    /// Applicable to `<meter>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_low.asp)
    @discardableResult
    public func low<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Double {
        low(value.stateValue.wrappedValue)
        value.stateValue.listen { self.low($0) }
        return self
    }
}

extension Meter: LowAttrable {}

// MARK: - MaxAttrable

public protocol MaxAttrable: DOMElement {
    @discardableResult
    func max(_ value: Double) -> Self
    @discardableResult
    func max<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Double
}

extension MaxAttrable {
    /// Indicates the maximum value allowed.
    ///
    /// Applicable to `<input>`, `<meter>`, `<progress>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_max.asp)
    @discardableResult
    public func max(_ value: Double) -> Self {
        setAttribute("max", value)
        return self
    }
    
    /// Indicates the maximum value allowed.
    ///
    /// Applicable to `<input>`, `<meter>`, `<progress>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_max.asp)
    @discardableResult
    public func max<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Double {
        max(value.stateValue.wrappedValue)
        value.stateValue.listen { self.max($0) }
        return self
    }
}
extension Meter: MaxAttrable {}
extension Progress: MaxAttrable {}
extension InputNumber: MaxAttrable {}
extension InputRange: MaxAttrable {}

public protocol MaxDateAttrable: DOMElement {
    @discardableResult
    func max(_ value: String) -> Self
    @discardableResult
    func max<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension MaxDateAttrable {
    /// Indicates the maximum value allowed.
    ///
    /// Applicable to `<input>`, `<meter>`, `<progress>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_max.asp)
    @discardableResult
    public func max(_ value: String) -> Self {
        setAttribute("max", value)
        return self
    }
    
    /// Indicates the maximum value allowed.
    ///
    /// Applicable to `<input>`, `<meter>`, `<progress>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_max.asp)
    @discardableResult
    public func max<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        max(value.stateValue.wrappedValue)
        value.stateValue.listen { self.max($0) }
        return self
    }
}
extension InputDateTime: MaxDateAttrable {}
extension InputDate: MaxDateAttrable {}
extension InputTime: MaxDateAttrable {}
extension InputWeek: MaxDateAttrable {}
extension InputMonth: MaxDateAttrable {}

// MARK: - MaxLengthAttrable

public protocol MaxLengthAttrable: DOMElement {
    @discardableResult
    func maxlength(_ value: UInt) -> Self
    @discardableResult
    func maxlength<S>(_ value: S) -> Self where S: StateConvertible, S.Value == UInt
}

extension MaxLengthAttrable {
    /// Defines the maximum number of characters allowed in the element.
    ///
    /// Applicable to `<input>`, `<textarea>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/maxlength)
    @discardableResult
    public func maxlength(_ value: UInt) -> Self {
        setAttribute("maxlength", value)
        return self
    }
    
    /// Defines the maximum number of characters allowed in the element.
    ///
    /// Applicable to `<input>`, `<textarea>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/maxlength)
    @discardableResult
    public func maxlength<S>(_ value: S) -> Self where S: StateConvertible, S.Value == UInt {
        maxlength(value.stateValue.wrappedValue)
        value.stateValue.listen { self.maxlength($0) }
        return self
    }
}

extension InputText: MaxLengthAttrable {}
extension InputTel: MaxLengthAttrable {}
extension InputPassword: MaxLengthAttrable {}
extension InputSearch: MaxLengthAttrable {}
extension InputURL: MaxLengthAttrable {}
extension TextArea: MaxLengthAttrable {}

// MARK: - MethodAttrable

public protocol MethodAttrable: DOMElement {
    @discardableResult
    func method(_ value: MethodType) -> Self
    @discardableResult
    func method<S>(_ value: S) -> Self where S: StateConvertible, S.Value == MethodType
}

extension MethodAttrable {
    /// Defines which HTTP method to use when submitting the form.
    /// Can be GET (default) or POST.
    ///
    /// Applicable to `<form>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_method.asp)
    @discardableResult
    public func method(_ value: MethodType) -> Self {
        setAttribute("method", value.value)
        return self
    }
    
    /// Defines which HTTP method to use when submitting the form.
    /// Can be GET (default) or POST.
    ///
    /// Applicable to `<form>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_method.asp)
    @discardableResult
    public func method<S>(_ value: S) -> Self where S: StateConvertible, S.Value == MethodType {
        method(value.stateValue.wrappedValue)
        value.stateValue.listen { self.method($0) }
        return self
    }
}

extension Form: MethodAttrable {}

// MARK: - MinAttrable

public protocol MinAttrable: DOMElement {
    @discardableResult
    func min(_ value: Double) -> Self
    @discardableResult
    func min<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Double
}

extension MinAttrable {
    /// Indicates the minimum value allowed.
    ///
    /// Applicable to `<input>`, `<meter>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_min.asp)
    @discardableResult
    public func min(_ value: Double) -> Self {
        setAttribute("min", value)
        return self
    }
    
    /// Indicates the minimum value allowed.
    ///
    /// Applicable to `<input>`, `<meter>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_min.asp)
    @discardableResult
    public func min<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Double {
        min(value.stateValue.wrappedValue)
        value.stateValue.listen { self.min($0) }
        return self
    }
}
extension Meter: MinAttrable {}
extension InputNumber: MinAttrable {}
extension InputRange: MinAttrable {}

public protocol MinDateAttrable: DOMElement {
    @discardableResult
    func min<U>(_ value: U) -> Self where U: UniValue, U.UniValue == String
}

extension MinDateAttrable {
    /// Indicates the minimum value allowed.
    ///
    /// Applicable to `<input>`, `<meter>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_min.asp)
    @discardableResult
    public func min<U>(_ value: U) -> Self where U: UniValue, U.UniValue == String {
        setAttribute("min", value.uniValue)
        value.uniStateValue?.listen {
            self.setAttribute("min", $0)
        }
        return self
    }
}
extension InputDateTime: MinDateAttrable {}
extension InputDate: MinDateAttrable {}
extension InputTime: MinDateAttrable {}
extension InputWeek: MinDateAttrable {}
extension InputMonth: MinDateAttrable {}

// MARK: - MinLengthAttrable

public protocol MinLengthAttrable: DOMElement {
    @discardableResult
    func minlength(_ value: UInt) -> Self
    @discardableResult
    func minlength<S>(_ value: S) -> Self where S: StateConvertible, S.Value == UInt
}

extension MinLengthAttrable {
    /// Defines the minimum number of characters allowed in the element.
    ///
    /// Applicable to `<input>`, `<textarea>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/minlength)
    @discardableResult
    public func minlength(_ value: UInt) -> Self {
        setAttribute("minlength", value)
        return self
    }
    
    /// Defines the minimum number of characters allowed in the element.
    ///
    /// Applicable to `<input>`, `<textarea>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/minlength)
    @discardableResult
    public func minlength<S>(_ value: S) -> Self where S: StateConvertible, S.Value == UInt {
        minlength(value.stateValue.wrappedValue)
        value.stateValue.listen { self.minlength($0) }
        return self
    }
}

extension InputText: MinLengthAttrable {}
extension InputTel: MinLengthAttrable {}
extension InputPassword: MinLengthAttrable {}
extension InputSearch: MinLengthAttrable {}
extension InputURL: MinLengthAttrable {}
extension TextArea: MinLengthAttrable {}

// MARK: - MultipleAttrable

public protocol MultipleAttrable: DOMElement {
    @discardableResult
    func multiple(_ value: Bool) -> Self
    @discardableResult
    func multiple<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

extension MultipleAttrable {
    /// Indicates whether multiple values can be entered in an input of the type email or file.
    ///
    /// Applicable to `<input>`, `<select>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/multiple)
    @discardableResult
    public func multiple(_ value: Bool) -> Self {
        setAttribute("multiple", value, .short)
        return self
    }
    
    /// Indicates whether multiple values can be entered in an input of the type email or file.
    ///
    /// Applicable to `<input>`, `<select>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/multiple)
    @discardableResult
    public func multiple<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        multiple(value.stateValue.wrappedValue)
        value.stateValue.listen { self.multiple($0) }
        return self
    }
}

extension InputEmail: MultipleAttrable {}
extension InputFile: MultipleAttrable {}
extension Select: MultipleAttrable {}

// MARK: - MutedAttrable

public protocol MutedAttrable: DOMElement {
    @discardableResult
    func muted(_ value: Bool) -> Self
    @discardableResult
    func muted<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

extension MutedAttrable {
    /// Indicates whether the audio will be initially silenced on page load.
    ///
    /// Applicable to `<audio>`, `<video>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_muted.asp)
    @discardableResult
    public func muted(_ value: Bool) -> Self {
        setAttribute("muted", value, .short)
        return self
    }
    
    /// Indicates whether the audio will be initially silenced on page load.
    ///
    /// Applicable to `<audio>`, `<video>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_muted.asp)
    @discardableResult
    public func muted<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        muted(value.stateValue.wrappedValue)
        value.stateValue.listen { self.muted($0) }
        return self
    }
}

extension Audio: MutedAttrable {}
extension Video: MutedAttrable {}

// MARK: - NameAttrable

public protocol NameAttrable: DOMElement {
    @discardableResult
    func name(_ value: String) -> Self
    @discardableResult
    func name<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension NameAttrable {
    /// Name of theelement. For example used by the server to identify the fields in form submits.
    ///
    /// Applicable to `<button>`, `<form>`, `<fieldset>`, `<iframe>`, `<input>`,
    /// `<object>`, `<output>`, `<select>`, `<textarea>`, `<map>`, `<meta>`, `<param>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_name.asp)
    @discardableResult
    public func name(_ value: String) -> Self {
        setAttribute("name", value)
        return self
    }
    
    /// Name of theelement. For example used by the server to identify the fields in form submits.
    ///
    /// Applicable to `<button>`, `<form>`, `<fieldset>`, `<iframe>`, `<input>`,
    /// `<object>`, `<output>`, `<select>`, `<textarea>`, `<map>`, `<meta>`, `<param>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_name.asp)
    @discardableResult
    public func name<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        name(value.stateValue.wrappedValue)
        value.stateValue.listen { self.name($0) }
        return self
    }
}

extension Button: NameAttrable {}
extension Form: NameAttrable {}
extension FieldSet: NameAttrable {}
extension IFrame: NameAttrable {}
extension InputText: NameAttrable {}
extension InputTel: NameAttrable {}
extension InputEmail: NameAttrable {}
extension InputPassword: NameAttrable {}
extension InputSearch: NameAttrable {}
extension InputURL: NameAttrable {}
extension InputNumber: NameAttrable {}
extension InputRange: NameAttrable {}
extension InputImage: NameAttrable {}
extension InputButton: NameAttrable {}
extension InputSubmit: NameAttrable {}
extension InputReset: NameAttrable {}
extension InputHidden: NameAttrable {}
extension InputCheckbox: NameAttrable {}
extension InputRadio: NameAttrable {}
extension InputColor: NameAttrable {}
extension InputDateTime: NameAttrable {}
extension InputDate: NameAttrable {}
extension InputTime: NameAttrable {}
extension InputWeek: NameAttrable {}
extension InputMonth: NameAttrable {}
extension InputFile: NameAttrable {}
extension Object: NameAttrable {}
extension Output: NameAttrable {}
extension Select: NameAttrable {}
extension TextArea: NameAttrable {}
extension Map: NameAttrable {}
extension Meta: NameAttrable {}
extension Param: NameAttrable {}

// MARK: - NoValidateAttrable

public protocol NoValidateAttrable: DOMElement {
    @discardableResult
    func noValidate(_ value: Bool) -> Self
    @discardableResult
    func noValidate<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

extension NoValidateAttrable {
    /// The novalidate attribute is a boolean attribute.
    /// When present, it specifies that the form-data (input) should not be validated when submitted.
    ///
    /// Applicable to `<button>`, `<input>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_form_novalidate.asp)
    @discardableResult
    public func noValidate(_ value: Bool) -> Self {
        setAttribute("novalidate", value, .short)
        return self
    }
    
    /// The novalidate attribute is a boolean attribute.
    /// When present, it specifies that the form-data (input) should not be validated when submitted.
    ///
    /// Applicable to `<button>`, `<input>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_form_novalidate.asp)
    @discardableResult
    public func noValidate<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        noValidate(value.stateValue.wrappedValue)
        value.stateValue.listen { self.noValidate($0) }
        return self
    }
}

extension Form: NoValidateAttrable {}

// MARK: - OpenAttrable

public protocol OpenAttrable: DOMElement {
    @discardableResult
    func open(_ value: Bool) -> Self
    @discardableResult
    func open<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

extension OpenAttrable {
    /// Indicates whether the details will be shown on page load.
    ///
    /// Applicable to `<details>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_open.asp)
    @discardableResult
    public func open(_ value: Bool) -> Self {
        setAttribute("open", value, .short)
        return self
    }
    
    /// Indicates whether the details will be shown on page load.
    ///
    /// Applicable to `<details>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_open.asp)
    @discardableResult
    public func open<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        open(value.stateValue.wrappedValue)
        value.stateValue.listen { self.open($0) }
        return self
    }
}

extension Details: OpenAttrable {}

// MARK: - OptimumAttrable

public protocol OptimumAttrable: DOMElement {
    @discardableResult
    func optimum(_ value: Double) -> Self
    @discardableResult
    func optimum<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Double
}

extension OptimumAttrable {
    /// Indicates the lower bound of the upper range.
    ///
    /// Applicable to `<meter>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_optimum.asp)
    @discardableResult
    public func optimum(_ value: Double) -> Self {
        setAttribute("optimum", value)
        return self
    }
    
    /// Indicates the lower bound of the upper range.
    ///
    /// Applicable to `<meter>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_optimum.asp)
    @discardableResult
    public func optimum<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Double {
        optimum(value.stateValue.wrappedValue)
        value.stateValue.listen { self.optimum($0) }
        return self
    }
}

extension Meter: OptimumAttrable {}

// MARK: - PatternAttrable

public protocol PatternAttrable: DOMElement {
    @discardableResult
    func pattern(_ value: String) -> Self
    @discardableResult
    func pattern<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension PatternAttrable {
    /// Defines a regular expression which the element's value will be validated against.
    ///
    /// Applicable to `<input>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/pattern)
    @discardableResult
    public func pattern(_ value: String) -> Self {
        setAttribute("pattern", value)
        return self
    }
    
    /// Defines a regular expression which the element's value will be validated against.
    ///
    /// Applicable to `<input>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/pattern)
    @discardableResult
    public func pattern<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        pattern(value.stateValue.wrappedValue)
        value.stateValue.listen { self.pattern($0) }
        return self
    }
}

extension InputText: PatternAttrable {}
extension InputTel: PatternAttrable {}
extension InputPassword: PatternAttrable {}

// MARK: - PingAttrable

public protocol PingAttrable: DOMElement {
    @discardableResult
    func ping(_ value: [URLConformable]) -> Self
    @discardableResult
    func ping(_ value: URLConformable...) -> Self
    @discardableResult
    func ping<S>(_ value: S) -> Self where S: StateConvertible, S.Value: URLConformable
    @discardableResult
    func ping<S>(_ value: S) -> Self where S: StateConvertible, S.Value == [URLConformable]
}

extension PingAttrable {
    /// The ping attribute specifies a space-separated list of URLs to be notified if a user follows the hyperlink.
    ///
    /// Applicable to `<a>`, `<area>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#attr-ping)
    @discardableResult
    private func ping(value: URLConformable) -> Self {
        setAttribute("ping", value.stringValue)
        return self
    }
    
    /// The ping attribute specifies a space-separated list of URLs to be notified if a user follows the hyperlink.
    ///
    /// Applicable to `<a>`, `<area>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#attr-ping)
    @discardableResult
    public func ping(_ value: [URLConformable]) -> Self {
        ping(value: value.map { $0.stringValue }.joined(separator: " "))
    }
    
    /// The ping attribute specifies a space-separated list of URLs to be notified if a user follows the hyperlink.
    ///
    /// Applicable to `<a>`, `<area>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#attr-ping)
    @discardableResult
    public func ping(_ value: URLConformable...) -> Self {
        ping(value)
    }
    
    /// The ping attribute specifies a space-separated list of URLs to be notified if a user follows the hyperlink.
    ///
    /// Applicable to `<a>`, `<area>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#attr-ping)
    @discardableResult
    public func ping<S>(_ value: S) -> Self where S: StateConvertible, S.Value: URLConformable {
        ping(value: value.stateValue.wrappedValue)
        value.stateValue.listen { self.ping(value: $0) }
        return self
    }
    
    /// The ping attribute specifies a space-separated list of URLs to be notified if a user follows the hyperlink.
    ///
    /// Applicable to `<a>`, `<area>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#attr-ping)
    @discardableResult
    public func ping<S>(_ value: S) -> Self where S: StateConvertible, S.Value == [URLConformable] {
        ping(value.stateValue.wrappedValue)
        value.stateValue.listen { self.ping($0) }
        return self
    }
}

extension A: PingAttrable {}
extension Area: PingAttrable {}

// MARK: - PlaceholderAttrable

public protocol PlaceholderAttrable: DOMElement {
    @discardableResult
    func placeholder(_ value: String) -> Self
    @discardableResult
    func placeholder<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension PlaceholderAttrable {
    /// Provides a hint to the user of what can be entered in the field.
    ///
    /// Applicable to `<input>`, `<textarea>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_placeholder.asp)
    @discardableResult
    public func placeholder(_ value: String) -> Self {
        setAttribute("placeholder", value)
        return self
    }
    
    /// Provides a hint to the user of what can be entered in the field.
    ///
    /// Applicable to `<input>`, `<textarea>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_placeholder.asp)
    @discardableResult
    public func placeholder<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        placeholder(value.stateValue.wrappedValue)
        value.stateValue.listen { self.placeholder($0) }
        return self
    }
}

extension InputText: PlaceholderAttrable {}
extension InputTel: PlaceholderAttrable {}
extension InputEmail: PlaceholderAttrable {}
extension InputPassword: PlaceholderAttrable {}
extension InputSearch: PlaceholderAttrable {}
extension InputURL: PlaceholderAttrable {}
extension InputNumber: PlaceholderAttrable {}
extension InputDateTime: PlaceholderAttrable {}
extension InputDate: PlaceholderAttrable {}
extension InputTime: PlaceholderAttrable {}
extension InputWeek: PlaceholderAttrable {}
extension InputMonth: PlaceholderAttrable {}
extension TextArea: PlaceholderAttrable {}

// MARK: - PosterAttrable

public protocol PosterAttrable: DOMElement {
    @discardableResult
    func poster<U: URLConformable>(_ value: U) -> Self
    @discardableResult
    func poster<S>(_ value: S) -> Self where S: StateConvertible, S.Value: URLConformable
}

extension PosterAttrable {
    /// A URL indicating a poster frame to show until the user plays or seeks.
    ///
    /// Applicable to `<video>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_poster.asp)
    @discardableResult
    public func poster<U: URLConformable>(_ value: U) -> Self {
        setAttribute("poster", value.stringValue)
        return self
    }
    
    /// A URL indicating a poster frame to show until the user plays or seeks.
    ///
    /// Applicable to `<video>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_poster.asp)
    @discardableResult
    public func poster<S>(_ value: S) -> Self where S: StateConvertible, S.Value: URLConformable {
        poster(value.stateValue.wrappedValue)
        value.stateValue.listen { self.poster($0) }
        return self
    }
}

extension Video: PosterAttrable {}

// MARK: - PreloadAttrable

public protocol PreloadAttrable: DOMElement {
    @discardableResult
    func preload(_ value: PreloadType) -> Self
    @discardableResult
    func preload<S>(_ value: S) -> Self where S: StateConvertible, S.Value == PreloadType
}

extension PreloadAttrable {
    /// Indicates whether the whole resource, parts of it or nothing should be preloaded.
    ///
    /// Applicable to `<audio>`, `<video>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/video)
    @discardableResult
    public func preload(_ value: PreloadType) -> Self {
        setAttribute("preload", value.value)
        return self
    }
    
    /// Indicates whether the whole resource, parts of it or nothing should be preloaded.
    ///
    /// Applicable to `<audio>`, `<video>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/video)
    @discardableResult
    public func preload<S>(_ value: S) -> Self where S: StateConvertible, S.Value == PreloadType {
        preload(value.stateValue.wrappedValue)
        value.stateValue.listen { self.preload($0) }
        return self
    }
}

extension Audio: PreloadAttrable {}
extension Video: PreloadAttrable {}

// MARK: - ReadOnlyAttrable

public protocol ReadOnlyAttrable: DOMElement {
    @discardableResult
    func readonly(_ value: Bool) -> Self
    @discardableResult
    func readonly<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

extension ReadOnlyAttrable {
    /// Indicates whether the element can be edited.
    ///
    /// Applicable to `<input>`, `<textarea>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/readonly)
    @discardableResult
    public func readonly(_ value: Bool) -> Self {
        setAttribute("readonly", value, .long)
        return self
    }
    
    /// Indicates whether the element can be edited.
    ///
    /// Applicable to `<input>`, `<textarea>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/readonly)
    @discardableResult
    public func readonly<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        readonly(value.stateValue.wrappedValue)
        value.stateValue.listen { self.readonly($0) }
        return self
    }
}

extension InputText: ReadOnlyAttrable {}
extension InputTel: ReadOnlyAttrable {}
extension InputEmail: ReadOnlyAttrable {}
extension InputPassword: ReadOnlyAttrable {}
extension InputSearch: ReadOnlyAttrable {}
extension InputURL: ReadOnlyAttrable {}
extension InputNumber: ReadOnlyAttrable {}
extension InputRange: ReadOnlyAttrable {}
extension InputImage: ReadOnlyAttrable {}
extension InputButton: ReadOnlyAttrable {}
extension InputSubmit: ReadOnlyAttrable {}
extension InputReset: ReadOnlyAttrable {}
extension InputHidden: ReadOnlyAttrable {}
extension InputCheckbox: ReadOnlyAttrable {}
extension InputRadio: ReadOnlyAttrable {}
extension InputColor: ReadOnlyAttrable {}
extension InputDateTime: ReadOnlyAttrable {}
extension InputDate: ReadOnlyAttrable {}
extension InputTime: ReadOnlyAttrable {}
extension InputWeek: ReadOnlyAttrable {}
extension InputMonth: ReadOnlyAttrable {}
extension InputFile: ReadOnlyAttrable {}
extension TextArea: ReadOnlyAttrable {}

// MARK: - RelAttrable

public protocol RelAttrable: DOMElement {
    @discardableResult
    func rel(_ value: RelType) -> Self
    @discardableResult
    func rel<S>(_ value: S) -> Self where S: StateConvertible, S.Value == RelType
}

extension RelAttrable {
    /// Specifies the relationship of the target object to the link object.
    ///
    /// Applicable to `<a>`, `<area>`, `<form>`, and `<link>`
    ///
    /// [More info →](https://www.w3resource.com/html/attributes/html-align-attribute.php)
    @discardableResult
    public func rel(_ value: RelType) -> Self {
        setAttribute("rel", value.value)
        return self
    }
    
    /// Specifies the relationship of the target object to the link object.
    ///
    /// Applicable to `<a>`, `<area>`, `<form>`, and `<link>`
    ///
    /// [More info →](https://www.w3resource.com/html/attributes/html-align-attribute.php)
    @discardableResult
    public func rel<S>(_ value: S) -> Self where S: StateConvertible, S.Value == RelType {
        rel(value.stateValue.wrappedValue)
        value.stateValue.listen { self.rel($0) }
        return self
    }
}

extension A: RelAttrable {}
extension Area: RelAttrable {}
extension Link: RelAttrable {}

// MARK: - RequiredAttrable

public protocol RequiredAttrable: DOMElement {
    @discardableResult
    func required(_ value: Bool) -> Self
    @discardableResult
    func required<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

extension RequiredAttrable {
    /// Indicates whether this element is required to fill out or not.
    ///
    /// Applicable to `<input>`, `<select>`, `<textarea>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/required)
    @discardableResult
    public func required(_ value: Bool) -> Self {
        setAttribute("required", value, .long)
        return self
    }
    
    /// Indicates whether this element is required to fill out or not.
    ///
    /// Applicable to `<input>`, `<select>`, `<textarea>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/required)
    @discardableResult
    public func required<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        required(value.stateValue.wrappedValue)
        value.stateValue.listen { self.required($0) }
        return self
    }
}

extension InputText: RequiredAttrable {}
extension InputTel: RequiredAttrable {}
extension InputEmail: RequiredAttrable {}
extension InputPassword: RequiredAttrable {}
extension InputSearch: RequiredAttrable {}
extension InputURL: RequiredAttrable {}
extension InputNumber: RequiredAttrable {}
extension InputRange: RequiredAttrable {}
extension InputImage: RequiredAttrable {}
extension InputButton: RequiredAttrable {}
extension InputSubmit: RequiredAttrable {}
extension InputReset: RequiredAttrable {}
extension InputHidden: RequiredAttrable {}
extension InputCheckbox: RequiredAttrable {}
extension InputRadio: RequiredAttrable {}
extension InputColor: RequiredAttrable {}
extension InputDateTime: RequiredAttrable {}
extension InputDate: RequiredAttrable {}
extension InputTime: RequiredAttrable {}
extension InputWeek: RequiredAttrable {}
extension InputMonth: RequiredAttrable {}
extension InputFile: RequiredAttrable {}
extension Select: RequiredAttrable {}
extension TextArea: RequiredAttrable {}

// MARK: - ReversedAttrable

public protocol ReversedAttrable: DOMElement {
    @discardableResult
    func reversed(_ value: Bool) -> Self
    @discardableResult
    func reversed<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

extension ReversedAttrable {
    /// Indicates whether the list should be displayed in a descending order instead of a ascending.
    ///
    /// Applicable to `<ol>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_reversed.asp)
    @discardableResult
    public func reversed(_ value: Bool) -> Self {
        setAttribute("reversed", value, .short)
        return self
    }
    
    /// Indicates whether the list should be displayed in a descending order instead of a ascending.
    ///
    /// Applicable to `<ol>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_reversed.asp)
    @discardableResult
    public func reversed<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        reversed(value.stateValue.wrappedValue)
        value.stateValue.listen { self.reversed($0) }
        return self
    }
}

extension Ol: ReadOnlyAttrable {}

// MARK: - RowSpanAttrable

public protocol RowSpanAttrable: DOMElement {
    @discardableResult
    func rowSpan(_ value: Int) -> Self
    @discardableResult
    func rowSpan<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Int
}

extension RowSpanAttrable {
    /// The rowspan attribute specifies the number of rows a cell should span.
    ///
    /// Applicable to `<td>`, `<th>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_rowspan.asp)
    @discardableResult
    public func rowSpan(_ value: Int) -> Self {
        setAttribute("rowSpan", value)
        return self
    }
    
    /// The rowspan attribute specifies the number of rows a cell should span.
    ///
    /// Applicable to `<td>`, `<th>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_rowspan.asp)
    @discardableResult
    public func rowSpan<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Int {
        rowSpan(value.stateValue.wrappedValue)
        value.stateValue.listen { self.rowSpan($0) }
        return self
    }
}

extension Td: RowSpanAttrable {}
extension Th: RowSpanAttrable {}

// MARK: - RowsAttrable

public protocol RowsAttrable: DOMElement {
    @discardableResult
    func rows(_ value: Int) -> Self
    @discardableResult
    func rows<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Int
}

extension RowsAttrable {
    /// Defines the number of rows in a textarea.
    ///
    /// Applicable to `<textarea>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/rows)
    @discardableResult
    public func rows(_ value: Int) -> Self {
        setAttribute("rows", value)
        return self
    }
    
    /// Defines the number of rows in a textarea.
    ///
    /// Applicable to `<textarea>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/rows)
    @discardableResult
    public func rows<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Int {
        rows(value.stateValue.wrappedValue)
        value.stateValue.listen { self.rows($0) }
        return self
    }
}

extension TextArea: RowsAttrable {}

// MARK: - SandboxAttrable

public protocol SandboxAttrable: DOMElement {
    @discardableResult
    func sandbox(_ value: Bool) -> Self
    @discardableResult
    func sandbox<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

extension SandboxAttrable {
    /// Stops a document loaded in an iframe from using certain features (such as submitting forms or opening new windows).
    ///
    /// Applicable to `<iframe>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe#attr-sandbox)
    @discardableResult
    public func sandbox(_ value: Bool) -> Self {
        setAttribute("sandbox", value, .short)
        return self
    }
    
    /// Stops a document loaded in an iframe from using certain features (such as submitting forms or opening new windows).
    ///
    /// Applicable to `<iframe>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe#attr-sandbox)
    @discardableResult
    public func sandbox<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        sandbox(value.stateValue.wrappedValue)
        value.stateValue.listen { self.sandbox($0) }
        return self
    }
}

extension IFrame: SandboxAttrable {}

// MARK: - ScopeAttrable

public protocol ScopeAttrable: DOMElement {
    @discardableResult
    func scope(_ value: ScopeType) -> Self
    @discardableResult
    func scope<S>(_ value: S) -> Self where S: StateConvertible, S.Value == ScopeType
}

extension ScopeAttrable {
    /// Defines the cells that the header test (defined in the th element) relates to.
    ///
    /// Applicable to `<th>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_scope.asp)
    @discardableResult
    public func scope(_ value: ScopeType) -> Self {
        setAttribute("scope", value.value)
        return self
    }
    
    /// Defines the cells that the header test (defined in the th element) relates to.
    ///
    /// Applicable to `<th>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_scope.asp)
    @discardableResult
    public func scope<S>(_ value: S) -> Self where S: StateConvertible, S.Value == ScopeType {
        scope(value.stateValue.wrappedValue)
        value.stateValue.listen { self.scope($0) }
        return self
    }
}

extension Th: ScopeAttrable {}

// MARK: - SelectedAttrable

public protocol SelectedAttrable: DOMElement {
    @discardableResult
    func selected(_ value: Bool) -> Self
    @discardableResult
    func selected<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

extension SelectedAttrable {
    /// Defines a value which will be selected on page load.
    ///
    /// Applicable to `<option>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_selected.asp)
    @discardableResult
    public func selected(_ value: Bool) -> Self {
        setAttribute("selected", value, .short)
        return self
    }
    
    /// Defines a value which will be selected on page load.
    ///
    /// Applicable to `<option>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_selected.asp)
    @discardableResult
    public func selected<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        selected(value.stateValue.wrappedValue)
        value.stateValue.listen { self.selected($0) }
        return self
    }
}

extension Option: SelectedAttrable {}

// MARK: - ShapeAttrable

public protocol ShapeAttrable: DOMElement {
    @discardableResult
    func shape(_ value: ShapeType) -> Self
    @discardableResult
    func shape<S>(_ value: S) -> Self where S: StateConvertible, S.Value == ShapeType
}

extension ShapeAttrable {
    /// The shape of the associated hot spot.
    ///
    /// Applicable to `<a>`, `<area>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/area)
    @discardableResult
    public func shape(_ value: ShapeType) -> Self {
        setAttribute("shape", value.value)
        return self
    }
    
    /// The shape of the associated hot spot.
    ///
    /// Applicable to `<a>`, `<area>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/area)
    @discardableResult
    public func shape<S>(_ value: S) -> Self where S: StateConvertible, S.Value == ShapeType {
        shape(value.stateValue.wrappedValue)
        value.stateValue.listen { self.shape($0) }
        return self
    }
}

extension A: ShapeAttrable {}
extension Area: ShapeAttrable {}

// MARK: - SizeAttrable

public protocol SizeAttrable: DOMElement {
    @discardableResult
    func size(_ value: Int) -> Self
    @discardableResult
    func size<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Int
}

extension SizeAttrable {
    /// The size attribute defines the width of the `<input>` and the height of the `<select>` element.
    ///
    /// For the input, if the type attribute is text or password then it's the number of characters.
    /// This must be an integer value 0 or higher.
    /// If no size is specified, or an invalid value is specified, the input has no size declared,
    /// and the form control will be the default width based on the user agent.
    /// If CSS targets the element with properties impacting the width, CSS takes precedence.
    ///
    /// The size attribute has no impact on constraint validation.
    ///
    /// Applicable to `<input>`, `<select>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/size)
    @discardableResult
    public func size(_ value: Int) -> Self {
        setAttribute("size", value)
        return self
    }
    
    /// The size attribute defines the width of the `<input>` and the height of the `<select>` element.
    ///
    /// For the input, if the type attribute is text or password then it's the number of characters.
    /// This must be an integer value 0 or higher.
    /// If no size is specified, or an invalid value is specified, the input has no size declared,
    /// and the form control will be the default width based on the user agent.
    /// If CSS targets the element with properties impacting the width, CSS takes precedence.
    ///
    /// The size attribute has no impact on constraint validation.
    ///
    /// Applicable to `<input>`, `<select>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/size)
    @discardableResult
    public func size<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Int {
        size(value.stateValue.wrappedValue)
        value.stateValue.listen { self.size($0) }
        return self
    }
}

extension InputText: SizeAttrable {}
extension InputTel: SizeAttrable {}
extension InputEmail: SizeAttrable {}
extension InputPassword: SizeAttrable {}
extension Select: SizeAttrable {}

// MARK: - SizesAttrable

public protocol SizesAttrable: DOMElement {
    @discardableResult
    func sizes(_ w: Int, _ h: Int) -> Self
    func sizes<W>(_ w: W, _ h: Int) -> Self where W: StateConvertible, W.Value == Int
    func sizes<H>(_ w: Int, _ h: H) -> Self where H: StateConvertible, H.Value == Int
    func sizes<W, H>(_ w: W, _ h: H) -> Self where W: StateConvertible, W.Value == Int, H: StateConvertible, H.Value == Int
}

extension SizesAttrable {
    /// The sizes attribute specifies the sizes of icons for visual media.
    ///
    /// This attribute is only used if rel="icon".
    ///
    /// Applicable to `<link>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_sizes.asp)
    @discardableResult
    public func sizes(_ w: Int, _ h: Int) -> Self {
        setAttribute("sizes", "\(w)x\(h)")
        return self
    }
    
    /// The sizes attribute specifies the sizes of icons for visual media.
    ///
    /// This attribute is only used if rel="icon".
    ///
    /// Applicable to `<link>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_sizes.asp)
    @discardableResult
    public func sizes<W>(_ w: W, _ h: Int) -> Self where W: StateConvertible, W.Value == Int {
        sizes(w.stateValue.wrappedValue, h)
        w.stateValue.listen { self.sizes($0, h) }
        return self
    }
    
    /// The sizes attribute specifies the sizes of icons for visual media.
    ///
    /// This attribute is only used if rel="icon".
    ///
    /// Applicable to `<link>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_sizes.asp)
    @discardableResult
    public func sizes<H>(_ w: Int, _ h: H) -> Self where H: StateConvertible, H.Value == Int {
        sizes(w, h.stateValue.wrappedValue)
        h.stateValue.listen { self.sizes(w, $0) }
        return self
    }
    
    /// The sizes attribute specifies the sizes of icons for visual media.
    ///
    /// This attribute is only used if rel="icon".
    ///
    /// Applicable to `<link>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_sizes.asp)
    @discardableResult
    public func sizes<W, H>(_ w: W, _ h: H) -> Self where W: StateConvertible, W.Value == Int, H: StateConvertible, H.Value == Int {
        sizes(w.stateValue.wrappedValue, h.stateValue.wrappedValue)
        w.stateValue.and(h.stateValue).listen { self.sizes($0, $1) }
        return self
    }
}

extension Link: SizesAttrable {}

// MARK: - SlotAttrable

public protocol SlotAttrable: DOMElement {
    @discardableResult
    func slot(_ value: String) -> Self
    @discardableResult
    func slot<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension SlotAttrable {
    /// Assigns a slot in a shadow DOM shadow tree to an element.
    ///
    /// Points to slot name.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/Web_Components/Using_templates_and_slots)
    @discardableResult
    public func slot(_ value: String) -> Self {
        setAttribute("slot", value)
        return self
    }
    
    /// Assigns a slot in a shadow DOM shadow tree to an element.
    ///
    /// Points to slot name.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/Web_Components/Using_templates_and_slots)
    @discardableResult
    public func slot<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        slot(value.stateValue)
        value.stateValue.listen { self.slot($0) }
        return self
    }
}

extension BaseElement: SlotAttrable {}

// MARK: - SpanAttrable

public protocol SpanAttrable: DOMElement {
    @discardableResult
    func span(_ value: Int) -> Self
    @discardableResult
    func span<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Int
}

extension SpanAttrable {
    /// The span attribute defines the number of columns a `<col>`/`<colgroup>` element should span.
    ///
    /// Applicable to `<col>`, `<colgroup>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_span.asp)
    @discardableResult
    public func span(_ value: Int) -> Self {
        setAttribute("span", value)
        return self
    }
    
    /// The span attribute defines the number of columns a `<col>`/`<colgroup>` element should span.
    ///
    /// Applicable to `<col>`, `<colgroup>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_span.asp)
    @discardableResult
    public func span<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Int {
        span(value.stateValue.wrappedValue)
        value.stateValue.listen { self.span($0) }
        return self
    }
}

extension Col: SpanAttrable {}
extension ColGroup: SpanAttrable {}

// MARK: - SpellCheckAttrable

public protocol SpellCheckAttrable: DOMElement {
    @discardableResult
    func spellcheck(_ value: Bool) -> Self
    @discardableResult
    func spellcheck<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

extension SpellCheckAttrable {
    /// Indicates whether spell checking is allowed for the element.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/spellcheck)
    @discardableResult
    public func spellcheck(_ value: Bool) -> Self {
        setAttribute("spellcheck", value, .full)
        return self
    }
    
    /// Indicates whether spell checking is allowed for the element.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/spellcheck)
    @discardableResult
    public func spellcheck<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        spellcheck(value.stateValue.wrappedValue)
        value.stateValue.listen { self.spellcheck($0) }
        return self
    }
}

extension BaseElement: SpellCheckAttrable {}

// MARK: - SrcAttrable

public protocol SrcAttrable: DOMElement {
    @discardableResult
    func src<U: URLConformable>(_ value: U) -> Self
    @discardableResult
    func src<S>(_ value: S) -> Self where S: StateConvertible, S.Value: URLConformable
}

extension SrcAttrable {
    /// The URL of the embeddable content.
    ///
    /// Applicable to `<audio>`, `<embed>`, `<iframe>`,
    /// `<img>`, `<input>`, `<script>`, `<source>`, `<track>`, `<video>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_src.asp)
    @discardableResult
    public func src<U: URLConformable>(_ value: U) -> Self {
        setAttribute("src", value.stringValue)
        return self
    }
    
    /// The URL of the embeddable content.
    ///
    /// Applicable to `<audio>`, `<embed>`, `<iframe>`,
    /// `<img>`, `<input>`, `<script>`, `<source>`, `<track>`, `<video>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_src.asp)
    @discardableResult
    public func src<S>(_ value: S) -> Self where S: StateConvertible, S.Value: URLConformable {
        src(value.stateValue.wrappedValue)
        value.stateValue.listen { self.src($0) }
        return self
    }
}

extension Audio: SrcAttrable {}
extension Embed: SrcAttrable {}
extension IFrame: SrcAttrable {}
extension Img: SrcAttrable {}
extension InputImage: SrcAttrable {}
extension Script: SrcAttrable {}
extension Source: SrcAttrable {}
extension Track: SrcAttrable {}
extension Video: SrcAttrable {}

// MARK: - LoadAttrable

public protocol LoadAttrable: DOMElement {
    @discardableResult
    func load<U: URLConformable>(_ value: U) -> Self
}

extension LoadAttrable {
    /// The URL of the embeddable content.
    ///
    /// Applicable to `<img>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_src.asp)
    @discardableResult
    public func load<U: URLConformable>(_ value: U) -> Self {
        let tempImg = Img()
        tempImg
        .src(value.stringValue)
        .onLoad {
            self.setAttribute("src", value.stringValue)
            tempImg.remove()
        }
        return self
    }
}

extension Img: LoadAttrable {}

// MARK: - SrcDocAttrable

public protocol SrcDocAttrable: DOMElement {
    @discardableResult
    func srcDoc(_ value: String) -> Self
    @discardableResult
    func srcDoc<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension SrcDocAttrable {
    /// Assigns a slot in a shadow DOM shadow tree to an element.
    ///
    /// Points to slot name.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/Web_Components/Using_templates_and_slots)
    @discardableResult
    public func srcDoc(_ value: String) -> Self {
        setAttribute("srcdoc", value)
        return self
    }
    
    /// Assigns a slot in a shadow DOM shadow tree to an element.
    ///
    /// Points to slot name.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/Web_Components/Using_templates_and_slots)
    @discardableResult
    public func srcDoc<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        srcDoc(value.stateValue.wrappedValue)
        value.stateValue.listen { self.srcDoc($0) }
        return self
    }
}

extension IFrame: SrcDocAttrable {}

// MARK: - SrcLangAttrable

public protocol SrcLangAttrable: DOMElement {
    @discardableResult
    func srcLang(_ value: String) -> Self
    @discardableResult
    func srcLang<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension SrcLangAttrable {
    /// The srclang attribute specifies the language of the track text data.
    ///
    /// This attribute is required if kind="subtitles".
    ///
    /// Applicable to `<track>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_srclang.asp)
    @discardableResult
    public func srcLang(_ value: String) -> Self {
        setAttribute("srclang", value)
        return self
    }
    
    /// The srclang attribute specifies the language of the track text data.
    ///
    /// This attribute is required if kind="subtitles".
    ///
    /// Applicable to `<track>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_srclang.asp)
    @discardableResult
    public func srcLang<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        srcLang(value.stateValue.wrappedValue)
        value.stateValue.listen { self.srcLang($0) }
        return self
    }
}

extension Track: SrcLangAttrable {}

// MARK: - SrcSetAttrable

public protocol SrcSetAttrable: DOMElement {
    @discardableResult
    func srcSet(_ value: String) -> Self
    @discardableResult
    func srcSet<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension SrcSetAttrable {
    /// The srcset attribute specifies the URL of the image to use in different situations.
    ///
    /// Applicable to `<img>`, `<source>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_source_srcset.asp)
    @discardableResult
    public func srcSet(_ value: String) -> Self {
        setAttribute("srcset", value)
        return self
    }
    
    /// The srcset attribute specifies the URL of the image to use in different situations.
    ///
    /// Applicable to `<img>`, `<source>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_source_srcset.asp)
    @discardableResult
    public func srcSet<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        srcSet(value.stateValue.wrappedValue)
        value.stateValue.listen { self.srcSet($0) }
        return self
    }
}

extension Img: SrcSetAttrable {}
extension Source: SrcSetAttrable {}

// MARK: - StartAttrable

public protocol StartAttrable: DOMElement {
    @discardableResult
    func start(_ value: Int) -> Self
    @discardableResult
    func start<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Int
}

extension StartAttrable {
    /// Defines the first number if other than 1.
    ///
    /// Applicable to `<ol>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_start.asp)
    @discardableResult
    public func start(_ value: Int) -> Self {
        setAttribute("start", value)
        return self
    }
    
    /// Defines the first number if other than 1.
    ///
    /// Applicable to `<ol>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_start.asp)
    @discardableResult
    public func start<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Int {
        start(value.stateValue.wrappedValue)
        value.stateValue.listen { self.start($0) }
        return self
    }
}

extension Ol: StartAttrable {}

// MARK: - StepAttrable

public protocol StepAttrable: DOMElement {
    @discardableResult
    func step(_ value: Double) -> Self
    @discardableResult
    func step<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Double
}

extension StepAttrable {
    /// The step attribute is a number that specifies the granularity
    /// that the value must adhere to or the keyword any.
    /// It is valid for the numeric input types,
    /// including the date, month, week, time, datetime-local, number and range types.
    ///
    /// Applicable to `<input>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/step)
    @discardableResult
    public func step(_ value: Double) -> Self {
        setAttribute("step", value)
        return self
    }
    
    /// The step attribute is a number that specifies the granularity
    /// that the value must adhere to or the keyword any.
    /// It is valid for the numeric input types,
    /// including the date, month, week, time, datetime-local, number and range types.
    ///
    /// Applicable to `<input>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/step)
    @discardableResult
    public func step<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Double {
        step(value.stateValue.wrappedValue)
        value.stateValue.listen { self.step($0) }
        return self
    }
}

extension InputNumber: StepAttrable {}
extension InputRange: StepAttrable {}
extension InputDateTime: StepAttrable {}
extension InputDate: StepAttrable {}
extension InputTime: StepAttrable {}
extension InputWeek: StepAttrable {}
extension InputMonth: StepAttrable {}

// MARK: - SummaryAttrable

public protocol SummaryAttrable: DOMElement {
    @discardableResult
    func summary(_ value: String) -> Self
    @discardableResult
    func summary<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension SummaryAttrable {
    /// The summary attribute specifies a summary of the content of a table.
    ///
    /// The summary attribute makes no visual difference in ordinary web browsers.
    ///
    /// This attribute can be used by screen readers
    ///
    /// Applicable to `<table>`
    ///
    /// [More info →](http://w3schools.sinsixx.com/tags/att_table_summary.asp.htm)
    @discardableResult
    public func summary(_ value: String) -> Self {
        setAttribute("summary", value)
        return self
    }
    
    /// The summary attribute specifies a summary of the content of a table.
    ///
    /// The summary attribute makes no visual difference in ordinary web browsers.
    ///
    /// This attribute can be used by screen readers
    ///
    /// Applicable to `<table>`
    ///
    /// [More info →](http://w3schools.sinsixx.com/tags/att_table_summary.asp.htm)
    @discardableResult
    public func summary<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        summary(value.stateValue.wrappedValue)
        value.stateValue.listen { self.summary($0) }
        return self
    }
}

extension Table: SummaryAttrable {}

// MARK: - TabIndexAttrable

public protocol TabIndexAttrable: DOMElement {
    @discardableResult
    func tabIndex(_ value: Int) -> Self
    @discardableResult
    func tabIndex<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Int
}

extension TabIndexAttrable {
    /// Overrides the browser's default tab order and follows the one specified instead.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/tabindex)
    @discardableResult
    public func tabIndex(_ value: Int) -> Self {
        setAttribute("tabIndex", value)
        return self
    }
    
    /// Overrides the browser's default tab order and follows the one specified instead.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/tabindex)
    @discardableResult
    public func tabIndex<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Int {
        tabIndex(value.stateValue.wrappedValue)
        value.stateValue.listen { self.tabIndex($0) }
        return self
    }
}

extension BaseElement: TabIndexAttrable {}

// MARK: - TargetAttrable

public protocol TargetAttrable: DOMElement {
    @discardableResult
    func target(_ value: TargetType) -> Self
    @discardableResult
    func target<S>(_ value: S) -> Self where S: StateConvertible, S.Value == TargetType
}

extension TargetAttrable {
    /// Specifies where to open the linked document (in the case of an `<a>` element)
    /// or where to display the response recieved (in the case of a `<form>` element)
    ///
    /// Applicable to `<a>`, `<area>`, `<base>`, and `<form>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/target)
    @discardableResult
    public func target(_ value: TargetType) -> Self {
        setAttribute("target", value.rawValue)
        return self
    }
    
    /// Specifies where to open the linked document (in the case of an `<a>` element)
    /// or where to display the response recieved (in the case of a `<form>` element)
    ///
    /// Applicable to `<a>`, `<area>`, `<base>`, and `<form>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/target)
    @discardableResult
    public func target<S>(_ value: S) -> Self where S: StateConvertible, S.Value == TargetType {
        target(value.stateValue.wrappedValue)
        value.stateValue.listen { self.target($0) }
        return self
    }
}

extension A: TargetAttrable {}
extension Area: TargetAttrable {}
extension Base: TargetAttrable {}
extension Form: TargetAttrable {}

// MARK: - TitleAttrable

public protocol TitleAttrable: DOMElement {
    @discardableResult
    func title(_ value: String) -> Self
    @discardableResult
    func title<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension TitleAttrable {
    /// Text to be displayed in a tooltip when hovering over the element.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/title)
    @discardableResult
    public func title(_ value: String) -> Self {
        setAttribute("title", value)
        return self
    }
    
    /// Text to be displayed in a tooltip when hovering over the element.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/title)
    @discardableResult
    public func title<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        title(value.stateValue.wrappedValue)
        value.stateValue.listen { self.title($0) }
        return self
    }
}

extension BaseElement: TitleAttrable {}

// MARK: - TranslateAttrable

public protocol TranslateAttrable: DOMElement {
    @discardableResult
    func translate(_ value: Bool) -> Self
    @discardableResult
    func translate<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
}

extension TranslateAttrable {
    /// Specify whether an element’s attribute values and the values
    /// of its Text node children are to be translated when the page is localized, or whether to leave them unchanged.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/translate)
    @discardableResult
    public func translate(_ value: Bool) -> Self {
        setAttribute("translate", value, .modern)
        return self
    }
    
    /// Specify whether an element’s attribute values and the values
    /// of its Text node children are to be translated when the page is localized, or whether to leave them unchanged.
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/translate)
    @discardableResult
    public func translate<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        translate(value.stateValue.wrappedValue)
        value.stateValue.listen { self.translate($0) }
        return self
    }
}

extension BaseElement: TranslateAttrable {}

// MARK: - TypeAttrable

public protocol TypeAttrable: DOMElement {
    @discardableResult
    func type(_ value: String) -> Self
    @discardableResult
    func type<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension TypeAttrable {
    /// Defines the type of the element.
    ///
    /// Applicable to `<button>`, `<input>`, `<embed>`,
    /// `<object>`, `<script>`, `<source>`, `<style>`, `<menu>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_type.asp)
    @discardableResult
    public func type(_ value: String) -> Self {
        setAttribute("type", value)
        return self
    }
    
    /// Defines the type of the element.
    ///
    /// Applicable to `<button>`, `<input>`, `<embed>`,
    /// `<object>`, `<script>`, `<source>`, `<style>`, `<menu>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_type.asp)
    @discardableResult
    public func type<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        type(value.stateValue.wrappedValue)
        value.stateValue.listen { self.type($0) }
        return self
    }
}

extension Button: TypeAttrable {}
extension InputText: TypeAttrable {}
extension Embed: TypeAttrable {}
extension Object: TypeAttrable {}
extension Script: TypeAttrable {}
extension Source: TypeAttrable {}
extension Style: TypeAttrable {}
extension Menu: TypeAttrable {}

// MARK: - UseMapAttrable

public protocol UseMapAttrable: DOMElement {
    @discardableResult
    func useMap(_ value: String) -> Self
    @discardableResult
    func useMap<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension UseMapAttrable {
    /// The usemap attribute specifies an image (or an object) as an image map (an image map is an image with clickable areas).
    ///
    /// The usemap attribute is associated with a `<map>` element's name or id attribute,
    /// and creates a relationship between the `<img>` and the `<map>`.
    ///
    /// Note: The usemap attribute cannot be used if the `<img>` element is a descendant of an `<a>` or `<button>` element.
    ///
    /// Applicable to `<img>`, `<input>`, `<object>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_usemap.asp)
    @discardableResult
    public func useMap(_ value: String) -> Self {
        setAttribute("usemap", value)
        return self
    }
    
    /// The usemap attribute specifies an image (or an object) as an image map (an image map is an image with clickable areas).
    ///
    /// The usemap attribute is associated with a `<map>` element's name or id attribute,
    /// and creates a relationship between the `<img>` and the `<map>`.
    ///
    /// Note: The usemap attribute cannot be used if the `<img>` element is a descendant of an `<a>` or `<button>` element.
    ///
    /// Applicable to `<img>`, `<input>`, `<object>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_usemap.asp)
    @discardableResult
    public func useMap<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        useMap(value.stateValue.wrappedValue)
        value.stateValue.listen { self.useMap($0) }
        return self
    }
}

extension Img: UseMapAttrable {}
extension InputImage: UseMapAttrable {}
extension Object: UseMapAttrable {}

// MARK: - ValueAttrable

public protocol ValueAttrable: DOMElement {
    @discardableResult
    func value(_ value: Bool) -> Self
    @discardableResult
    func value<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
    
    @discardableResult
    func value(_ value: Double) -> Self
    @discardableResult
    func value<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Double
    
    @discardableResult
    func value(_ value: String) -> Self
    @discardableResult
    func value<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

extension ValueAttrable {
    /// Defines a default value which will be displayed in the element on page load.
    ///
    /// Applicable to `<button>`, `<data>`, `<input>`, `<li>`, `<meter>`, `<option>`, `<progress>`, `<param>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_value.asp)
    @discardableResult
    public func value(_ value: Bool) -> Self {
        setAttribute("value", value ? "true" : "false")
        return self
    }
    
    /// Defines a default value which will be displayed in the element on page load.
    ///
    /// Applicable to `<button>`, `<data>`, `<input>`, `<li>`, `<meter>`, `<option>`, `<progress>`, `<param>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_value.asp)
    @discardableResult
    public func value<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        self.value(value.stateValue.wrappedValue)
        value.stateValue.listen { self.value($0) }
        return self
    }
    
    /// Defines a default value which will be displayed in the element on page load.
    ///
    /// Applicable to `<button>`, `<data>`, `<input>`, `<li>`, `<meter>`, `<option>`, `<progress>`, `<param>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_value.asp)
    @discardableResult
    public func value(_ value: Double) -> Self {
        setAttribute("value", value)
        return self
    }
    
    /// Defines a default value which will be displayed in the element on page load.
    ///
    /// Applicable to `<button>`, `<data>`, `<input>`, `<li>`, `<meter>`, `<option>`, `<progress>`, `<param>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_value.asp)
    @discardableResult
    public func value<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Double {
        self.value(value.stateValue.wrappedValue)
        value.stateValue.listen { self.value($0) }
        return self
    }
    
    /// Defines a default value which will be displayed in the element on page load.
    ///
    /// Applicable to `<button>`, `<data>`, `<input>`, `<li>`, `<meter>`, `<option>`, `<progress>`, `<param>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_value.asp)
    @discardableResult
    public func value(_ value: String) -> Self {
        setAttribute("value", value)
        return self
    }
    
    /// Defines a default value which will be displayed in the element on page load.
    ///
    /// Applicable to `<button>`, `<data>`, `<input>`, `<li>`, `<meter>`, `<option>`, `<progress>`, `<param>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_value.asp)
    @discardableResult
    public func value<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        self.value(value.stateValue.wrappedValue)
        value.stateValue.listen { self.value($0) }
        return self
    }
}

extension Button: ValueAttrable {}
extension Data: ValueAttrable {}
extension InputText: ValueAttrable {}
extension InputTel: ValueAttrable {}
extension InputEmail: ValueAttrable {}
extension InputPassword: ValueAttrable {}
extension InputSearch: ValueAttrable {}
extension InputURL: ValueAttrable {}
extension InputNumber: ValueAttrable {}
extension InputRange: ValueAttrable {}
extension InputDateTime: ValueAttrable {}
extension InputDate: ValueAttrable {}
extension InputTime: ValueAttrable {}
extension InputWeek: ValueAttrable {}
extension InputMonth: ValueAttrable {}
extension InputColor: ValueAttrable {}
extension InputList: ValueAttrable {}
extension InputRadio: ValueAttrable {}
extension InputCheckbox: ValueAttrable {}
extension InputHidden: ValueAttrable {}
extension Li: ValueAttrable {}
extension Meter: ValueAttrable {}
extension Option: ValueAttrable {}
extension Progress: ValueAttrable {}
extension Param: ValueAttrable {}

// MARK: - WrapAttrable

public protocol WrapAttrable: DOMElement {
    @discardableResult
    func wrap(_ value: WrapType) -> Self
    @discardableResult
    func wrap<S>(_ value: S) -> Self where S: StateConvertible, S.Value == WrapType
}

extension WrapAttrable {
    /// Indicates how the control wraps text.
    ///
    /// Applicable to `<textarea>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/textarea)
    @discardableResult
    public func wrap(_ value: WrapType) -> Self {
        setAttribute("wrap", value.value)
        return self
    }
    
    /// Indicates how the control wraps text.
    ///
    /// Applicable to `<textarea>`
    ///
    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/textarea)
    @discardableResult
    public func wrap<S>(_ value: S) -> Self where S: StateConvertible, S.Value == WrapType {
        wrap(value.stateValue.wrappedValue)
        value.stateValue.listen { self.wrap($0) }
        return self
    }
}

extension TextArea: WrapAttrable {}

// MARK: - AllowAttrable

//https://developer.mozilla.org/en-US/docs/Web/HTTP/Feature_Policy/Using_Feature_Policy#The_iframe_allow_attribute
//https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/allow
//<iframe>    Specifies a feature-policy for the iframe.

// MARK: - CspAttrable

//https://developer.mozilla.org/docs/Web/API/HTMLiframeElement/csp
//<iframe>    Specifies the Content Security Policy that an embedded document must agree to enforce upon itself.

// MARK: - DataAttrable

//https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/data
//<object>    Specifies the URL of the resource.

//https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/data-*
//data-*    Global attribute    Lets you attach custom attributes to an HTML element.


// MARK: - DirNameAttrable

//https://www.w3schools.com/tags/att_input_dirname.asp
//<input>, <textarea>

// MARK: - ImportanceAttrable

//https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/importance
//<iframe>, <img>, <link>, <script>    Indicates the relative fetch priority for the resource.

// MARK: - ReferrerPolicyAttrable

//<a>, <area>, <iframe>, <img>, <link>, <script>    Specifies which referrer is sent when fetching the resource.

// MARK: - ScopedAttrable

//<style>

// MARK: - StyleAttrable

//https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/style
//Global attribute    Defines CSS styles which will override styles previously set.

// MARK: - MediaAttrable

// TODO: user media ules here from CSS
//https://www.w3schools.com/tags/att_media.asp
//<a>, <area>, <link>, <source>, <style>    Specifies a hint of the media for which the linked resource was designed.
