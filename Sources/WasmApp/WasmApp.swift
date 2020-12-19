import Foundation
import JavaScriptKit

private var wasmapp: WasmApp!

open class WasmApp {
    private var isStarted = false
    
    public static var shared: WasmApp { wasmapp }
    
    public private(set) lazy var window = Window()
    public var document: Document { window.document }
    lazy var defaultResponder = DefaultResponder(routes: routes)
    public internal(set) lazy var routes: RoutesStorage = .init()
    
    required public init () {}
    
    deinit {}
    
    public static func start() -> WasmApp {
        guard wasmapp == nil else { return wasmapp }
        wasmapp = Self()
        guard !wasmapp.isStarted else { return wasmapp }
        wasmapp.isStarted = true
        wasmapp.start()
        return wasmapp
    }
    
    private func start() {
        parseAppBuilderItem(body.appBuilderContent)
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
    
    var lastResponse: Response?
    
    func handleRoute(_ req: Request) {
        do {
            let response = try defaultResponder.respond(to: req)
            if let lastResponse = lastResponse {
                _ = document.domElement.body.removeChild(lastResponse.controller.view)
            }
            let _ = document.domElement.body.appendChild(response.controller.view)
            lastResponse = response
        } catch {
            // TODO: use predefined beautiful error handler which should be customizable
            document.domElement.body.object?.innerHTML = "\(error)".jsValue()
        }
    }
    
    @AppBuilder open var body: AppBuilderContent { _AppContent(appBuilderContent: .none) }
    
    private func parseAppBuilderItem(_ item: AppBuilder.Item) {
        switch item {
        case .items(let v): v.forEach { parseAppBuilderItem($0) }
        case .lifecycle(let v): window.addLifecycleListener(v)
        case .routes(let v): v.addRoutes(into: routes)
        case .none: break
        }
    }
}

class Script {
    fileprivate(set) var code = ""
    
    init () {}
    
    func addedToDocument() {}
}

