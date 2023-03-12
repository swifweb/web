//
//  WebApp.swift
//  Web
//
//  Created by Mihael Isaev on 15.11.2020.
//

import Foundation
import CSS

private var webapp: WebApp!

open class WebApp: _PreviewableApp {
    public typealias Configuration = AppBuilder.Content
    
    public static func main() {
        Self.start()
    }
    
    private var isStarted = false
    
    public static var shared: WebApp {
        #if WEBPREVIEW
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
    
    public private(set) lazy var window = Window.shared
    public var document: Document { window.document }
    lazy var defaultResponder = DefaultResponder(routes: routes, notFoundResponder: DefaultResponder.notFoundResponder)
    public internal(set) lazy var routes: RoutesStorage = .init()
    
    required public init () {}
    
    deinit {}
    
    @discardableResult
    public static func start() -> WebApp {
        guard webapp == nil else { return webapp }
        webapp = Self()
        guard !webapp.isStarted else { return webapp }
        webapp.isStarted = true
        #if WEBPREVIEW
        webapp.previewStart()
        #else
        webapp.start()
        #endif
        return webapp
    }
    
    #if !arch(wasm32)
    private func previewStart() {
        var args = CommandLine.arguments
        guard args.contains("--previews") else {
            fatalError("Missing --previews argument")
        }
        struct PassedPreview {
            let module, `class`: String
        }
        var passedPreviews: [PassedPreview] = []
        while args.count > 0 {
            guard args.removeFirst() == "--previews", args.count > 0 else { continue }
            let rawValue = args.removeFirst()
            for p in rawValue.components(separatedBy: ",") {
                let values = p.components(separatedBy: "/")
                guard values.count == 2 else {
                    fatalError("Wrong --previews value: \(rawValue)")
                }
                passedPreviews.append(.init(module: values[0], class: values[1]))
            }
            break
        }
        class Result: Encodable {
            struct Preview: Encodable {
                let width, height: UInt
                let title, module, `class`, html: String
            }
            var previews: [Preview] = []
            init () {}
        }
        let result = Result()
        for passedPreview in passedPreviews {
            let className = [passedPreview.module, passedPreview.class].joined(separator: ".") + "_Preview"
            guard let classType = Bundle.main.classNamed(className) as? WebPreview.Type else {
                fatalError("Class \(className) doesn't conform to WebberPreview")
            }
            
            let previewData = classType.result
            
            guard let b64html = previewData.html.data(using: .utf8)?.base64EncodedString() else {
                fatalError("Unable to encode into b64html")
            }
            result.previews.append(.init(
                width: previewData.width,
                height: previewData.height,
                title: previewData.title,
                module: passedPreview.module,
                class: passedPreview.class,
                html: b64html
            ))
        }
        do {
            guard let res = String(data: try JSONEncoder().encode(result), encoding: .utf8) else {
                fatalError("Unable to encode result")
            }
            print(res)
        } catch {
            fatalError("\(error)")
        }
        exit(0)
    }
    #endif
    
    private func start() {
        parseAppBuilderItem(app.appBuilderContent)
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
        parseAppBuilderItem(app.appBuilderContent)
    }
    
    var rootPaths: [String: String] = [:]
    var lastResponse: PageController?
    
    func handleRoute(_ req: Request) {
        do {
            if let lastResponse = lastResponse {
                // pass respond to view controller's subrouter
                if let lastReq = lastResponse.controller.req {
                    if let rp = rootPaths[lastReq.path] {
                        if req.path.starts(with: rp) {
                            rootPaths[req.path] = rp
                            if try lastResponse.controller.canRespond(req, rp) {
                                return
                            }
                        }
                    }
                }
                #if arch(wasm32)
                lastResponse.controller.willUnload()
                _ = document.domElement.body.removeChild(lastResponse.controller.view)
                lastResponse.controller.didRemoveFromDOM()
                lastResponse.controller.didUnload()
                #endif
            }
            let response = try defaultResponder.respond(to: req)!
            #if arch(wasm32)
            for fragment in response.controller.fragments {
                do {
                    let rootPath: String
                    if let rp = req.route?.rootPath?.joined(separator: "/") {
                        rootPath = rp.hasPrefix("/") ? rp : "/\(rp)"
                    } else {
                        rootPath = req.path
                    }
                    rootPaths[req.path] = rootPath
                    _ = try fragment.canRespond(req, rootPath)
                } catch {
                    print("Unable to render subroute: \(error)")
                }
            }
            response.controller.willLoad(with: req)
            let _ = document.domElement.body.appendChild(response.controller.view)
            response.controller.req = req
            response.controller.didAddToDOM()
            response.controller.didLoad(with: req)
            #endif
            lastResponse = response
        } catch {
            // TODO: use predefined beautiful error handler which should be customizable
            #if arch(wasm32)
            document.domElement.body.object?.innerHTML = "\(error)".jsValue
            #endif
        }
    }
    
    @AppBuilder open var app: AppBuilder.Content { _AppContent(appBuilderContent: .none) }
    
    #if WEBPREVIEW
    public var stylesheets: [Stylesheet] = []
    #else
    var stylesheets: [Stylesheet] = []
    #endif
    
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

extension WebApp {
    /// Registers service worker by its name
    ///
    /// If your SwifWeb service target name is **Service** then pass just lowercased **service**
    ///
    /// If you register your custom js service file, then pass just the name
    /// of the file without extension and place it in the root folder
    public func registerServiceWorker(_ name: String) {
        Navigator.shared.serviceWorker?.register("./\(name).js")
    }
    
    /// Adds script into `<head>`
    public func addScript(_ path: String) {
        document.head.appendChild(Script().src(path))
    }
    
    /// Adds style link into `<head>`
    public func addStylesheet(_ relativePath: String) {
        document.head.appendChild(Link()
            .rel(.stylesheet)
            .type("text/css")
            .href(relativePath))
    }
    
    public func addStylesheet(@Rules content: @escaping Rules.Block) {
        document.head.appendChild(Stylesheet(content: content))
    }
    
    /// Adds font link into `<head>`
    ///
    /// Default type is **woff2**
    public func addFont(_ relativePath: String, _ type: String? = nil) {
        let type = type ?? relativePath.components(separatedBy: ".").last ?? "woff2"
        document.head.appendChild(Link()
            .as(.font)
            .rel(.preLoad)
            .type("font/\(type)")
            .href(relativePath))
    }
    
    public enum IconType: String {
        case icon
        case appleTouch = "apple-touch-icon"
        case mask = "mask-icon"
        case shortcut = "shortcut icon"
    }
    
    /// Adds icon link into `<head>`
    ///
    /// Default type is **icon**
    public func addIcon(_ relativePath: String, type: IconType = .icon, color: String? = nil) {
        document.head.appendChild(Link()
            .as(.font)
            .rel(.init(type.rawValue))
            .type("icons/\(type)")
            .href(relativePath))
    }
}

extension WindowLifecycle {
    /// Called when app just started
    public func didFinishLaunching(_ handler: @escaping (WebApp) -> Void) -> Self {
        didFinishLaunching({ handler(WebApp.shared) })
    }
    
    /// Called when app just started
    public static func didFinishLaunching(_ handler: @escaping (WebApp) -> Void) -> Self {
        Self.didFinishLaunching({ handler(WebApp.shared) })
    }
}
