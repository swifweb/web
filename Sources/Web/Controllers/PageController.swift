//
//  PageController.swift
//  Web
//
//  Created by Mihael Isaev on 20.11.2020.
//

import Foundation
import JavaScriptKit

@available(*, unavailable, renamed: "PageController")
public typealias ViewController = PageController

open class PageController: BaseContentElement, Response {
    open override class var name: String { "div" }
    
    public var controller: PageController { return self }
    public internal(set) var req: Request?
    
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
    
    open func willLoad(with req: PageRequest) {}
    open func didLoad(with req: PageRequest) {}
    
    open func willUnload() {}
    open func didUnload() {}
}
