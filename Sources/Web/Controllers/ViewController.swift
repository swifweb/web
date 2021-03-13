//
//  ViewController.swift
//  Web
//
//  Created by Mihael Isaev on 20.11.2020.
//

import Foundation
import JavaScriptKit

open class ViewController: BaseContentElement, Response {
    open override class var name: String { "div" }
    
    public var controller: ViewController { self }
    
    public var view: JSValue { domElement }
    
    @State public var title = ""
    @State public var metaDescription = ""
    
    open override func buildUI() {
        super.buildUI()
        title = WebApp.shared.window.document.title
        $title.listen {
            WebApp.shared.window.document.title = $0
        }
        metaDescription = WebApp.shared.window.document.metaDescription
        $metaDescription.listen {
            WebApp.shared.window.document.metaDescription = $0
        }
    }
}
