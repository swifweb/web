//
//  PreviewMode.swift
//  Web
//
//  Created by Mihael Isaev on 31.01.2021.
//

#if os(macOS) && canImport(SwiftUI) && DEBUG && !arch(wasm32)
public enum PreviewMode: StorageKey {
    public typealias Value = PreviewMode
    
    /// Default mode, it is blazing fast but without javascript, absolutely static html
    case `static`
    /// Experimental WIP mode, it simulates real WASM app
    /// through WebView's JS bridge, but it will never be like real WASM
    case dynamic
}

public protocol PreviewLiveviewable {
    func executeJS(_ js: String)
}

public struct PreviewLiveViewKey: StorageKey {
    public typealias Value = PreviewLiveviewable
}
#endif
