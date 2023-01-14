//
//  File.swift
//  
//
//  Created by Mihael Isaev on 26.02.2021.
//

import DOM

private struct RawStylesKey: StorageKey {
    typealias Value = [String]
}
private struct RulesKey: StorageKey {
    typealias Value = [CSSRule]
}
private struct KeyframesKey: StorageKey {
    typealias Value = [Keyframes]
}
private struct MediaRuleKey: StorageKey {
    typealias Value = [MediaRule]
}

extension Style {
    public var rawStyles: [String] {
        get { storage[RawStylesKey.self] ?? [] }
        set { storage[RawStylesKey.self] = newValue }
    }
    public var rules: [CSSRule] {
        get { storage[RulesKey.self] ?? [] }
        set { storage[RulesKey.self] = newValue }
    }
    public var keyframes: [Keyframes] {
        get { storage[KeyframesKey.self] ?? [] }
        set { storage[KeyframesKey.self] = newValue }
    }
    public var medias: [MediaRule] {
        get { storage[MediaRuleKey.self] ?? [] }
        set { storage[MediaRuleKey.self] = newValue }
    }
    
    public convenience init(@Rules content: @escaping Rules.Block) {
        self.init()
        parseRulesItem(content().rulesContent)
        apply()
    }

    private func apply() {
        var result = ""
        rawStyles.forEach { raw in
            result.append(raw)
        }
        rules.forEach { rule in
            result.append(rule._pointers.map { $0.pointer.selector }.joined(separator: ","))
            result.append("{")
            result.append(rule._properties.map { $0.key + ":" + $0.value }.joined(separator: ";"))
            result.append("}")
        }
        keyframes.forEach {
            result.append($0.render())
        }
        medias.forEach {
            result.append($0.render())
        }
        domElement.innerText = result.jsValue
    }

    private func parseRulesItem(_ item: Rules.Item) {
        switch item {
        case .raw(let v): rawStyles.append(v)
        case .items(let v): v.forEach { parseRulesItem($0) }
        case .rule(let v): rules.append(v)
        case .keyframes(let v): keyframes.append(v)
        case .media(let v): medias.append(v)
        case .forEach(let fr): fr.allItems().forEach { parseRulesItem($0.rulesContent) }
        case .none: break
        }
    }
}
