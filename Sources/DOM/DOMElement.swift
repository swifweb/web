//
//  DOMElement.swift
//  DOM
//
//  Created by Mihael Isaev on 24.02.2021.
//

import WebFoundation

public protocol DOMElementable: Storageable {
    #if arch(wasm32)
    var domElement: JSValue { get set }
    #endif
}

public protocol DOMElement: DOMElementable, AnyElement {
    static var name: String { get }
    
    var properties: DOMElementProperties { get }
    
    func didAddToDOM()
    func didRemoveFromDOM()
    func appendChild(_ element: DOMElement)
    func shutdown()
}

extension DOMElement {
    var name: String { Self.name }
}

// TODO: https://developer.mozilla.org/en-US/docs/Web/API/Node
// TODO: https://developer.mozilla.org/en-US/docs/Web/API/Element
// TODO: https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement
extension DOMElement {
    // MARK: Instance methods
    
    /// Removes keyboard focus from the current element.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/blur)
    public func blur() {
        #if arch(wasm32)
        domElement.blur.function?.callAsFunction(optionalThis: domElement.object)
        #endif
    }
    
    /// Simulates a mouse click on an element
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/click)
    public func click() {
        #if arch(wasm32)
        domElement.click.function?.callAsFunction(optionalThis: domElement.object)
        #endif
    }
    
    /// Sets focus on the specified element, if it can be focused.
    /// The focused element is the element that will receive keyboard and similar events by default.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/focus)
    public func focus(preventScroll: Bool? = nil, focusVisible: Bool? = nil) {
        var options: [String: JSValue] = [:]
        if let preventScroll = preventScroll {
            options["preventScroll"] = preventScroll.jsValue
        }
        if let focusVisible = focusVisible {
            options["focusVisible"] = focusVisible.jsValue
        }
        #if arch(wasm32)
        domElement.focus.function?.callAsFunction(optionalThis: domElement.object, options.jsValue)
        #endif
    }
    
    /// Hides a popover element (i.e. one that has a valid popover attribute)
    /// by removing it from the top layer and styling it with display: none.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/hidePopover)
    public func hidePopover() {
        #if arch(wasm32)
        domElement.hidePopover.function?.callAsFunction(optionalThis: domElement.object)
        #endif
    }
    
    /// Shows a popover element (i.e. one that has a valid popover attribute) by adding it to the top layer.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/showPopover)
    public func showPopover() {
        #if arch(wasm32)
        domElement.showPopover.function?.callAsFunction(optionalThis: domElement.object)
        #endif
    }
    
    // MARK: - Core Methods
    
    /// Adds the specified childNode argument as the last child to the current node.
    /// If the argument referenced an existing node on the DOM tree,
    /// the node will be detached from its current position and attached at the new position.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/Node/appendChild)
    public func appendChild(_ element: DOMElement) {
        #if arch(wasm32)
        domElement.appendChild.function?.callAsFunction(optionalThis: domElement.object, element.domElement)
        properties.subElements.append(element)
        element.properties.parent = self
        Dispatch.async(element.didAddToDOM)
        #else
        properties.subElements.append(element)
        #endif
    }
    
    /// Inserts a node before a reference node as a child of a specified parent node.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/Node/insertBefore)
    public func insertChild(_ element: DOMElement, before: DOMElement) {
        #if arch(wasm32)
        domElement.insertBefore.function?.callAsFunction(optionalThis: domElement.object, element.domElement, before.domElement)
        if let index = properties.subElements.firstIndex(where: { $0.properties._id == before.properties._id }) {
            properties.subElements.insert(element, at: index > 0 ? index - 1 : 0)
        } else {
            properties.subElements.append(element)
        }
        element.properties.parent = self
        Dispatch.async(element.didAddToDOM)
        #else
        if let index = properties.subElements.firstIndex(where: { $0.properties._id == before.properties._id }) {
            properties.subElements.insert(element, at: index > 0 ? index - 1 : 0)
        } else {
            properties.subElements.append(element)
        }
        #endif
    }
    
    /// Inserts a node before a reference node as a child of a specified parent node.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/Node/insertBefore)
    public func insertChild(_ element: DOMElement, at: Int) {
        if at < properties.subElements.count {
            insertChild(element, before: properties.subElements[at])
        } else {
            appendChild(element)
        }
    }
    
    /// Inserts a node after a reference node as a child of a specified parent node.
    ///
    /// [Learn more](https://stackoverflow.com/a/4793630/1001057)
    public func insertChild(_ element: DOMElement, after: DOMElement) {
        #if arch(wasm32)
        domElement.insertBefore.function?.callAsFunction(optionalThis: domElement.object, element.domElement, after.domElement.nextSibling)
        if let index = properties.subElements.firstIndex(where: { $0.properties._id == after.properties._id }) {
            properties.subElements.insert(element, at: index)
        } else {
            properties.subElements.append(element)
        }
        element.properties.parent = self
        Dispatch.async(element.didAddToDOM)
        #else
        if let index = properties.subElements.firstIndex(where: { $0.properties._id == after.properties._id }) {
            properties.subElements.insert(element, at: index)
        } else {
            properties.subElements.append(element)
        }
        #endif
    }
    
    /// Removes the element from the children list of its parent.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/Element/remove)
    @discardableResult
    public func remove() -> Self {
        #if arch(wasm32)
        domElement.remove.function?.callAsFunction(optionalThis: domElement.object)
        self.properties.removeSubelementsRecursively()
        self.properties.parent?.properties.subElements.removeAll(where: { subElement in
            return subElement.properties._id == self.properties._id
        })
        self.properties.parent = nil
        self.didRemoveFromDOM()
        #endif
        return self
    }
    
    // MARK: - Set Attribute

    #if arch(wasm32)
    private func _setAttribute(_ key: String, _ value: JSValue) {
        domElement[dynamicMember: "setAttribute"].function?.callAsFunction(optionalThis: domElement.object, key, value.jsValue)
    }
    #endif
    
    @discardableResult
    public func attribute(_ key: String, _ value: Bool, _ mode: AttributeBoolMode = .keyWithoutValue) -> Self {
        #if arch(wasm32)
        switch mode {
        case .trueFalse:
            domElement[dynamicMember: "setAttribute"].function?.callAsFunction(optionalThis: domElement.object, key, value.jsValue)
        case .keyAsValue:
            if value {
                domElement[dynamicMember: "setAttribute"].function?.callAsFunction(optionalThis: domElement.object, key, key.jsValue)
            } else {
                domElement[dynamicMember: "removeAttribute"].function?.callAsFunction(optionalThis: domElement.object, key)
            }
        case .yesNo:
            domElement[dynamicMember: "setAttribute"].function?.callAsFunction(optionalThis: domElement.object, key, (value ? "yes" : "no").jsValue)
        case .keyWithoutValue:
            domElement[dynamicMember: key] = value.jsValue()
        }
        #else
        let stringValue: String?
        switch mode {
        case .trueFalse: stringValue = value ? "true" : "false"
        case .keyAsValue: stringValue = value ? key : nil
        case .yesNo: stringValue = value ? "yes" : "no"
        case .keyWithoutValue: stringValue = value ? "" : nil
        }
        if let value = stringValue {
            properties.attributes[key] = value
        } else {
            properties.attributes.removeValue(forKey: key)
        }
        #endif
        return self
    }
    
    @discardableResult
    public func attribute(_ key: String, _ value: Double) -> Self {
        #if arch(wasm32)
        _setAttribute(key, value.jsValue)
        #else
        attribute(key, "\(value)")
        #endif
        return self
    }
    
    @discardableResult
    public func attribute(_ key: String, _ value: Int) -> Self {
        #if arch(wasm32)
        _setAttribute(key, value.jsValue)
        #else
        attribute(key, "\(value)")
        #endif
        return self
    }
    
    @discardableResult
    public func attribute(_ key: String, _ value: UInt) -> Self {
        attribute(key, Int(value))
    }
    
    @discardableResult
    public func attribute(_ key: String, _ value: String) -> Self {
        #if arch(wasm32)
        _setAttribute(key, value.jsValue)
        #else
        properties.attributes[key] = value
        #endif
        return self
    }
    
    func callFunction(_ name: String, this: Bool = true, args: WebJSValue...) {
        #if arch(wasm32)
        if this {
            domElement[dynamicMember: name].function?.callAsFunction(optionalThis: domElement.object, arguments: args.map { $0.webValue })
        } else {
            // TODO: implement global function calling?
//            domElement[dynamicMember: name].function?.callAsFunction(arguments: args.map { $0.webValue })
        }
        #endif
    }
}

