//
//  BaseElement.swift
//  WasmApp
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit
import CSS

open class BaseElement: _AnyElement, BodyBuilderContent {
    public class var name: String { "\(Self.self)".lowercased() }
    
    public var bodyBuilderContent: BodyBuilderItem { .elements([self]) }
    
    let uid = UUID.new()?.uuidString ?? "id\(Date().timeIntervalSince1970)"
    var cssProperties: [AnyProperty] = []
    var subElements: [_AnyElement] = []
    
    var rootElement: JSValue?
    var domElement: JSValue
    
    init () {
        domElement = WasmApp.shared.document.createElement(Self.name)
        postInit()
    }
    
    init (in document: Document) {
        domElement = document.createElement(Self.name)
        postInit()
    }
    
    init (domElement: JSValue) {
        self.domElement = domElement
        postInit()
    }
    
    public convenience init(@BodyBuilder content: @escaping BodyBuilder.Block) {
        self.init()
        parseBodyBuilderItem(content().bodyBuilderContent)
    }
    
    func postInit() {
        domElement.id = uid.jsValue()
        buildUI()
        postBuildUI()
    }
    
    @BodyBuilder open var body: BodyBuilder.Content { EBContent(bodyBuilderContent: .none) }
    
    open func buildUI() {}
    
    @discardableResult
    public func body(@BodyBuilder content: @escaping BodyBuilder.Block) -> Self {
        parseBodyBuilderItem(content().bodyBuilderContent)
        return self
    }
    
    private func postBuildUI() {
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
    
    var innerText: String {
        get { domElement.innerText.string ?? "" }
        set { domElement.innerText = newValue.jsValue() }
    }
    
    var innerHTML: String {
        get { domElement.innerHTML.string ?? "" }
        set { domElement.innerHTML = newValue.jsValue() }
    }
    
    func removeFromSuperview() {
        guard let rootElement = rootElement else { return }
        rootElement.removeChild.function?.callAsFunction(this: rootElement.object, domElement)
        self.rootElement = nil
    }
}
