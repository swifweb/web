//
//  Style.swift
//  WasmApp
//
//  Created by Mihael Isaev on 16.12.2020.
//

import Foundation

/// The HTML `<style>` element contains style information for a document, or part of a document.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/style)
open class Style: BaseElement, _LoadHandleable {
    var loadClosure: LoadClosure?
    var loadHandler: (UIEvent) -> Void = { _ in }
    
    deinit {
        loadClosure?.release()
    }
    
    var _rules: [CSSRule] = []
    
    public convenience init(@Rules content: @escaping Rules.Block) {
        self.init()
        parseRulesItem(content().rulesContent)
        applyRules()
    }
    
    private func applyRules() {
        var result = ""
        _rules.forEach { rule in
            result.append(rule._pointers.map { $0.pointer.selector }.joined(separator: ","))
            result.append("{")
            result.append(rule._properties.map { $0.key + ":" + $0.value }.joined(separator: ";"))
            result.append("}")
        }
        domElement.innerText = result.jsValue()
    }
    
    private func parseRulesItem(_ item: Rules.Item) {
        switch item {
        case .items(let v): v.forEach { parseRulesItem($0) }
        case .rule(let v): _rules.append(v)
        case .none: break
        }
    }
}
