//
//  BaseElement.swift
//  WasmApp
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit
import CSS

open class BaseElement: _AnyElement, ElementsBuilderContent {
    public class var name: String { "\(Self.self)".lowercased() }
    
    public var elementsBuilderContent: ElementsBuilderItem { .elements([self]) }
    
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
    
    public convenience init(@ElementsBuilder content: @escaping ElementsBuilder.Block) {
        self.init()
        parseElementsBuilderItem(content().elementsBuilderContent)
    }
    
    func postInit() {
        domElement.id = uid.jsValue()
        buildUI()
        postBuildUI()
    }
    
    @ElementsBuilder open var body: ElementsBuilder.Result { EBContent(elementsBuilderContent: .none) }
    
    open func buildUI() {}
    
    @discardableResult
    public func body(@ElementsBuilder content: @escaping ElementsBuilder.Block) -> Self {
        parseElementsBuilderItem(content().elementsBuilderContent)
        return self
    }
    
    private func postBuildUI() {
        parseElementsBuilderItem(body.elementsBuilderContent)
    }
    
    func parseElementsBuilderItem(_ item: ElementsBuilderItem) {
        switch item {
        case .elements(let elements):
            elements.forEach {
                guard let element = $0 as? _AnyElement else { return }
                subElements.append(element)
                appendChild(element)
            }
        case .items(let items): items.forEach { parseElementsBuilderItem($0) }
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
