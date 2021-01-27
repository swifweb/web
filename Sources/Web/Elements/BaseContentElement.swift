//
//  BaseContentElement.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

open class BaseContentElement: BaseElement, _BaseContentElementable {
    required public init() {
        super.init()
        #if !arch(wasm32)
        appendChild(self)
        #endif
    }
    
    public override init(in document: Document) {
        super.init(in: document)
    }
    
    public override init(domElement: JSValue) {
        super.init(domElement: domElement)
    }
    
    override func postInit() {
        super.postInit()
        buildUI()
        postBuildUI()
    }
    
    @BodyBuilder open var body: BodyBuilder.Content { EBContent(bodyBuilderContent: .none) }
    
    open func buildUI() {}
    
    var __innerText: String = ""
}
