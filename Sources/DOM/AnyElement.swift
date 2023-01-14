//
//  AnyElement.swift
//  DOM
//
//  Created by Mihael Isaev on 29.11.2020.
//

import WebFoundation

public protocol BaseContentElementable: DOMElement {
    init ()
    init(@DOM content: @escaping DOM.Block)
    
    func buildUI()
    
    @DOM var body: DOM.Content { get }
    
    func body(@DOM content: @escaping DOM.Block) -> Self
    
    var innerText: String { get set }
    var innerHTML: String { get set }
}

protocol _BaseContentElementable: BaseContentElementable {
    func postBuildUI()
    func parseDOMItem(_ item: DOMItem)
    #if WEBPREVIEW
    var __innerText: String { get set }
    #endif
}

extension BaseContentElementable {
    private var s: _BaseContentElementable? { self as? _BaseContentElementable }
    
    public init(@DOM content: @escaping DOM.Block) {
        self.init()
        s?.parseDOMItem(content().domContentItem)
    }
    
    @discardableResult
    public func body(@DOM content: @escaping DOM.Block) -> Self {
        s?.parseDOMItem(content().domContentItem)
        return self
    }
    
    #if arch(wasm32)
    public var innerText: String {
        get { s?.domElement.innerText.string ?? "" }
        set {
            s?.properties.removeSubelementsRecursively()
            s?.domElement.innerText = newValue.jsValue
        }
    }
    
    public var innerHTML: String {
        get { s?.domElement.innerHTML.string ?? "" }
        set {
            s?.properties.removeSubelementsRecursively()
            s?.domElement.innerHTML = newValue.jsValue
        }
    }
    #else
    public var innerText: String {
        get {
            #if WEBPREVIEW
            return s?.__innerText ?? ""
            #else
            return ""
            #endif
        }
        set {
            #if WEBPREVIEW
            s?.__innerText = newValue
            #endif
        }
    }
    public var innerHTML: String {
        get { "" }
        set {}
    }
    #endif
    
    /// Inner text setter
    /// - Parameter value: Pass `String` or `State<String>`
    public func innerText<U>(_ value: U) -> Self where U: UniValue, U.UniValue == String {
        self.innerText = value.uniValue
        value.uniStateValue?.listen {
            self.innerText = $0
        }
        return self
    }
    
    /// Inner HTML setter
    /// - Parameter value: Pass `String` or `State<String>`
    public func innerHTML<U>(_ value: U) -> Self where U: UniValue, U.UniValue == String {
        self.innerHTML = value.uniValue
        value.uniStateValue?.listen {
            self.innerHTML = $0
        }
        return self
    }
}

extension _BaseContentElementable {
    func postBuildUI() {
        parseDOMItem(body.domContentItem)
    }
    
    func parseDOMItem(_ item: DOMItem) {
        switch item {
        case .elements(let elements): elements.forEach { appendChild($0) }
        case .items(let items): items.forEach { parseDOMItem($0) }
        case .forEach(let fr): fr.allItems().forEach { parseDOMItem($0.domContentItem) }
        case .none: break
        }
    }
}
