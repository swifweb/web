//
//  File.swift
//  
//
//  Created by Mihael Isaev on 26.02.2021.
//

import DOM

private struct RulesKey: StorageKey {
    typealias Value = [CSSRule]
}
private struct KeyframesKey: StorageKey {
    typealias Value = [Keyframes]
}

extension Style {
    public var rules: [CSSRule] {
        get { storage[RulesKey.self] ?? [] }
        set { storage[RulesKey.self] = newValue }
    }
    public var keyframes: [Keyframes] {
        get { storage[KeyframesKey.self] ?? [] }
        set { storage[KeyframesKey.self] = newValue }
    }
    
    public convenience init(@Rules content: @escaping Rules.Block) {
        self.init()
        parseRulesItem(content().rulesContent)
        apply()
    }

    private func apply() {
        var result = ""
        rules.forEach { rule in
            result.append(rule._pointers.map { $0.pointer.selector }.joined(separator: ","))
            result.append("{")
            result.append(rule._properties.map { $0.key + ":" + $0.value }.joined(separator: ";"))
            result.append("}")
        }
        keyframes.forEach {
            result.append($0.render())
        }
        domElement.innerText = result.jsValue()
    }

    private func parseRulesItem(_ item: Rules.Item) {
        switch item {
        case .items(let v): v.forEach { parseRulesItem($0) }
        case .rule(let v): rules.append(v)
        case .keyframes(let v): keyframes.append(v)
        case .none: break
        }
    }
}
