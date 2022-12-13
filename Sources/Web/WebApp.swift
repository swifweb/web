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
            Localization.shared.defaultLanguage = classType.language
            Localization.shared.currentLanguage = classType.language
            guard let b64html = classType.html.data(using: .utf8)?.base64EncodedString() else {
                fatalError("Unable to encode into b64html")
            }
            result.previews.append(.init(
                width: classType.width,
                height: classType.height,
                title: classType.title,
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
                lastResponse.controller.didRemoveFromDOM()
                #endif
            }
            #if arch(wasm32)
            let _ = document.domElement.body.appendChild(response.controller.view)
            response.controller.didAddToDOM()
            #endif
            lastResponse = response
        } catch {
            // TODO: use predefined beautiful error handler which should be customizable
            #if arch(wasm32)
            document.domElement.body.object?.innerHTML = "\(error)".jsValue
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
