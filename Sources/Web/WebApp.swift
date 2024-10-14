//
//  WebApp.swift
//  Web
//
//  Created by Mihael Isaev on 15.11.2020.
//

import Foundation
import CSS

private var webapp: WebApp!

open class WebApp {
    public typealias Configuration = AppBuilder.Content
    
    public static func main() {
        Self.start()
    }
    
    private var isStarted = false
    
    #if !arch(wasm32)
    fileprivate var _scripts: [Script] = []
    fileprivate var _links: [Link] = []
    fileprivate var _stylesheets: [Stylesheet] = []
    #endif
    
    public static var shared: WebApp {
        #if arch(wasm32)
        return webapp /// because it is already started in `main()`
        #else
        guard webapp == nil else {
            return webapp
        }
        webapp = WebApp.start()
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
        #if !arch(wasm32)
        var args = CommandLine.arguments
        if args.count > 1 {
            if args.contains("--previews") {
                webapp.previewStart(args)
            }
            if args.contains("--index") {
                webapp.renderIndex()
            }
            exit(0)
        }
        #else
        webapp.start()
        #endif
        return webapp
    }
    
    #if !arch(wasm32)
    private func renderIndex() {
        var styles: [String] = []
        var scripts: [String] = []
        var links: [String] = []
        var splash: Splash?
        var index: Index?
        func parseAppBuilderItem(_ item: AppBuilder.Item) {
            switch item {
            case .lifecycle(let v): ExtractWindowLifecycleListeners(v).didFinishLaunching.forEach { $0() }
            case .items(let v):  for i in v { parseAppBuilderItem(i) }
            case .splash(let v): splash = v
            case .index(let v): index = v
            case .stylesheet(let v): styles.append(v.renderPreview(singleQuotes: false))
            default: break
            }
        }
        parseAppBuilderItem(app.appBuilderContent)
        for s in _stylesheets {
            styles.append(s.renderPreview(singleQuotes: false))
        }
        for s in _scripts {
            scripts.append(s.renderPreview(singleQuotes: false))
        }
        for l in _links {
            links.append(l.renderPreview(singleQuotes: false))
        }
        struct SplashData: Encodable {
            let styles: [String]
            let scripts: [String]
            let links: [String]
            let pathToFile: String?
            let body: String?
        }
        var splashData: SplashData?
        if let splash {
            splashData = SplashData(
                styles: styles.compactMap { $0.data(using: .utf8)?.base64EncodedString() },
                scripts: scripts.compactMap { $0.data(using: .utf8)?.base64EncodedString() },
                links: scripts.compactMap { $0.data(using: .utf8)?.base64EncodedString() },
                pathToFile: splash.pathToHTML,
                body: splash.pathToHTML != nil ? nil : splash.renderPreview(singleQuotes: false).data(using: .utf8)?.base64EncodedString()
            )
        }
        struct IndexData: Encodable {
            let title: String?
            let metas: [[String: String]]?
            let links: [[String: String]]?
            let scripts: [[String: String]]?
            let splash: SplashData?
        }
        let indexData = IndexData(
            title: index?.title,
            metas: index?.metas,
            links: index?.links,
            scripts: index?.scripts,
            splash: splashData
        )
        if let data = try? JSONEncoder().encode(indexData), let str = String(data: data, encoding: .utf8) {
            print("==INDEX-START==")
            print(str)
            print("==INDEX-END==")
        }
    }
    #endif
    
    #if !arch(wasm32)
    private func previewStart(_ args: [String]) {
        var args = args
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
    /// Calls only once from `renderPreview()`
    internal func _previewStart() {
        guard !_previewStarted else { return }
        _previewStarted = true
        parseAppBuilderItem(app.appBuilderContent)
    }
    
    var rootPaths: [String: String] = [:]
    var lastResponse: AnyPageController?
    
    func handleRoute(_ req: Request) {
        do {
            if let lastResponse = lastResponse {
                // pass respond to view controller's subrouter
                if let lastReq = lastResponse.controller.req {
                    if let rp = rootPaths[lastReq.path] {
                        if req.path.starts(with: rp) {
                            rootPaths[req.path] = rp
                            if try lastResponse.controller.canRespond(req, rp, level: 0) {
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
                    _ = try fragment.canRespond(req, rootPath, level: 0)
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
    
    public var stylesheets: [Stylesheet] = []
    
    private func parseAppBuilderItem(_ item: AppBuilder.Item) {
        switch item {
        case .items(let v): v.forEach { parseAppBuilderItem($0) }
        case .lifecycle(let v): window.addLifecycleListener(v)
        case .splash(let v): break
        case .index(let v): break
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
        let script = Script().src(path)
        #if arch(wasm32)
        document.head.appendChild(script)
        #else
        _scripts.append(script)
        #endif
    }
    
    /// Adds style link into `<head>`
    public func addStylesheet(_ relativePath: String) {
        let link = Link()
            .rel(.stylesheet)
            .type("text/css")
            .href(relativePath)
        #if arch(wasm32)
        document.head.appendChild(link)
        #else
        _links.append(link)
        #endif
    }
    
    public func addStylesheet(@Rules content: @escaping Rules.Block) {
        let stylesheet = Stylesheet(content: content)
        #if arch(wasm32)
        document.head.appendChild(stylesheet)
        #else
        _stylesheets.append(stylesheet)
        #endif
    }
    
    /// Adds font link into `<head>`
    ///
    /// Default type is **woff2**
    public func addFont(_ relativePath: String, _ type: String? = nil) {
        let type = type ?? relativePath.components(separatedBy: ".").last ?? "woff2"
        let link = Link()
            .as(.font)
            .rel(.preLoad)
            .type("font/\(type)")
            .href(relativePath)
        #if arch(wasm32)
        document.head.appendChild(link)
        #else
        _links.append(link)
        #endif
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
        let link = Link()
            .as(.font)
            .rel(.init(type.rawValue))
            .type("icons/\(type)")
            .href(relativePath)
        #if arch(wasm32)
        document.head.appendChild(link)
        #else
        _links.append(link)
        #endif
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
