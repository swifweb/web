//
//  Stylesheet.swift
//  CSS
//
//  Created by Mihael Isaev on 29.11.2020.
//

import DOM

public protocol Stylesheetable {}

open class Stylesheet: BaseElement, Stylesheetable {
    public typealias Rule = CSSRule
    public typealias RuleItems = Rules.Content
    open override class var name: String { "style" }
    
    lazy var sheet: JSValue = domElement.sheet
    
    public private(set) var _rawStyles: [String] = []
    public private(set) var _rules: [CSSRule] = []
    public private(set) var _keyframes: [Keyframes] = []
    public private(set) var _medias: [MediaRule] = []
    
    public convenience init(@Rules content: @escaping Rules.Block) {
        self.init()
        parseRulesItem(content().rulesContent)
        processRules()
    }
    
    @discardableResult
    public func rules(@Rules content: @escaping Rules.Block) -> Self {
        parseRulesItem(content().rulesContent)
        processRules()
        return self
    }
    
    public override func postInit() {
        super.postInit()
        parseRulesItem(rules.rulesContent) // it is additional, don't remove
    }
    
    @Rules open var rules: RuleItems { _RulesContent(rulesContent: .none) }
    
    private func parseRulesItem(_ item: Rules.Item) {
        switch item {
        case .raw(let v): _rawStyles.append(v)
        case .items(let v): v.forEach { parseRulesItem($0) }
        case .rule(let v): _rules.append(v)
        case .keyframes(let v): _keyframes.append(v)
        case .media(let v): _medias.append(v)
        case .none: break
        }
    }
    
    public func findRuleIndex(by selector: String) -> Int? {
        guard let ruleObject = sheet.cssRules.object else { return nil }
        let keys: [String] = JSObject.global[dynamicMember: "Object"].jsValue.function?.keys?(ruleObject).array?.compactMap { $0.string } ?? []
        for key in keys {
            if sheet.cssRules[dynamicMember: key].selectorText.string == selector {
                return Int(key)
            }
        }
        return nil
    }
    
    public func deleteRule(_ index: Int) {
        sheet.deleteRule.function?.callAsFunction(optionalThis: sheet.object, arguments: [index])
    }
    
    @discardableResult
    public func addRawStyle(_ cssText: String) -> Int {
        #if !WEBPREVIEW
        guard let index = sheet.insertRule.function?.callAsFunction(optionalThis: sheet.object, cssText)?.number else { return -1 }
        return Int(index)
        #else
        _rawStyles.append(cssText)
        #endif
        return -1
    }
    
    @discardableResult
    public func addRule(_ rule: CSSRule) -> Int {
        let cssText = rule.render()
        #if !WEBPREVIEW
        guard let index = sheet.insertRule.function?.callAsFunction(optionalThis: sheet.object, cssText)?.number else { return -1 }
        rule.domElement = sheet.cssRules.item.function?.callAsFunction(optionalThis: sheet.cssRules.object, Int(index))
        return Int(index)
        #else
        _rules.append(rule)
        #endif
        return -1
    }
    
    @discardableResult
    public func addKeyframesRule(_ kf: Keyframes) -> Int {
        let cssText = kf.render()
        #if !WEBPREVIEW
        guard let index = sheet.insertRule.function?.callAsFunction(optionalThis: sheet.object, cssText)?.number else { return -1 }
        kf.domElement = sheet.rules.item.function?.callAsFunction(optionalThis: sheet.rules.object, Int(index))
        return Int(index)
        #else
        _keyframes.append(kf)
        #endif
        return -1
    }
    
    @discardableResult
    public func addMediaRule(_ m: MediaRule) -> Int {
        let cssText = m.render()
        #if !WEBPREVIEW
        guard let index = sheet.insertRule.function?.callAsFunction(optionalThis: sheet.object, cssText)?.number else { return -1 }
        m.domElement = sheet.rules.item.function?.callAsFunction(optionalThis: sheet.rules.object, Int(index))
        return Int(index)
        #else
        _medias.append(m)
        #endif
        return -1
    }
    
