//
//  PageController.swift
//  Web
//
//  Created by Mihael Isaev on 20.11.2020.
//

import Foundation
import JavaScriptKit
import DOM

@available(*, unavailable, renamed: "PageController")
public typealias ViewController = PageController

open class PageController: BaseContentElement {
    open override class var name: String { "div" }
    
    public var controller: PageController { return self }
    public internal(set) var req: Request?
    
    public var view: JSValue { domElement }
    
    @State public var title = ""
    @State public var metaDescription = ""
    
    public init (@DOM closure: @escaping (PageController) -> DOM.Content) {
        super.init()
        self.parseDOMItem(closure(self).domContentItem)
    }
    
    required public init() {
        super.init()
    }
    
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
    
    // MARK: - Fragment Router
    
    var fragments: [FragmentRouter] = []
    
    @discardableResult
    func canRespond(_ req: Request, _ rootPath: String) throws -> Bool {
        var canRespond = false
        for fragment in fragments {
            if try fragment.canRespond(req, rootPath) {
                canRespond = true
            }
        }
        return canRespond
    }
}

extension String {
    func deletingPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        return String(self.dropFirst(prefix.count))
    }
}
