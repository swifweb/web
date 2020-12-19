//
//  ViewController.swift
//  
//
//  Created by Mihael Isaev on 20.11.2020.
//

import Foundation
import JavaScriptKit

open class ViewController: BaseContentElement, Response {
    public override class var name: String { "div" }
    
    public var controller: ViewController { self }
    
    public var view: JSValue { domElement }
    
    lazy var styleElement = Stylesheet()
    
    @State public var title = ""
    
    public override init () {
        super.init()
        title = WasmApp.shared.window.document.title
        $title.listenOnlyIfChanged { WasmApp.shared.window.document.title = $0 }
        appendChild(styleElement) // TODO: parse styles
    }
}
