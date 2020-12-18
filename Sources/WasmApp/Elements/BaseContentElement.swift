//
//  BaseContentElement.swift
//  WasmApp
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

open class BaseContentElement: BaseElement {
    public convenience init(@BodyBuilder content: @escaping BodyBuilder.Block) {
        self.init()
        parseBodyBuilderItem(content().bodyBuilderContent)
    }
    
    override func postInit() {
        super.postInit()
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
    
    var innerText: String {
        get { domElement.innerText.string ?? "" }
        set { domElement.innerText = newValue.jsValue() }
    }
    
    var innerHTML: String {
        get { domElement.innerHTML.string ?? "" }
        set { domElement.innerHTML = newValue.jsValue() }
    }
}
