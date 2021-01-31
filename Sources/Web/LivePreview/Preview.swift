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

public protocol AnyPreview {}

@available(macOS 10.15, *)
public class Preview<App: PreviewableApp>: AnyPreview {
    var colorScheme: PreviewColorScheme = .light
    var layout: PreviewLayout = .fixed(width: 320, height: 240)
    var title: String = "Preview"
    var items: [PreviewRenderable] = []
//    var language: Language = Localization().detectCurrentLanguage()
    
    public init(@RenderBuilder content: @escaping RenderBuilder.Block) {
        App.start()
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
            .previewDevice(PreviewDevice(rawValue: "mac"))
    }
}

public protocol DeclarativePreview: SwiftUI.PreviewProvider {
    associatedtype App: PreviewableApp
    
    @available(macOS 10.15, *)
    static var preview: Preview<App> { get }
}

extension DeclarativePreview {
    @available(macOS 10.15, *)
    public static var previews: some SwiftUI.View {
//        Localization.current = preview.language
        return preview.liveView
    }
}
#endif
