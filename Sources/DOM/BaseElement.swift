//
//  BaseElement.swift
//  DOM
//
//  Created by Mihael Isaev on 29.11.2020.
//

import WebFoundation
import Events

open class BaseElement: DOMElement, DOMContent, DOMEventsBaseScope, EventTarget, Equatable, Hashable {
    // MARK: Storageable
    
    public lazy var storage: Storage = .init()
    public var jsValue: JSValue { domElement }
    
    public private(set) lazy var properties: DOMElementProperties = .init()
    
    deinit {
        storage.shutdown()
    }
    
    // MARK: DOMContent
    
    public var domContentItem: DOMItem { .elements([self]) }
    
    // MARK: DOMElement
    
    open class var name: String { "\(Self.self)".lowercased() }
    
    public var domElement: JSValue
    
    var addToDOMHandlers: [() -> Void] = []
    var removeFromDOMHandlers: [() -> Void] = []
    
    public private(set) var isInDOM = false
    
    open func didAddToDOM() {
        isInDOM = true
        addToDOMHandlers.forEach { $0() }
    }
    
    open func didRemoveFromDOM() {
        isInDOM = false
        removeFromDOMHandlers.forEach { $0() }
    }
    
    @discardableResult
    public func onDidAddToDOM(_ handler: @escaping () -> Void) -> Self {
        addToDOMHandlers.append(handler)
        return self
    }
    
    @discardableResult
    public func onDidRemoveFromDOM(_ handler: @escaping () -> Void) -> Self {
        removeFromDOMHandlers.append(handler)
        return self
    }
    
    public var superview: BaseElement? { properties.parent as? BaseElement }
    
    public init (_ domElement: JSValue?) {
        self.domElement = domElement ?? JSValue.boolean(false)
        postInit()
    }
    
    required public init () {
        self.domElement = Window.shared.document.createElement(Self.name)
        postInit()
    }
    
    public convenience init (in document: Document) {
        self.init(document.createElement(Self.name))
    }
    
    open func postInit() {
        #if arch(wasm32)
        domElement.id = properties._id.jsValue
        #endif
    }
    
//    var rootElement: JSValue?
//
//    func removeFromSuperview() {
//        #if arch(wasm32)
//        guard let rootElement = rootElement else { return }
//        rootElement.removeChild.function?.callAsFunction(optionalThis: rootElement.object, domElement)
//        self.rootElement = nil
//        #else
//
//        #endif
//    }
    
    // MARK: Equatable
    
    public static func == (lhs: BaseElement, rhs: BaseElement) -> Bool {
        lhs.properties.uid == rhs.properties.uid
    }
    
    // MARK: Hashable
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(properties.uid)
    }
    
    // MARK: Sizes
    
    public var boundingClientRect: Rect {
        guard let jsValue = domElement.object?["getBoundingClientRect"].function?.callAsFunction(optionalThis: domElement.object, arguments: []) else {
            return .zero
        }
        return Rect(jsValue)
    }
    
    // MARK: - left
    
    /// Returns absolute left
    public var absoluteLeft: Double {
        Double(boundingClientRect.left)
    }
    
    /// Returns left till border
    public var clientLeft: Double {
        domElement.object?["clientLeft"].number ?? 0
    }
    
    /// Returns left till first positioned parent
    public var offsetLeft: Double {
        domElement.object?["offsetLeft"].number ?? 0
    }
    
    // MARK: - right
    
    /// Returns absolute right
    public var absoluteRight: Double {
        Double(boundingClientRect.right)
    }
    
    /// Returns right till border
    public var clientRight: Double {
        domElement.object?["clientRight"].number ?? 0
    }
    
    /// Returns right till first positioned parent
    public var offsetRight: Double {
        domElement.object?["offsetRight"].number ?? 0
    }
    
    // MARK: - top
    
    /// Returns absolute top
    public var absoluteTop: Double {
        Double(boundingClientRect.top)
    }
    
    /// Returns top till border
    public var clientTop: Double {
        domElement.object?["clientTop"].number ?? 0
    }
    
    /// Returns top till first positioned parent
    public var offsetTop: Double {
        domElement.object?["offsetTop"].number ?? 0
    }
    
    // MARK: - bottom
    
    /// Returns absolute bottom
    public var absoluteBottom: Double {
        Double(boundingClientRect.bottom)
    }
    
    /// Returns bottom till border
    public var clientBottom: Double {
        domElement.object?["clientBottom"].number ?? 0
    }
    
    /// Returns bottom till first positioned parent
    public var offsetBottom: Double {
        domElement.object?["offsetBottom"].number ?? 0
    }
    
    // MARK: - width
    
    /// Returns width including border
    public var offsetWidth: Double {
        domElement.object?["offsetWidth"].number ?? 0
    }
    
    /// Returns width excluding border
    public var clientWidth: Double {
        domElement.object?["clientWidth"].number ?? 0
    }
    
    // MARK: - height
    
    /// Returns height including border
    public var offsetHeight: Double {
        domElement.object?["offsetHeight"].number ?? 0
    }
    
    /// Returns height excluding border
    public var clientHeight: Double {
        domElement.object?["clientHeight"].number ?? 0
    }
}
