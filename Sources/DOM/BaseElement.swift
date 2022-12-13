//
//  BaseElement.swift
//  DOM
//
//  Created by Mihael Isaev on 29.11.2020.
//

import WebFoundation
import Events

open class BaseElement: DOMElement, DOMContent, DOMEventsBaseScope, EventTarget {
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
    
    open func didAddToDOM() {}
    open func didRemoveFromDOM() {}
    
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
}
