//
//  LiveView.swift
//  LivePreview
//
//  Created by Mihael Isaev on 31.01.2021.
//

#if os(macOS) && canImport(SwiftUI) && DEBUG && !arch(wasm32)
import SwiftUI
import WebKit
#endif

#if !arch(wasm32)
public final class LiveView: PreviewLiveviewable {
    let webView: WKWebView
    
    public init () {
        let preferences = WKPreferences()
        preferences.javaScriptEnabled = true
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        webView = WKWebView(frame: .zero, configuration: configuration)
        webView.allowsBackForwardNavigationGestures = false
        previewLiveView = self
    }
    
    public func makeNSView(context: Context) -> NSView { webView }
    
    public func updateNSView(_ view: NSView, context: Context) {
        let items = updateHandler().compactMap {
            $0 as? _PreviewRenderable
        }.map {
            $0.renderPreview()
        }
        let data = items.count > 0 ? items.joined() : "nothing to render"
        webView.loadHTMLString("""
        <html>
            <head></head>
            <body>
                \(data)
            </body>
        </html>
        """, baseURL: nil)
    }
    
    var updateHandler: () -> [PreviewRenderable] = { [] }
    
    public func executeJS(_ js: String) {
        guard previewMode == .dynamic else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.webView.evaluateJavaScript("""
            (() => {
            \(js)
            return 'ok';
            })();
            """) { _,_ in }
        }
    }
}
#endif
#if os(macOS) && canImport(SwiftUI) && DEBUG && !arch(wasm32)
@available(macOS 10.15, *)
extension LiveView: NSViewRepresentable {
    @discardableResult
    public func onUpdate(_ handler: @escaping () -> [PreviewRenderable]) -> Self {
        updateHandler = handler
        return self
    }
}
#endif
