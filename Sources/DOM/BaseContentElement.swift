//
//  BaseContentElement.swift
//  DOM
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

open class BaseContentElement: BaseElement, _BaseContentElementable {
    required public init() {
        super.init()
//        #if !arch(wasm32)
//        appendChild(self) // TODO: forgot what this line means.. it's a bad sign :D
//        #endif
    }
    
    public convenience init (in document: Document) {
        self.init(document.createElement(Self.name))
    }
    
    public override init(_ domElement: JSValue?) {
        super.init(domElement)
    }
    
    public override func postInit() {
        super.postInit()
        buildUI()
        postBuildUI()
    }
    
    @DOM open var body: DOM.Content { DOM.none }
    
    open func buildUI() {}
    
    var __innerText: String = ""
}
