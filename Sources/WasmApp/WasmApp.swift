import Foundation
import JavaScriptKit
import WebCore

private var wasmapp: WasmApp!

open class WasmApp {
    private var isStarted = false
    
    public static var shared: WasmApp { wasmapp }
    
    public private(set) lazy var window = Window()
    public var document: Document { window.document }
    
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
    }
    
    @AppBuilder open var body: AppBuilderContent { _AppContent(appBuilderContent: .none) }
    
    private func parseAppBuilderItem(_ item: AppBuilderItem) {
        switch item {
        case .items(let items): items.forEach { parseAppBuilderItem($0) }
        case .lifecycle(let v): window.addLifecycleListener(v)
        case .none: break
        }
    }
}

