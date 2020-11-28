//
//  BaseElement.swift
//  WasmApp
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

open class BaseElement: AnyElement {
    class var name: String { "\(Self.self)".lowercased() }
    
    private(set) var domElement: JSValue
    
    init () {
        domElement = WasmApp.shared.document.createElement(Self.name)
    }
    
    init (domElement: JSValue) {
        self.domElement = domElement
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
