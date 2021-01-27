//
//  PreviewBuilder.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

#if os(macOS)  && canImport(SwiftUI) && DEBUG && !arch(wasm32)
import AppKit
import SwiftUI

@available(macOS 10.15, *)
public class PreviewGroup {
    let previews: [Preview]
//    var language: Language = Localization().detectCurrentLanguage()
    
    public init (@PreviewBuilder block: PreviewBuilder.Block) {
        previews = block().previewBuilderItems
    }
    
//    @discardableResult
//    public func language(_ v: Language) -> Self {
//        language = v
//        return self
//    }
}

@available(macOS 10.15, *)
public protocol PreviewBuilderItem {
    var previewBuilderItems: [Preview] { get }
}

@available(macOS 10.15, *)
public struct PreviewBuilderItems: PreviewBuilderItem {
    public let items: [Preview]
    
    public init (items: [Preview]) {
        self.items = items
    }
    
    public var previewBuilderItems: [Preview] { items }
}

@available(macOS 10.15, *)
extension Preview: PreviewBuilderItem {
    public var previewBuilderItems: [Preview] { [self] }
}

@available(macOS 10.15, *)
@_functionBuilder public struct PreviewBuilder {
    public typealias Block = () -> PreviewBuilderItem
    
    /// Builds an empty preview from an block containing no statements, `{ }`.
    public static func buildBlock() -> PreviewBuilderItem { [] }
    
    /// Passes a single preview written as a child view (e..g, `{ Text("Hello") }`) through unmodified.
    public static func buildBlock(_ attrs: PreviewBuilderItem...) -> PreviewBuilderItem {
        buildBlock(attrs)
    }
    
    /// Passes a single preview written as a child view (e..g, `{ Text("Hello") }`) through unmodified.
    public static func buildBlock(_ attrs: [PreviewBuilderItem]) -> PreviewBuilderItem {
        PreviewBuilderItems(items: attrs.flatMap { $0.previewBuilderItems })
    }
    
    /// Provides support for "if" statements in multi-statement closures, producing an `Optional` preview
    /// that is visible only when the `if` condition evaluates `true`.
    public static func buildIf(_ content: PreviewBuilderItem?) -> PreviewBuilderItem {
        guard let content = content else { return [] }
        return content
    }
    
    /// Provides support for "if" statements in multi-statement closures, producing
    /// ConditionalContent for the "then" branch.
    public static func buildEither(first: PreviewBuilderItem) -> PreviewBuilderItem {
        first
    }

    /// Provides support for "if-else" statements in multi-statement closures, producing
    /// ConditionalContent for the "else" branch.
    public static func buildEither(second: PreviewBuilderItem) -> PreviewBuilderItem {
        second
    }
}

@available(macOS 10.15, *)
extension Array: PreviewBuilderItem where Element: Preview {
    public var previewBuilderItems: [Preview] { self }
}
#endif
