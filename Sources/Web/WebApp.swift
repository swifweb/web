//
//  WebApp.swift
//
//
//  Created by Mihael Isaev on 15.11.2020.
//

import Foundation
import JavaScriptKit

private var webapp: WebApp!

open class WebApp: _PreviewableApp {
    public static func main() {
        Self.start()
    }
    
    private var isStarted = false
    
    public static var shared: WebApp {
        #if !arch(wasm32)
        guard webapp == nil else {
            return webapp
        }
        webapp = WebApp.start()
        return webapp
        #else
        return webapp
        #endif
    }
    public class var current: Self { shared as! Self }
    
    public private(set) lazy var window = Window()
    public var document: Document { window.document }
    lazy var defaultResponder = DefaultResponder(routes: routes)
    public internal(set) lazy var routes: RoutesStorage = .init()
    
    required public init () {}
    
    deinit {}
    
    @discardableResult
    public static func start() -> WebApp {
        guard webapp == nil else { return webapp }
        webapp = Self()
        guard !webapp.isStarted else { return webapp }
        webapp.isStarted = true
        #if arch(wasm32)
        webapp.start()
        #endif
        return webapp
    }
    
    private func start() {
        parseAppBuilderItem(body.appBuilderContent)
        stylesheets.forEach {
            document.head.appendChild($0)
            $0.processRules()
        }
        window.appDidStarted()
        handleRoute(.init(
            application: self,
            path: window.location.pathname,
            search: window.location.search,
            hash: window.location.hash
        ))
        window.$location.listenOnlyIfChanged { location in
            self.handleRoute(.init(
                application: self,
                path: location.pathname,
                search: location.search,
                hash: location.hash
            ))
        }
    }
    
    private var _previewStarted = false
    
    func _previewStart() {
        guard !_previewStarted else { return }
        _previewStarted = true
        parseAppBuilderItem(body.appBuilderContent)
    }
    
    var lastResponse: Response?
    
    func handleRoute(_ req: Request) {
        do {
            let response = try defaultResponder.respond(to: req)
            if let lastResponse = lastResponse {
                #if arch(wasm32)
                _ = document.domElement.body.removeChild(lastResponse.controller.view)
                #endif
            }
            #if arch(wasm32)
            let _ = document.domElement.body.appendChild(response.controller.view)
            #endif
            lastResponse = response
        } catch {
            // TODO: use predefined beautiful error handler which should be customizable
            #if arch(wasm32)
            document.domElement.body.object?.innerHTML = "\(error)".jsValue()
            #endif
        }
    }
    
    @AppBuilder open var body: AppBuilder.Content { _AppContent(appBuilderContent: .none) }
    
    var stylesheets: [Stylesheet] = []
    
    private func parseAppBuilderItem(_ item: AppBuilder.Item) {
        switch item {
        case .items(let v): v.forEach { parseAppBuilderItem($0) }
        case .lifecycle(let v): window.addLifecycleListener(v)
        case .routes(let v): v.addRoutes(into: routes)
        case .stylesheet(let v): stylesheets.append(v)
        case .none: break
        }
    }
}
