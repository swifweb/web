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
    
    @State public var title = ""
    
    public required init () {
        super.init()
        title = WebApp.shared.window.document.title
        $title.listenOnlyIfChanged { WebApp.shared.window.document.title = $0 }
    }
}