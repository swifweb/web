//
//  LivePreview.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

#if !arch(wasm32)
var previewMode: PreviewMode = .static
var previewLiveView: LiveView!
#endif

#if os(macOS) && canImport(SwiftUI) && DEBUG && !arch(wasm32)
import SwiftUI
import WebKit
#endif

#if !arch(wasm32)
public final class LiveView {
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
//        webView.evaluateJavaScript("""
//        (() => {
//        let div = document.createElement('div');
//        div.innerText = 'Hello from swift';
//        div.style.color = 'red';
//        document.body.appendChild(div);
//        return 'ok';
//        })();
//        """) { (result, error) in
////            self.webView.loadHTMLString("result: \(result)", baseURL: nil)
////            self.webView.loadHTMLString("error: \(error)", baseURL: nil)
//        }
//        var data = ""
//        if let el = updateHandler() as? _AnyElement {
//            data = "<\(el.name) id=\"\(el.uid)\"></\(el.name)>"
//        }
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
    
    var updateHandler: () -> [PreviewRenderable] = { [H1("no html")] }
    
    func executeJS(_ js: String) {
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

public enum PreviewColorScheme {
    case light, dark
    @available(macOS 10.15, *)
    fileprivate var val: SwiftUI.ColorScheme {
        switch self {
        case .light: return .light
        case .dark: return .dark
        }
    }
}

public struct UIKitPreviewDevice {
    let name: String
    
    public init (_ name: String) {
        self.name = name
    }
    
    ///     "None"
    public static var none: Self { .init("none") }
    ///     "Mac"
    public static var mac: Self { .init("Mac") }
}

public enum PreviewMode {
    /// Default mode, it is blazing fast but without javascript, absolutely static html
    case `static`
    /// Experimental WIP mode, it simulates real WASM app
    /// through WebView's JS bridge, but it will never be like real WASM
    case dynamic
}

@available(macOS 10.15, *)
public class Preview {
    var colorScheme: PreviewColorScheme = .light
    var device: UIKitPreviewDevice = .mac
    var layout: PreviewLayout = .fixed(width: 320, height: 240)
    var title: String = "Preview"
    var items: [PreviewRenderable] = []
//    var language: Language = Localization().detectCurrentLanguage()
    
    public init(@RenderBuilder content: @escaping RenderBuilder.Block) {
        parseRenderBuilderItem(content().renderBuilderContent)
    }
    
    private func parseRenderBuilderItem(_ item: RenderBuilder.Item) {
        switch item {
        case .items(let v): v.forEach { parseRenderBuilderItem($0) }
        case .item(let v): items.append(v)
        case .none: break
        }
    }
    
    @discardableResult
    public func colorScheme(_ v: PreviewColorScheme) -> Self {
        colorScheme = v
        return self
    }
    
    @discardableResult
    public func size(width: CGFloat, height: CGFloat) -> Self {
        layout = .fixed(width: width, height: height)
        return self
    }
    
    @discardableResult
    public func size(_ value: CGFloat) -> Self {
        layout = .fixed(width: value, height: value)
        return self
    }
    
    @discardableResult
    public func title(_ v: String) -> Self {
        title = v
        return self
    }
    
//    /// Preview mode, select between fast **static** or slower but **dynamic**
//    @discardableResult
//    public func mode(_ v: PreviewMode) -> Self {
//        previewMode = v
//        return self
//    }
    
//    @discardableResult
//    public func language(_ v: Language) -> Self {
//        language = v
//        return self
//    }
    
    fileprivate var liveView: some SwiftUI.View {
        LiveView()
            .onUpdate { self.items }
            .previewLayout(layout)
            .previewDisplayName(title)
            .edgesIgnoringSafeArea(.all)
            .previewDevice(device.name == "none" ? nil : PreviewDevice(rawValue: device.name))
    }
}

public protocol DeclarativePreview: SwiftUI.PreviewProvider {
    @available(macOS 10.15, *)
    static var preview: Preview { get }
}

extension DeclarativePreview {
    @available(macOS 10.15, *)
    public static var previews: some SwiftUI.View {
//        Localization.current = preview.language
        return preview.liveView
    }
}

public protocol DeclarativePreviewGroup: SwiftUI.PreviewProvider {
    @available(macOS 10.15, *)
    static var previewGroup: PreviewGroup { get }
}

extension DeclarativePreviewGroup {
    @available(macOS 10.15, *)
    public static var previews: some SwiftUI.View {
//        Localization.current = previewGroup.language
        return SwiftUI.Group {
            if previewGroup.previews.count > 0 {
                previewGroup.previews[0].liveView
            }
            if previewGroup.previews.count > 1 {
                previewGroup.previews[1].liveView
            }
            if previewGroup.previews.count > 2 {
                previewGroup.previews[2].liveView
            }
            if previewGroup.previews.count > 3 {
                previewGroup.previews[3].liveView
            }
            if previewGroup.previews.count > 4 {
                previewGroup.previews[4].liveView
            }
            if previewGroup.previews.count > 5 {
                previewGroup.previews[5].liveView
            }
            if previewGroup.previews.count > 6 {
                previewGroup.previews[6].liveView
            }
            if previewGroup.previews.count > 7 {
                previewGroup.previews[7].liveView
            }
            if previewGroup.previews.count > 8 {
                previewGroup.previews[8].liveView
            }
            if previewGroup.previews.count > 9 {
                previewGroup.previews[9].liveView
            }
        }
    }
}
#endif
