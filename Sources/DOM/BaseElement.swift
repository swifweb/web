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
}
