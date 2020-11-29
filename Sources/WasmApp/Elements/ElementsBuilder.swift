//
//  ElementsBuilder.swift
//  WasmApp
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation

public protocol ElementsBuilderContent {
    var elementsBuilderContent: ElementsBuilderItem { get }
}

public enum ElementsBuilderItem {
    case none
    case elements([AnyElement])
    case items([ElementsBuilderItem])
}

struct EBContent: ElementsBuilderContent {
    let elementsBuilderContent: ElementsBuilderItem
}

@_functionBuilder public struct ElementsBuilder {
    public typealias Result = ElementsBuilderContent
    public typealias Block = () -> ElementsBuilderContent
    
    public static func buildBlock() -> Result {
        EBContent(elementsBuilderContent: .none)
    }
    
    public static func buildBlock(_ attrs: ElementsBuilderContent...) -> Result {
        buildBlock(attrs)
    }
    
    public static func buildBlock(_ attrs: [ElementsBuilderContent]) -> Result {
        EBContent(elementsBuilderContent: .items(attrs.map { $0.elementsBuilderContent }))
    }
    
    public static func buildIf(_ content: ElementsBuilderContent?) -> Result {
        guard let content = content else { return EBContent(elementsBuilderContent: .none) }
        return EBContent(elementsBuilderContent: .items([content.elementsBuilderContent]))
    }
    
    public static func buildEither(first: ElementsBuilderContent) -> Result {
        EBContent(elementsBuilderContent: .items([first.elementsBuilderContent]))
    }

    public static func buildEither(second: ElementsBuilderContent) -> Result {
        EBContent(elementsBuilderContent: .items([second.elementsBuilderContent]))
    }
}
