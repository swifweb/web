//
//  ViewController.swift
//  
//
//  Created by Mihael Isaev on 20.11.2020.
//

import Foundation
import JavaScriptKit

open class ViewController: Response {
    public var controller: ViewController { self }
    
    public let view: JSValue
    
    @State public var title = ""
    
    public init () {
        view = WasmApp.shared.document.domElement.createElement("div")
        title = WasmApp.shared.window.document.title
        $title.listenOnlyIfChanged { WasmApp.shared.window.document.title = $0 }
    }
    
    
    
    var css: String = ""
    var html: String = ""
}
