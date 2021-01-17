//
//  AnyElement.swift
//  WasmApp
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol AnyElement: class {
    static var name: String { get }
}

protocol _AnyElement: AnyElement {
    var domElement: JSValue { get set }
    var subElements: [_AnyElement] { get set }
}

extension _AnyElement {
    func appendChild(_ element: _AnyElement) {
        _ = domElement.appendChild(element.domElement)
    }
}

public protocol BaseContentElementable: class {
    init ()
//    init(@BodyBuilder content: @escaping BodyBuilder.Block)
    func buildUI()
    
    @BodyBuilder var body: BodyBuilder.Content { get }
    
    func body(@BodyBuilder content: @escaping BodyBuilder.Block) -> Self
    
    var innerText: String { get set }
    var innerHTML: String { get set }
}

protocol _BaseContentElementable: _AnyElement, BaseContentElementable {
    func postBuildUI()
    func parseBodyBuilderItem(_ item: BodyBuilderItem)
}

extension BaseContentElementable {
    private var s: _BaseContentElementable? { self as? _BaseContentElementable }
    
    public init(@BodyBuilder content: @escaping BodyBuilder.Block) {
        self.init()
        s?.parseBodyBuilderItem(content().bodyBuilderContent)
    }
    
    @discardableResult
    public func body(@BodyBuilder content: @escaping BodyBuilder.Block) -> Self {
        s?.parseBodyBuilderItem(content().bodyBuilderContent)
        return self
    }
    
    public var innerText: String {
        get { s?.domElement.innerText.string ?? "" }
        set { s?.domElement.innerText = newValue.jsValue() }
    }
    
    public var innerHTML: String {
        get { s?.domElement.innerHTML.string ?? "" }
        set { s?.domElement.innerHTML = newValue.jsValue() }
    }
}

extension _BaseContentElementable {
    func postBuildUI() {
        parseBodyBuilderItem(body.bodyBuilderContent)
    }
    
    func parseBodyBuilderItem(_ item: BodyBuilderItem) {
        switch item {
        case .elements(let elements):
            elements.forEach {
                guard let element = $0 as? _AnyElement else { return }
                subElements.append(element)
                appendChild(element)
            }
        case .items(let items): items.forEach { parseBodyBuilderItem($0) }
        case .none: break
        }
    }
}