extension DOMElement {
    public func shutdown() {
        storage.shutdown()
    }
}

public final class DOMElementProperties {
    let uid: String = .shuffledAlphabet(8, letters: "AaBbCcDdEeFfGgJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz")
    
    public lazy var _id = uid
    public lazy var _classes: Set<String> = []

    public internal(set) var parent: DOMElement? = nil
    public internal(set) var subElements: [DOMElement] = []
    public var positionChangeListeners: [() -> Void] = []
    #if !arch(wasm32)
    public var styles: [String: String] = [:]
    #endif
    public var attributes: [String: String] = [:]
    
    init () {}
    
    func removeSubelementsRecursively() {
        func removeSubElements(_ subElements: inout [DOMElement]) {
            while let subElement = subElements.popLast() {
                removeSubElements(&subElement.properties.subElements)
                subElement.properties.parent = nil
                subElement.didRemoveFromDOM()
            }
        }
        removeSubElements(&subElements)
    }
}

public enum AttributeBoolMode {
    /// like `<audio muted>`
    /// ```html
    /// <audio muted>
    /// ```
    case keyWithoutValue
    
    /// like **true/false**
    /// ```html
    /// <p spellcheck="true">Text</p>
    /// ```
    case trueFalse
    
    /// like **yes/no**
    /// ```html
    /// <span translate="no">BrandName</span>
    /// ```
    case yesNo
    
    /// like **checked="checked"**
    /// ```html
    /// <input checked="checked">
    /// ```
    case keyAsValue
}
