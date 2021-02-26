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
    #if !arch(wasm32)
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
        set { s?.domElement.innerText = newValue.jsValue() }
    }
    
    public var innerHTML: String {
        get { s?.domElement.innerHTML.string ?? "" }
        set { s?.domElement.innerHTML = newValue.jsValue() }
    }
    #else
    public var innerText: String {
        get {
            guard let s = s else { return "" }
            switch GlobalContext[PreviewMode.self] {
            case .dynamic: return ""
            case .static: return s.__innerText
            case .none: return ""
            }
        }
        set {
            guard let s = s else { return }
            switch GlobalContext[PreviewMode.self] {
            case .dynamic:
                GlobalContext[PreviewLiveViewKey.self]?.executeJS("""
                document.getElementById('\(s.properties._id)').innerText = '\(newValue)';
                """)
            case .static:
                s.__innerText = newValue
            case .none: break
            }
        }
    }
    public var innerHTML: String {
        get { "" }
        set {
            guard let s = s else { return }
            GlobalContext[PreviewLiveViewKey.self]?.executeJS("""
            document.getElementById('\(s.properties._id)').innerHTML = '\(newValue)';
            """)
        }
    }
    #endif
    
    public func innerText(_ value: String) -> Self {
        self.innerText = value
        return self
    }
    
    public func innerText(_ value: UState<String>) -> Self {
        self.innerText = value.wrappedValue
        value.listen {
            self.innerText = $0
        }
        return self
    }
    
    public func innerText <V>(_ value: ExpressableState<V, String>) -> Self {
        innerText (value.unwrap())
    }
    
    public func innerHTML(_ value: String) -> Self {
        self.innerHTML = value
        return self
    }
    
    public func innerHTML(_ value: UState<String>) -> Self {
        self.innerHTML = value.wrappedValue
        value.listen {
            self.innerHTML = $0
        }
        return self
    }
    
    public func innerHTML<V>(_ value: ExpressableState<V, String>) -> Self {
        innerHTML(value.unwrap())
    }
}

extension _BaseContentElementable {
    func postBuildUI() {
        parseDOMItem(body.domContentItem)
    }
    
    func parseDOMItem(_ item: DOMItem) {
        switch item {
        case .elements(let elements):
            elements.forEach {
//                guard let element = $0 as? _AnyElement else { return }
                appendChild($0)
                #if arch(wasm32)
                appendChild($0)
//                #else
//                if previewMode == .dynamic {
//                    appendChild(element)
//                }
                #endif
            }
        case .items(let items): items.forEach { parseDOMItem($0) }
        case .none: break
        }
    }
}