    public func processRules() {
        if sheet.object != nil {
            _rawStyles.forEach {
                addRawStyle($0)
            }
            _rules.forEach {
                addRule($0)
            }
            _keyframes.forEach {
                addKeyframesRule($0)
            }
            _medias.forEach {
                addMediaRule($0)
            }
        } else {
            var style = "\r\n"
            style.append(_rawStyles.joined(separator: "\n"))
            style.append(_rules.map { $0.render() }.joined(separator: "\n"))
            style.append(_keyframes.map { $0.render() }.joined(separator: "\n"))
            style.append(_medias.map { $0.render() }.joined(separator: "\n"))
            style.append("\r\n")
            domElement.innerHTML = style.jsValue
        }
    }
    
    open override func didAddToDOM() {
        super.didAddToDOM()
        disabled(_disabled)
        processRules()
    }
    
    /// Representing the advisory title of the current style sheet.
    public var title: String {
        get { domElement.title.string ?? "" }
        set { domElement.title = newValue.jsValue }
    }
    
    /// Deletes the rule at the specified index into the stylesheet's rule list
    func deleteRule() {
        
    }
    
    /// Inserts a new rule at the specified position in the stylesheet, given the textual representation of the rule
    func insertRule() {
        
    }
    
    /// Shows whether the current stylesheet has been applied or not
    public var disabled: Bool {
        get { sheet.disabled.boolean ?? false }
        set { sheet.disabled = newValue.jsValue }
    }

    /// Representing the location of the stylesheet
    public var href: String? {
        get { sheet.href.string }
    }

    /// Returns a MediaList representing the intended destination medium for style information.
    public var media: String? {
        get { sheet.media.string }
    }

    /// Returns a Node associating this style sheet with the current document.
    var ownerNode: JSValue {
        get { sheet.ownerNode }
    }

    /// Returns a StyleSheet including this one, if any; returns null if there aren't any.
    public var parentStyleSheet: String? {
        get { sheet.parentStyleSheet.string }
    }

    /// Returns a DOMString representing the style sheet language for this style sheet.
    public var type: String? {
        get { sheet.type.string }
    }
    
    public private(set) var _disabled = false
    
    /// Disables stylesheet
    @discardableResult
    public func disabled(_ value: Bool) -> Self {
        #if !WEBPREVIEW
        domElement.disabled = value.jsValue
        #endif
        _disabled = value
        return self
    }
    
    /// Disables stylesheet
    @discardableResult
    public func disabled<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        disabled(value.stateValue.wrappedValue)
        value.stateValue.listen { self.disabled($0) }
        return self
    }
}

open class RulesGroup: RulesContent, Stylesheetable {
    public typealias Rule = CSSRule
    public typealias RuleItems = Rules.Content
    
    public var rulesContent: Rules.Item {
        .items(_rawStyles.map { .raw($0) } + _rules.map { .rule($0) } + [rules.rulesContent] + _keyframes.map { .keyframes($0) } + _medias.map { .media($0) })
    }
    
    public private(set) var _rawStyles: [String] = []
    public private(set) var _rules: [CSSRule] = []
    public private(set) var _keyframes: [Keyframes] = []
    public private(set) var _medias: [MediaRule] = []
    
    public init () {}
    
    public convenience init(@Rules content: @escaping Rules.Block) {
        self.init()
        parseRulesItem(content().rulesContent)
    }
    
    @discardableResult
    public func rules(@Rules content: @escaping Rules.Block) -> Self {
        parseRulesItem(content().rulesContent)
        return self
    }
    
    private func parseRulesItem(_ item: Rules.Item) {
        switch item {
        case .raw(let v): _rawStyles.append(v)
        case .items(let v): v.forEach { parseRulesItem($0) }
        case .rule(let v): _rules.append(v)
        case .keyframes(let v): _keyframes.append(v)
        case .media(let v): _medias.append(v)
        case .none: break
        }
    }
    
    @Rules open var rules: RuleItems { [_RulesContent(rulesContent: .none)] }
}
